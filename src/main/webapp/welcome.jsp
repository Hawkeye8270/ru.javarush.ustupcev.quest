<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Code and Portals - Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
<div class="container mt-5">
    <h1 class="display-4 text-center fw-bold ">Welcome!</h1>

    <p class="mt-4, fs-4">
        Мой друг, предлагаю тебе пройти небольшой тест. </p>
<br>

    <p class="mt-5 fs-5">Ты согласен? Тогда введи свое имя:</p>

    <form action="${pageContext.request.contextPath}/start" method="POST" class="mt-3">
        <div class="mb-3">
            <label for="name" class="form-label">Имя</label>
            <input type="text" class="form-control" id="name" name="name" required maxlength="10" pattern=".{1,10}">
            <div class="form-text">Длина не более 10ти знаков.</div>
        </div>

        <input type="hidden" name="stepId" value="1">
        <button type="submit" class="btn btn-primary">Старт</button>
    </form>
</div>

</body>
</html>
