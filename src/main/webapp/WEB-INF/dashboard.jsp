<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Dashboard Page</title>
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
					<h1 class="pt-5">
						Welcome,
						<c:out value="${loggedInUser.userName}" />
					</h1>
				</div>
				<div class="align-self-end p-4">
					<a href="/logout">Log out</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="d-flex">
				<div class="flex-fill p-2">
					<h4>Books from eveyone's shelves:</h4>
				</div>
				<div class="align-self-end p-4">
					<a href="/books/new">+ Add to my shelf</a>
				</div>
			</div>
		</div>
		<div class="row">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Title</th>
						<th scope="col">Author Name</th>
						<th scope="col">Posted By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<tr>
							<td>${book.id}</td>
							<td><a href="books/${book.id}">${book.title}</a></td>
							<td>${book.author}</td>
							<td>${book.user.userName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>