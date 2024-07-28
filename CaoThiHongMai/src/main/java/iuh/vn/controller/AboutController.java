package iuh.vn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import iuh.vn.commom.CommomDataService;
import iuh.vn.entities.User;

@Controller
public class AboutController extends CommomController {

	@Autowired
	CommomDataService commomDataService;

	@GetMapping(value = "/aboutUs")
	public String about(Model model, User user) {

		commomDataService.commonData(model, user);
		return "web/about";
	}
}
