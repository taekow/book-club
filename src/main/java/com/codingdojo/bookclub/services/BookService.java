package com.codingdojo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	// get all book
	public List<Book> findAllBooks() {
		return bookRepository.findAll();
	}
	
	// Retrieve book by Id
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	// Create a new book
	public Book createBook(Book newBook) {
		return bookRepository.save(newBook);
	}

	// Update existing book
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}

	// Delete existing book
	public void deleteBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		
		if (optionalBook.isPresent()) {
			bookRepository.deleteById(id);
		}
	}
}
