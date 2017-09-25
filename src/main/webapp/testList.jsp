<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<html>
<body>
	<h2>测试数据库操作</h2>
	<form action="${ctx }/testAdd" method="post">
		<input type="text" name="content"> <input type="submit"
			value="提交"></input>
	</form>
	<table style="width: 500px;" border="1">
		<tr>
			<td>ID</td>
			<td>Content</td>
			<td>操作</td>
		<tr>
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.id }</td>
					<td>${item.content }</td>
					<td><a href="${ctx }/testDel?id=${item.id}">删除</a></td>
				<tr>
			</c:forEach>
	</table>
</body>
</html>