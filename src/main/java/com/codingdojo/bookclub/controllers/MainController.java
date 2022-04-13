package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	//******* Register post route ********//
	//login page
	@GetMapping("/")
	public String index(
			@ModelAttribute("newUser") User newUser,
			@ModelAttribute("newLogin") LoginUser loginUser) {
		
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, 
			HttpSession session,
			@ModelAttribute("newLogin") LoginUser loginUser) {
		// Validate a user
		userService.validate(newUser, result);
		if(result.hasErrors()) {
			
			return "index.jsp";
		}
		// Register a user
		userService.registerUser(newUser);
		// Put user in Session
		session.setAttribute("loggedInUser", newUser);
		
		return "redirect:/books";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser loginUser,
			BindingResult result,
			HttpSession session,
			@ModelAttribute("newUser") User newUser) {
		// Authenticate a user
		userService.authenticateUser(loginUser, result);
		if(result.hasErrors()) {
			
				return "index.jsp";
			}
		
		User loggedInUser = userService.findUserByEmai(loginUser.getEmail());
		
		// put user in session
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/books";
	}
	
	//******* Logout get route ********//
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//******* DASHBOARD get route ********//
	@GetMapping("/books")
	public String dashboard(
			Model model,
			HttpSession session) {
		
		if(session.getAttribute("loggedInUser") != null) {
			model.addAttribute("books", bookService.findAllBooks()); 
			return "dashboard.jsp";
		} else {
			return "redirect:/";
		}
	}
	
	//******* New Book get route ********//
	@GetMapping("books/new")
	public String newBook(@ModelAttribute("newBook") Book newBook,
			HttpSession session) {
		if(session.getAttribute("loggedInUser") != null) {
			return "new.jsp";
		}
		
		return "redirect:/";
	}
	
	@PostMapping("books/create")
	public String createBook(
			@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result, 
			HttpSession session) {
		
		if(result.hasErrors()) {
			return "new.jsp";
		}
		
		bookService.createBook(newBook);
		
		return "redirect:/books";
	}
	
	//******* Book get route ********//
	@GetMapping("/books/{id}")
	public String showBook(
			@PathVariable("id") Long id,
			Model model,
			HttpSession session) {
		
		if(session.getAttribute("loggedInUser") != null) {
			
			Book book = bookService.findBook(id);
			model.addAttribute("book", book);
			model.addAttribute("user", userService.findUserByEmai("loggedInUser"));
			
			return "details.jsp";
		}
		
		return "redirect:/";
	}
	
	//******* Edit Book get route ********//
	@GetMapping("/books/{id}/edit")
	public String editBook(
			@PathVariable("id") Long id,
			Model model, 
			HttpSession session) {
		
		if(session.getAttribute("loggedInUser") != null) {
			
			Book book = bookService.findBook(id);
			model.addAttribute("book", book);
			
			return "edit.jsp";
		}
		
		return "redirect:/";
	}
	
	@PutMapping("/books/{id}")
	public String updateBook(
			@Valid @ModelAttribute("book") Book book,
			BindingResult result) {
		
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		
		bookService.updateBook(book);
		
		return "redirect:/books";
	}
}