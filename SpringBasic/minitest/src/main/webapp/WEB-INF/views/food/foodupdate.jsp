<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!--        <h1>Header</h1>-->
        <!--        네비게이션바 추가 시작-->
        <div class="row">
            <div class="col">
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Features</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Pricing</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
        <!--        네비게이션바 추가 끝-->

        <!--        class="row content"-->
        <div class="row content">
            <!--        col-->
            <div class="col">
                <!--        카드 시작 부분-->
                <div class="card">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                        <%--                         입력 폼 여기에 작성--%>
                        <form action="/food/foodupdate" method="post">

                            <input type="hidden" name="page" value="${pageRequestDTO.page}">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="input-group mb-3">
                                <span class="input-group-text">Tno</span>
                                <input type="text" name="tno" class="form-control" readonly
                                       value=
                                <c:out value="${foodDTO.tno}"></c:out>>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">menu</span>
                                <input type="text" name="menu" class="form-control" placeholder="제목을 입력해주세요"
                                       value=<c:out value="${foodDTO.menu}"></c:out>>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">price</span>
                                <input type="text" name="price" class="form-control" readonly
                                       value=<c:out value="${foodDTO.price}"></c:out>>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">DueDate</span>
                                <input type="date" name="dueDate" class="form-control"
                                       value=<c:out value="${foodDTO.dueDate}"></c:out>>
                            </div>
                            <div class="input-group mb-3">
                                <label class="form-check-label">Finished &nbsp</label>
                                <input type="checkbox" name="finished" class="form-check-input"
                                ${foodDTO.finished ? "checked" : ""}>
                            </div>
                            <div class="my-4">
                                <div class="float-end">
                                    <button type="submit" class="btn btn-primary">저장하기</button>
                                    <button type="button" class="btn btn-danger">삭제하기</button>
                                    <button type="button" class="btn btn-secondary">목록가기</button>
                                </div>
                            </div>
                        </form>
                        <%--                        food 입력 폼 여기에 작성--%>

                    </div>
                </div>

            </div>

        </div>

    </div>

    <div class="row footer">
        <!--        <h1>Footer</h1>-->
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
</div>

<script>
    const serverValidResult = {};
    <c:forEach items="${errors}" var="error">
    serverValidResult['${error.getField()}'] = '${error.defaultMessage}'
    </c:forEach>
    console.log(serverValidResult)
</script>


<script>
    // 수정폼
    document.querySelector(".btn-primary").addEventListener("click",
        function (e) {
            self.location = "/food/foodupdate?tno=" +${foodDTO.tno}
                , false
        })
    // 목록
    document.querySelector(".btn-secondary").addEventListener("click",
        function (e) {
            self.location = "/food/FoodList${pageRequestDTO.link}"
                , false
        })

    // 삭제기능.
    document.querySelector(".btn-danger").addEventListener("click",
        function (e) {
            const formObj = document.querySelector("form")
            e.preventDefault()
            e.stopPropagation()

            formObj.action = "/food/fooddelete"
            formObj.method = "post"
            formObj.submit()
        }, false)


</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>