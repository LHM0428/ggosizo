package com.ggosizo.controller.hm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/matzip")
public class MatzipController {

	@RequestMapping("")
	public String matzip(){
		
		return "/matzip/matzip";
	}
}
