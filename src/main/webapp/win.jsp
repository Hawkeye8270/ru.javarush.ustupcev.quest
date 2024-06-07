<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Code and Portals - Config</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <jsp:useBean id="name" scope="request" class="java.lang.String"/>
    <h1 class="display-4 text-center fw-bold">Config, ${name}!</h1>

    <p class="mt-4 fs-4">Молодец!!! Ты победил!</p>

    <form action="${pageContext.request.contextPath}/start" method="POST" class="mt-3">
        <input type="hidden" name="stepId" value="1">
        <input type="hidden" name="name" value="${name}">
        <button type="submit" class="btn btn-primary">Начать заново</button>
        <c:set var="gameCount" scope="session" value="${sessionScope.gameCount + 1}"/>
    </form>
</div>
</body>
</html>
