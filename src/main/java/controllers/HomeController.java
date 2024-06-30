package controllers;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.RatingImpl;
import entities.RatingProducts;

@Controller
public class HomeController {
	@Autowired
	RatingImpl ratingService;
	
	 @RequestMapping(value = "product-detail/add-rating", method = RequestMethod.POST)
	    public String addRating(Model model, @Valid @ModelAttribute("rating") RatingProducts rating,
	                            BindingResult result, HttpServletRequest request) {
	        if (result.hasErrors()) {
	            System.out.println(result);
	        } else {
	            try {
	            	System.out.println(rating.toString());
	                ratingService.create(rating);
	            } catch (NoResultException e) {
	                e.printStackTrace();
	            }
	        }
	        String referer = request.getHeader("Referer");
	        return "redirect:" + referer;
	    }

}
