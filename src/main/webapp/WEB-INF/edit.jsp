<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Edit Page</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="js/app.js"></script>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="d-flex">
  				<div class="flex-fill p-2">
  					<h1 class="pt-5">Change Your Entry</h1>
				</div>
				<div class="align-self-end p-4">
					<a href="/books">Back to the shelves</a>
				</div>
		  	</div>
		</div>
		<div class="row">
			<form:form action="/books/${book.id}" method="post" modelAttribute="book">
				<input type="hidden" name="_method" value="put">
				<div class="form-group pt-3">
					<form:label path="title">Title:</form:label>
			        <form:errors path="title" class="text-danger"/>
			        <form:input type="text" path="title" class="form-control" style="width:500px;"/>
			    </div>
			    <div class="form-group pt-3">
			        <form:label path="author">Author:</form:label>
					<form:errors path="author" class="text-danger"/>
					<form:input type="text" path="author" class="form-control" style="width:500px;"/>
			    </div>
			    <div class="form-group pt-3">
			        <form:label path="thoughts">My Thoughts:</form:label>
			        <form:errors path="thoughts" class="text-danger"/>     
			        <form:textarea path="thoughts" class="form-control"  rows="5" style="width:500px;"/>
			    </div>
			    <div>
					<input type="submit" class="btn btn-info mt-3" value="Update"/>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>