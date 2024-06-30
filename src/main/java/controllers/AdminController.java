package controllers;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.AccountImpl;
import dao.CategoryImpl;
import dao.OrderImpl;
import dao.ProductImpl;
import entities.Account;
import entities.Category;
import entities.CategoryPage;
import entities.ImgProduct;
import entities.Order;
import entities.Product;
import entities.ProductPage;
import util.Cipher;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	AccountImpl accountService;
	@Autowired
	CategoryImpl cateImpl;
	@Autowired
	ProductImpl proImpl;
	@Autowired
	OrderImpl orderDao;
	@RequestMapping(value = { "", "home" })
	public String index(Model model) {
		model.addAttribute("page", "index");
		return "admin";
	}

	// product
	@RequestMapping(value = "product")
	public String product(Integer cateid, Integer pageno, Model model) {
		cateid = cateid == null ? 0 : cateid;
		pageno = pageno == null ? 1 : pageno;
		model.addAttribute("categories", cateImpl.getAll());
		model.addAttribute("cateid", cateid);
		ProductPage propage = proImpl.paging(cateid, pageno, 10);
		model.addAttribute("page", "product");
		model.addAttribute("category", cateImpl.getAll());
		model.addAttribute("products", propage.getProducts());
		model.addAttribute("totalpage", propage.getTotalPages());
		model.addAttribute("currentpage", pageno);
		model.addAttribute("imgProducts", proImpl.getAllImg());
		return "admin";
	}

	@RequestMapping(value = "addproduct")
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("category", cateImpl.getAll());
		model.addAttribute("page", "addproduct");
		return "admin";
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)

	public String saveProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("picture") MultipartFile file, @RequestParam("files") MultipartFile[] files,
			Model model, HttpServletRequest req) {
		if (file.isEmpty()) {
			model.addAttribute("page", "addproduct");
			model.addAttribute("fileError","Vui lòng chọn ảnh");
			model.addAttribute("category",cateImpl.getAll());
			model.addAttribute("product", product);
			return "admin";
		}
		
		if (result.hasErrors()) {
			model.addAttribute("page", "addproduct");
			model.addAttribute("product", product);
			model.addAttribute("category",cateImpl.getAll());
			return "admin";
		} 
			
		if (file != null && !file.isEmpty()) {
				String uploadRootPath = req.getServletContext().getRealPath("resources/images");
				File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
				try {
					file.transferTo(destination);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				product.setImage(file.getOriginalFilename());
			}
			product.setCreateDate(Date.valueOf(LocalDate.now()));
			proImpl.create(product);
			if (files != null) {
				ImgProduct imgPro = null;
				for (MultipartFile f : files) {
					String uploadRootPath = req.getServletContext().getRealPath("resources/images");
					File destination = new File(uploadRootPath + "/" + f.getOriginalFilename());
					try {
						f.transferTo(destination);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					imgPro = new ImgProduct(f.getOriginalFilename(), product.getProId());
					proImpl.create(imgPro);
				}
			}
			
			return "redirect:/admin/product";
		}


	@RequestMapping(value = "editproduct/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		model.addAttribute("page", "editproduct");
		model.addAttribute("product", proImpl.getById(id));
		model.addAttribute("category", cateImpl.getAll());
		return "admin";
	}

	@RequestMapping(value = "/updateproduct", method = RequestMethod.POST)

	public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("picture") MultipartFile file, @RequestParam("files") MultipartFile[] files,
			Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			model.addAttribute("page", "editproduct");
			model.addAttribute("product", product);
			model.addAttribute("category",cateImpl.getAll());
			return "admin";
		} 
		if (file != null && !file.isEmpty()) {
			String uploadRootPath = req.getServletContext().getRealPath("resources/images");
			File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
			try {
				file.transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			product.setImage(file.getOriginalFilename());
		} else {
			var p = proImpl.getById(product.getProId());
			product.setImage(p.getImage());
		}
		product.setCreateDate(Date.valueOf(LocalDate.now()));
		proImpl.update(product);
		
		boolean isFileUploaded = false;
		// kiem tra xem file co file upload len hay khong
		if (files != null) {
		    for (MultipartFile f : files) {
		        if (!f.isEmpty()) {
		            isFileUploaded = true;
		        }
		    }
		}
		// Nếu có ít nhất một file mới được upload
		if (isFileUploaded) {
		    // Xóa ảnh cũ
		    proImpl.deleteImg(product.getProId());

		    // Thêm ảnh mới vào
		    for (MultipartFile f : files) {	        
		            String uploadRootPath = req.getServletContext().getRealPath("resources/images");
		            File destination = new File(uploadRootPath + "/" + f.getOriginalFilename());
		            try {
		                f.transferTo(destination);
		                ImgProduct imgPro = new ImgProduct(f.getOriginalFilename(), product.getProId());
		                proImpl.create(imgPro);
		            } catch (IllegalStateException | IOException e) {
		                e.printStackTrace();
		            }
		        }
			}
		return "redirect:/admin/product";

	}

	@RequestMapping(value = "deleteproduct/{id}")
	public String deleteProduct(@PathVariable("id") String id, Model model) {
		proImpl.deleteImg(id);
		proImpl.delete(id);		
		return "redirect:/admin/product";
	}

	// category

	@RequestMapping(value = "category")
	public String category(Integer pageno, Model model, HttpServletRequest req) {
		pageno = pageno == null ? 1 : Integer.parseInt(req.getParameter("pageno"));
		model.addAttribute("page", "category");
		CategoryPage categoryPage = cateImpl.paging(pageno, 10);
		model.addAttribute("categories", categoryPage.getCategories());
		model.addAttribute("totalpage", categoryPage.getTotalPages());
		model.addAttribute("currentpage", pageno);
		return "admin";
	}

	@RequestMapping(value = "addcategory")
	public String addCategory(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("page", "addcategory");
		return "admin";
	}

	@RequestMapping(value = "saveCategory", method = RequestMethod.POST)
	public String saveCategory(Model model, @Valid @ModelAttribute("category") Category cate, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("page", "addcategory");
			return "admin";
		} else {
			cate.setCreateDate(Date.valueOf(LocalDate.now()));
			cateImpl.create(cate);
			return "redirect:/admin/category";
		}
	}

	@RequestMapping(value = "editcategory/{id}")
	public String editCategory(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", cateImpl.getById(id));
		model.addAttribute("page", "editcategory");
		return "admin";
	}

	@RequestMapping(value = "updateCategory", method = RequestMethod.POST)
	public String updateCategory(Model model, @Valid @ModelAttribute("category") Category cate, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("page", "editcategory");
			return "admin";
		} else {
			cate.setCreateDate(Date.valueOf(LocalDate.now()));
			cateImpl.update(cate);
			return "redirect:/admin/category";
		}
	}

	@RequestMapping(value = "deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") int id, Model model) {
		List<Product> p =proImpl.getByCateId(id);
		if(!p.isEmpty()) {
		return "redirect:/admin/category";
		}
		cateImpl.delete(id);
		return "redirect:/admin/category";
	}

	// login admin
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		return "admin/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginProcess(String username, String password, Model model, HttpServletRequest req) {
		Account acc = accountService.getAccount(username);
		String passMd5 = Cipher.GenerateMD5(password);
		if (acc == null || !acc.getPassword().equals(passMd5) || !acc.getRole().equals("admin")) {
			model.addAttribute("msg", "Thông tin đăng nhập sai hoặc bạn không có quyền!");
			return "admin/login";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("adminid", acc.getId());
		session.setAttribute("adminpicture", acc.getPicture());
		session.setAttribute("adminfullname", acc.getFullname());
		return "redirect:/admin";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/admin";
	}
	
	//order 
	@RequestMapping(value = "order")
	public String order(Model model) {
		model.addAttribute("page", "order");
		model.addAttribute("orders",orderDao.getAll());
		model.addAttribute("account", accountService.getAll());
		return "admin";
	}
	@RequestMapping(value = "editorder/{id}")
	public String editOrder(@PathVariable("id") String id, Model model) {
		model.addAttribute("order", orderDao.getOrder(id));
		model.addAttribute("page", "editorder");
		model.addAttribute("account", accountService.getAll());
		return "admin";
	}
	
	@RequestMapping(value = "updateorder",method = RequestMethod.POST)
	public String updateOrder(@ModelAttribute("order") Order order, Model model) {
		orderDao.update(order);
		return "redirect:/admin/order";
	}
	
	@RequestMapping(value = "orderdetail/{id}")
	public String orderDetail(@PathVariable("id") String id, Model model) {
		model.addAttribute("order", orderDao.getOrder(id));
		model.addAttribute("page", "orderdetail");
		model.addAttribute("account", accountService.getAll());
		model.addAttribute("orderdetails",orderDao.getByOrder(id));
		model.addAttribute("product",proImpl.getAll());
		return "admin";
	}
}
