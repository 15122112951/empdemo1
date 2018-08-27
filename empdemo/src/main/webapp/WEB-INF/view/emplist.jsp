<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zc">
<head>
    <meta charset="UTF-8">
    <title>emplist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>

<body>
<div class="container">
    <div class="row head"></div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" class="chooseAll"></th>
                <th>#</th>
                <th>姓名</th>
                <th>手机</th>
                <th>性别</th>
                <th>工资</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="emp" varStatus="index">
                <tr>
                    <td><input type="checkbox" class="check" delete-id="${emp.id}"></td>
                    <td>${index.index+1}</td>
                    <td>${emp.name}</td>
                    <td>${emp.phone}</td>
                    <td>${emp.sex}</td>
                    <td>${emp.salary}</td>
                    <td>${emp.dept.dname}</td>
                    <td>
                        <button type="button" class="btn btn-info update-btn">修改</button>
                        <button type="button" class="btn btn-danger delete-btn" delete-id="${emp.id}">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary save-btn">增加</button>
            <button type="button" class="btn btn-danger" id="delete-btn">删除</button>
        </div>

        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">
                        <%--class="disabled"--%>
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${!pageInfo.isFirstPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emplist?pageNum=${pageInfo.prePage}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--<li class="active"><a href="#">1</a></li>--%>
                    <c:if test="${pageInfo.pages - pageInfo.pageNum >= 4}">
                        <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum + 4}" var="num"
                                   varStatus="index">
                            <c:if test="${index.index == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index == pageInfo.pageNum)}">
                                <li><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <c:if test="${!(pageInfo.pages - pageInfo.pageNum >= 4)}">
                        <c:forEach begin="${pageInfo.pages - 4 > 0 ? pageInfo.pages - 4 : 1}" end="${pageInfo.pages}" var="num"
                                   varStatus="index">
                            <c:if test="${index.index == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                            <c:if test="${!(index.index == pageInfo.pageNum)}">
                                <li><a href="${pageContext.request.contextPath}/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>

                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${!pageInfo.isLastPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emplist?pageNum=${pageInfo.nextPage}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".delete-btn").click(function () {
            var id = $(this).attr("delete-id");
            location.href = "${pageContext.request.contextPath}/deleteOne?id=" + id;
        });


        $(".chooseAll").click(function () {
            $(".check").prop("checked",$(this).prop("checked"));
            /*var choose = $(this).prop("checked");
            $(".check").each(function () {
                if (choose){
                    $(".check").prop("checked",true);
                } else {
                    $(".check").prop("checked",false);
                }
            })*/
        });

        $("#delete-btn").click(function () {
            var ids = [];
            $(".check").each(function () {
                var id = $(this).attr("delete-id");
                var choose = $(this).prop("checked");
                if (choose){
                    ids[ids.length] = id;
                }
            });
            location.href = "${pageContext.request.contextPath}/deleteOne?id=" + ids;
        });

        $(".save-btn").click(function () {
            location.href = "${pageContext.request.contextPath}/addempview";
        });
    });
</script>
</body>
</html>
