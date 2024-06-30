package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AccountImpl;
import dao.CategoryImpl;
import dao.OrderImpl;
import dao.ProductImpl;
import dao.RatingImpl;
@Controller
@RequestMapping("admin")
public class UserController {
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
	
	@RequestMapping(value = "/users")
	public String getListUser(Model model) {
		model.addAttribute("page", "users");
		model.addAttribute("listUser", accountService.getAll());
		return "admin";
	}
}
