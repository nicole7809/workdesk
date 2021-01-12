<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인 </title>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="resource/script/jquery-3.1.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="resource/script/bootstrap.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script>
        $(function () {
            $("#account").blur(function () {
                var id = $("#account").val();    //获取序号值
                if (id == "" || id == null) {
                    return false;
                }
                $.ajax({
                    url: "user/checkLogin?account=" + id,
                    type: "post",
                    success: function (result) {
                        if (result == "false") {
                            $("#btn_login").attr({"disabled": "disabled"});
                            $("#error_msg_num").html("您输入的账号看起来有些问题，请联系管理员");
                            $("#error_msg_num").css("display", "inline");
                        }
                        if (result == "true") {
                            $("#btn_login").removeAttr("disabled");
                            $("#error_msg_num").html("");
                            $("#error_msg_num").css("display", "none");
                        }
                    }
                })

            });
            $("#btn_register").click(function () {
                alert("暂时不开放注册");
            });
            $("#changeCode,#verifyCode").click(function () {
                $("#verifyCode").attr('src', "code/verifyCode?" + Math.random());

            });
        })
    </script>
    <style>
        body {
            background: url(/images/3.jpg) no-repeat;
            background-size: 100%;
        }

        .modal-content {
            width: 400px;
        }

        .radio {
            padding-top: 20px;
        }

        .form-group {
            margin-left: auto;
            margin-right: auto;

        }

    </style>
</head>
<body>

<!--使用模态框的方式模拟一个登陆框-->
<div class="modal show " id="loginModal">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close">×</button>
                <h1 class="text-center text-primary">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form col-md-15 center-block" id="loginForm" action="/login.action" method="post">
                    <div class="form-group-lg" id="accountDiv">
                        <label class="sr-only" for="account">账号</label>
                        <div class="input-group col-xs-15">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-user"
                                                                 aria-hidden="true"></span></div>
                            <input class="form-control" id="account" name="account" type="text" placeholder="账号"
                                   required autofocus>
                        </div>
                        <div class="hidden text-center" id="accountMsg"><span
                                class="glyphicon glyphicon-exclamation-sign"></span>用户名不存在
                        </div>
                    </div>
                    <span id="error_msg_num"
                          style="display: none;color: #0066cc;font-weight: bold;font-size: 19px"></span>
                    <br>
                    <div class="form-group-lg" id="pwdDiv">
                        <label class="sr-only" for="password">密码</label>
                        <div class="input-group col-xs-15">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                            <input class="form-control" id="password" name="password" type="password" placeholder="密码"
                                   required>
                            <div class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></div>
                        </div>
                        <div class="hidden text-center" id="pwdMsg"><span
                                class="glyphicon glyphicon-exclamation-sign"></span>用户名密码错误
                        </div>
                    </div>

                    <div class="form-group-lg" id="code">
                        <label class="sr-only" for="checkCode">验证码</label>
                        <div class="input-group col-xs-15">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                            <input class="form-control" id="checkCode" name="checkCode" type="text" placeholder="验证码"
                                   required>
                            <div class="input-group-addon"><span class="glyphicon glyphicon-eye-open"></span></div>
                        </div>
                    </div>
                    <img id="verifyCode" src="code/verifyCode"/>
                    <label><a href="#" id="changeCode">换一张</a></label>
                    <span id="error_msg_password"
                          style="color: #0066cc;font-weight: bold;font-size: 19px">${error}</span>


                    <div class="form-group">

                        <button class="btn btn-default btn-lg col-md-4" id="btn_register" type="">注册</button>
                        <button class="btn btn-primary btn-lg col-md-4" id="btn_login" type="submit">登录</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!-- /container -->


</body>
</html>