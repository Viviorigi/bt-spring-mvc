package controllers;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.AccountImpl;
import dao.CategoryImpl;
import dao.OrderDao;
import dao.OrderImpl;
import dao.ProductImpl;
import dao.RatingImpl;
import entities.Account;
import entities.Cart;
import entities.ImgProduct;
import entities.Order;
import entities.OrderDetail;
import entities.Product;
import entities.ProductPage;
import entities.RatingProducts;
import util.Cipher;

@Controller
public class CustomerController {
	@Autowired
	CategoryImpl cateImpl;
	@Autowired
	ProductImpl proImpl;
	@Autowired
	AccountImpl accountService;
	@Autowired
	OrderImpl orderDao;
	@Autowired
	RatingImpl ratingDao;

	@RequestMapping(value = { "", "home" })
	public String index(Model model) {
		model.addAttribute("page", "index");
		model.addAttribute("products", proImpl.getLastProduct());
		model.addAttribute("productsComing", proImpl.getComingProduct());
		return "home";
	}

	@RequestMapping(value = "product-detail/{slug}")
	public String productDetail(@PathVariable("slug") String slug, Model model) {
		model.addAttribute("page", "product-detail");
		Product product = proImpl.getBySlug(slug);
		model.addAttribute("product", product);
		model.addAttribute("category", cateImpl.getAll());
		 List<RatingProducts> ratings = ratingDao.getAllByProductId(product.getProId());
		   model.addAttribute("ratings", ratings);	
		return "home";
	}

	@RequestMapping(value = "product-category")
	public String listProductCategory(String searchName, String sort, Integer page, Model model, Float pricefrom,
			Float priceto) {
		page = page == null ? 1 : page;
		pricefrom = pricefrom == null ? 0 : pricefrom;
		priceto = priceto == null ? 500000000 : priceto;
		searchName = searchName == null ? "" : searchName;
		model.addAttribute("category", cateImpl.getAll());
		ProductPage propage = proImpl.getSort(sort, page, 8, pricefrom, priceto, searchName);
		model.addAttribute("page", "productcategory");
		model.addAttribute("products", propage.getProducts());
		model.addAttribute("totalpage", propage.getTotalPages());
		model.addAttribute("currentpage", page);
		return "home";
	}

	@RequestMapping(value = "productbycate")
	public String listProductSortCategory(int cateid, String searchName, Integer page, String sort, Model model,
			Float pricefrom, Float priceto) {
		page = page == null ? 1 : page;
		pricefrom = pricefrom == null ? 0 : pricefrom;
		priceto = priceto == null ? 500000000 : priceto;
		searchName = searchName == null ? "" : searchName;
		model.addAttribute("category", cateImpl.getAll());
		model.addAttribute("cateid", cateid);
		ProductPage propage = proImpl.getByCateIdSort(cateid, sort, page, 8, pricefrom, priceto, searchName);
		model.addAttribute("products", propage.getProducts());
		model.addAttribute("totalpage", propage.getTotalPages());
		model.addAttribute("currentpage", page);
		model.addAttribute("page", "productbycate");
		return "home";
	}

	@RequestMapping(value = "blog")
	public String blog(Model model) {
		model.addAttribute("page", "blog");
		return "home";
	}

	@RequestMapping(value = "login")
	public String login(Model model) {
		model.addAttribute("page", "login");
		return "home";
	}

	@RequestMapping(value = "postlogin", method = RequestMethod.POST)
	public String postLogin(String username, String password, Model model, HttpServletRequest req) {
		Account acc = accountService.getAccount(username);
		String passMd5 = Cipher.GenerateMD5(password);
		if (acc == null || !acc.getPassword().equals(passMd5) || !acc.getRole().equals("user")) {
			model.addAttribute("msg", "Thông tin đăng nhập sai ");
			model.addAttribute("page", "login");
			return "home";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("userid", acc.getId());
		session.setAttribute("userimage", acc.getPicture());
		session.setAttribute("userfullname", acc.getFullname());
		session.setAttribute("username", acc.getUsername());
		model.addAttribute("page", "index");
		model.addAttribute("products", proImpl.getLastProduct());
		model.addAttribute("productsComing", proImpl.getComingProduct());
		return "home";
	}

	@RequestMapping(value = "logout")
	public String logout(Model model, HttpServletRequest req) {
		req.getSession().invalidate();
		model.addAttribute("page", "login");
		return "home";
	}

	@RequestMapping(value = "register")
	public String register(Model model) {
		model.addAttribute("page", "register");
		model.addAttribute("account", new Account());
		return "home";
	}

	@RequestMapping(value = "postRegister")
	public String postRegister(@ModelAttribute("account") Account account, Model model) {
		String pass = Cipher.GenerateMD5(account.getPassword());
		account.setPassword(pass);
		account.setStatus(true);
		account.setRole("user");
		accountService.createAccount(account);
		model.addAttribute("page", "login");
		return "home";
	}

	@RequestMapping(value = "contact")
	public String contact(Model model) {
		model.addAttribute("page", "contact");
		return "home";
	}

	// GET: countItems "trả về số lượng  trong giỏ hàng"
	@RequestMapping(value = "countItems")
	public @ResponseBody String getItems(Model model, HttpServletRequest req) {
		List<Cart> carts = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("cart") != null) {
			carts = (List<Cart>) session.getAttribute("cart");
		}
		return String.valueOf(carts.size());
	}

	// GET: addItem "thêm  vào giỏ hàng và trả về tổng số sách trong giỏ"
	@RequestMapping(value = "addItem/{id}")
	public @ResponseBody String addItem(@PathVariable("id") String proId, HttpServletRequest req) {
		System.out.println(proId);
		List<Cart> carts = new ArrayList<>();
		HttpSession session = req.getSession();
		Product p = proImpl.getById(proId);
		if (session.getAttribute("cart") == null) {
			Cart cart = new Cart(p.getProId(), p.getProName(), p.getSlug(), p.getImage(), p.getPrice(), 1);
			carts.add(cart);
			session.setAttribute("cart", carts);
		} else {
			carts = (List<Cart>) session.getAttribute("cart");
			boolean duplicate = false;
			for (int i = 0; i < carts.size(); i++) {
				Cart c = carts.get(i);
				if (c.getProId().equals(proId)) {
					c.setQuantity(c.getQuantity() + 1);
					duplicate = true;
					break;
				}
			}
			if (duplicate)
				session.setAttribute("cart", carts);
			else {
				Cart basket = new Cart(p.getProId(), p.getProName(), p.getSlug(), p.getImage(), p.getPrice(), 1);
				carts.add(basket);
			}
		}
		session.setAttribute("cart", carts);
		return String.valueOf(carts.size());
	}

	// GET: updateBasket/{id}/{value} "cập nhật lại số lượng đặt trong giỏ hang"
	@RequestMapping(value = "updateCart/{id}/{value}")
	public @ResponseBody String updateBasket(@PathVariable("id") String proId , @PathVariable("value") Integer quantity,
			Model model, HttpServletRequest req) {
		List<Cart> carts = new ArrayList<>();
		int i;
		HttpSession session = req.getSession();
		if (session.getAttribute("cart") != null) {
			carts = (List<Cart>) session.getAttribute("cart");
			for (i = 0; i < carts.size(); i++) {
				Cart c = carts.get(i);
				if (c.getProId().equals(proId)) {
					c.setQuantity(quantity);
					break;
				}
			}
		}
		boolean find = false;
		if (session.getAttribute("cart") != null) {
			carts = (List<Cart>) session.getAttribute("cart");
			for (i = 0; i < carts.size(); i++) {
				Cart c = carts.get(i);
				if (c.getQuantity()==0) {
					find = true;
					c.setQuantity(quantity);
					break;
				}
			}
			if (find) {
				carts.remove(i);
			}
		}
		
		return "";
	}

	// GET: removeItem/{id} "xóa một san pham "
	@RequestMapping(value = "removeItem/{id}")
	public @ResponseBody String removeItem(@PathVariable("id") String proId, HttpServletRequest req) {
		List<Cart> carts = new ArrayList<>();
		HttpSession session = req.getSession();
		boolean find = false;
		if (session.getAttribute("cart") != null) {
			int i;
			carts = (List<Cart>) session.getAttribute("cart");
			for (i = 0; i < carts.size(); i++) {
				Cart c = carts.get(i);
				if (c.getProId().equals(proId)) {
					find = true;
					break;
				}
			}
			if (find) {
				carts.remove(i);
			}
			session.setAttribute("cart", carts);
		}

		return "";
	}

	@RequestMapping(value = "cart")
	public String cart(Model model, HttpServletRequest req) {
		model.addAttribute("page", "cart");
		List<Cart> carts = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("cart") != null) {
			carts = (List<Cart>) session.getAttribute("cart");
		}
		model.addAttribute("cart", carts);
		return "home";
	}
	
	@RequestMapping(value = "checkout")
	public String checkout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("userid") == null) {
			return "redirect:/login";
		}
		model.addAttribute("page", "checkout");
		String username=(String) session.getAttribute("username");
		
		List<Cart> carts = new ArrayList<>();
		if (session.getAttribute("cart") != null) {
			carts = (List<Cart>) session.getAttribute("cart");
		}
		model.addAttribute("cart", carts);
		model.addAttribute("user",accountService.getAccount(username));
		return "home";
	}
	
	//POST: dat-hang "xử lý đặt hang"
		@RequestMapping(value = "postCheckout")
		public String addOrder(String username,String fullname,String address, String phone, String orderNote, int paymentMethod,int userid, Model model, HttpServletRequest req) {
			
			List<Cart> carts=null;
			HttpSession session = req.getSession();
			Account accOld= accountService.getAccount(username);
			accOld.setFullname(fullname);
			accOld.setAddress(address);
			accOld.setPhone(phone);
			accountService.updateAccount(accOld);
			if (session.getAttribute("cart") != null) {
				carts = (List<Cart>) session.getAttribute("cart");
				Order order=new Order();
				String timeStamp = new SimpleDateFormat("yyMMdd-HHmmss").format(Calendar.getInstance().getTime());
				order.setOrderId("DH"+timeStamp);
				order.setAccountId(userid);			
				order.setNote(orderNote);
				order.setPaymentMethod(paymentMethod);
				order.setStatus(1);
				List<OrderDetail> orderdetails=new ArrayList<OrderDetail>();
				for (Cart c : carts) {
					orderdetails.add(new OrderDetail("DH"+timeStamp, c.getProId(), c.getQuantity(), c.getPrice()));
				}
				orderDao.insertOrderDetail(order, orderdetails);
				model.addAttribute("msg","Đặt hàng thành công");
			}
			model.addAttribute("page","checkoutsuccess");
			carts=new ArrayList<Cart>();
			session.setAttribute("cart", null);
			model.addAttribute("cart", carts);
			return "home";
		}
		
		@RequestMapping(value = "userprofile")
		public String userProfile(Model model, HttpServletRequest req) {
			HttpSession session = req.getSession();
			if (session.getAttribute("userid") == null) {
				return "redirect:/login";
			}
			String username=(String) session.getAttribute("username");
			int userid=(int) session.getAttribute("userid");
			model.addAttribute("user",accountService.getAccount(username));
			model.addAttribute("page", "userprofile");
			model.addAttribute("order",orderDao.getByAccount(userid));
			return "home";
		}
		@RequestMapping(value = "edituserprofile")
		public String editUserProfile(Model model, HttpServletRequest req) {
			HttpSession session = req.getSession();
			if (session.getAttribute("userid") == null) {
				return "redirect:/login";
			}
			String username=(String) session.getAttribute("username");
			model.addAttribute("user",accountService.getAccount(username));
			model.addAttribute("page", "edituserprofile");
			return "home";
		}
		
		@RequestMapping(value = "updateuser",method=RequestMethod.POST)
		public String updateUser( String username, String fullname,String phone,String address,
				@RequestParam("photo") MultipartFile file,
				Model model, HttpServletRequest req) {
			Account user=accountService.getAccount(username);
			HttpSession session = req.getSession();
			if (session.getAttribute("userid") == null) {
				return "redirect:/login";
			}
			
			if (file != null && !file.isEmpty()) {
					String uploadRootPath = req.getServletContext().getRealPath("resources/images");
					File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
					try {
						file.transferTo(destination);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					user.setPicture(file.getOriginalFilename());;
				}
				user.setAddress(address);
				user.setPhone(phone);
				user.setFullname(fullname);
				accountService.updateAccount(user);
				session.setAttribute("userfullname", fullname);
				return "redirect:/userprofile";
			}
		
		@RequestMapping(value = "customer-orderdetail/{id}")
		public String customerOrderDetail(@PathVariable("id") String id,Model model, HttpServletRequest req) {
			HttpSession session = req.getSession();
			if (session.getAttribute("userid") == null) {
				return "redirect:/login";
			}
			String username=(String) session.getAttribute("username");
			model.addAttribute("order", orderDao.getOrder(id));
			model.addAttribute("orderdetails",orderDao.getByOrder(id));
			model.addAttribute("product",proImpl.getAll());
			model.addAttribute("user",accountService.getAccount(username));
			model.addAttribute("page", "orderdetailcus");
			return "home";
		}
		@RequestMapping(value = "cancelorder/{id}")
		public String cancelOrder(@PathVariable("id") String id,Model model, HttpServletRequest req) {
			HttpSession session = req.getSession();
			if (session.getAttribute("userid") == null) {
				return "redirect:/login";
			}		
			Order order=orderDao.getOrder(id);
			order.setStatus(4);
			orderDao.update(order);
			return "redirect:/userprofile";
		}
}		
