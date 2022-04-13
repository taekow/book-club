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
<title>Detail Page</title>
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
						<c:out value="${book.title}"></c:out>
					</h1>
				</div>
				<div class="align-self-end p-4">
					<a href="/books">Back to the shelves</a>
				</div>
			</div>
		</div>
		<div class="row">
			<c:choose>
				<c:when test="${loggedInUser.id != book.user.id}">
					<h3>
						<c:out value="${book.user.userName}"></c:out>
						read
						<c:out value="${book.title}"></c:out>
						by
						<c:out value="${book.author}"></c:out>
					</h3>
					<h4 class="pt-3 pb-3">Here are their thoughts:</h4>
					<hr>
					<p class="pt-3 pb-3">
						<c:out value="${book.thoughts}" />
					</p>
					<hr>
				</c:when>
				<c:otherwise>
					<h3>
						You read
						<c:out value="${book.title}"></c:out>
						by
						<c:out value="${book.author}"></c:out>
					</h3>
					<h4 class="pt-3 pb-3">Here are your thoughts:</h4>
					<hr>
					<p class="pt-3 pb-3">
						<c:out value="${book.thoughts}" />
					</p>
					<hr>
					<a href="/books/${book.id}/edit"><button
							class="btn btn-outline-primary">Edit</button></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>