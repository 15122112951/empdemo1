<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>addEmp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal" id="addEmpForm" action="${pageContext.request.contextPath}/addemp" method="post">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-6 name">
                    <input type="email" class="form-control" id="name" name="name">
                </div>
                <div class="col-sm-4 checkName">
                </div>
            </div>

            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="phone" name="phone">
                </div>
                <div class="col-sm-4 checkPhone">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-6">
                    <label>
                        <input type="radio" name="sex" value="男">
                        男
                    </label>
                    <label>
                        <input type="radio" name="sex" value="女">
                        女
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="salary" class="col-sm-2 control-label">工资</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="salary" name="salary">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">部门</label>
                <div class="col-sm-6">
                    <select class="form-control" name="dept_id">
                        <c:forEach items="${depts}" var="dept">
                            <option value="${dept.id}">${dept.dname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-primary sub">确认</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        var isName = false;
        var isPhone = false;
        //姓名验证
        $("#name").blur(function () {
            var name = $(this).val();
            var reg = /^[\u4e00-\u9fa5]{2,4}$/;
            if (reg.test(name)) {
                $(".name").addClass("has-success");
                /*$(".checkName").empty();
                $(".checkName").removeClass("glyphicon glyphicon-ok");
                $(".checkName").addClass("glyphicon glyphicon-ok");
                $(".checkName").css("color","green");*/
                isName = true;
            } else {
                $(".name").addClass("has-error");
                /*$(".checkName").empty();
                $(".checkName").removeClass("glyphicon glyphicon-ok");
                $(".checkName").html("请输入2~4个汉字");
                $(".checkName").css("color","red");*/
                isName = false;
            }
        });
        //手机号码验证
        $("#phone").blur(function () {
            var phone = $(this).val();
            var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (reg.test(phone)) {
                $(".checkPhone").empty();
                $(".checkPhone").attr("class","col-sm-4 checkPhone glyphicon glyphicon-ok");
                $(".checkPhone").css("color","green");
                isPhone = true;
            } else {
                $(".checkPhone").empty();
                $(".checkPhone").attr("col-sm-4 checkPhone");
                $(".checkPhone").html("请输入有效的手机号码");
                $(".checkPhone").css("color","red");
                isPhone = false;
            }
        });

        $("#phone").keyup(function () {
            var phone = $(this).val();
            phone = phone.replace(/[^\d]/g,"");
            $(this).val(phone);

        });

        $(".sub").click(function () {
            if (isName && isPhone){
                $("#addEmpForm").submit();
            }
        });


    });
</script>

</body>
</html>
