<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Code and Portals - Outcome</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<div class="container mt-5">
<%--  <jsp:useBean id="outcome" scope="request" class="java.lang.String"/>--%>
  <jsp:useBean id="nextStep" scope="request" class="java.lang.String"/>
  <jsp:useBean id="name" scope="request" class="java.lang.String"/>
  <h1 class="display-4 text-center fw-bold">Мысли вслух</h1>

  <p class="mt-4 fs-4">${outcome}</p>

  <form action="${pageContext.request.contextPath}/start" method="POST" class="mt-3">
    <input type="hidden" name="stepId" value="${nextStep}">
    <input type="hidden" name="name" value="${name}">
    <button type="submit" class="btn btn-primary">Далее</button>
  </form>
</div>

</body>
</html>
