<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#myForm {
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container" id="main">
		<nav class="navbar navbar-custom navbar-fixed-top">
			<div class="container" id="navbar">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">PersonDB</a>
				</div>
			</div>
		</nav>
		<div class="container-fluid" id="myForm">
		<c:url var="addAction" value="/person/add"></c:url>

		<form:form action="${addAction}" commandName="person">
			<div class="container-fluid">
				<div class="panel panel-default">
					<div class="panel-heading">Add a Person</div>
					<table class="table">
						<c:if test="${!empty person.name}">
							<tr>
								<td><form:label path="id">
										<spring:message text="ID" />
									</form:label></td>
								<td><form:input path="id" readonly="true" size="8"
										disabled="true" /> <form:hidden path="id" /></td>
							</tr>
						</c:if>
						<tr>
							<td><form:label path="name">
									<spring:message text="Name" />
								</form:label></td>
							<td><form:input path="name" /></td>
						</tr>
						<tr>
							<td><form:label path="country">
									<spring:message text="Country" />
								</form:label></td>
							<td><form:input path="country" /></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty person.name}">
									<input type="submit"
										value="<spring:message text="Edit Person"/>" />
								</c:if> <c:if test="${empty person.name}">
									<input type="submit"
										value="<spring:message text="Add Person"/>" class="btn btn-success"/>
								</c:if></td>
						</tr>
					</table>
				</div>
			</div>
		</form:form>
		<br>

		<c:if test="${!empty listPersons}">
			
				<div class="panel panel-default">
					<div class="panel-heading">Persons List</div>
					<table class="table">
						<tr>
							<th >Person ID</th>
							<th >Person Name</th>
							<th >Person Country</th>
							<th >Edit</th>
							<th >Delete</th>
						</tr>
						<c:forEach items="${listPersons}" var="person">
							<tr>
								<td>${person.id}</td>
								<td>${person.name}</td>
								<td>${person.country}</td>
								<td><a href="<c:url value='/edit/${person.id}' />"><button type="button" class="btn btn-warning">Edit</button></a></td>
								<td><a href="<c:url value='/remove/${person.id}' />"><button type="button" class="btn btn-danger">Delete</button></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			
		</c:if>
		</div>
	</div>
</body>
</html>
