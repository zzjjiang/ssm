<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Demo</title>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
</head>
<body>
<h2>用户登录</h2>
<p>请输入账号、密码登录</p>
<div style="margin:20px 0;"></div>
<div class="easyui-panel" title="登录" style="width:400px">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post" action="login">
            <table cellpadding="5">
                <tr>
                    <td>Name:</td>
                    <td><input class="easyui-textbox" type="text" name="username" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input class="easyui-passwordbox" type="text" name="password" data-options="required:true"></input></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#my').window('open')">Register</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>


        <div id="my" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save',closed:true" style="width:500px;height:200px;padding:10px;">
            <form id="register" method="post" action="login">
                <table cellpadding="5">
                    <tr>
                        <td>Name:</td>
                        <td><input class="easyui-textbox" type="text" name="username" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input class="easyui-passwordbox" type="text" name="password" data-options="required:true"></input></td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="register()">register</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="registerClear()">Clear</a>
            </div>
        </div>
    </div>
</div>
<script>
    function submitForm(){
        $('#ff').form('submit', {
            url:"/login",
            success:function(data){
                var data = eval('(' + data + ')');
                if(data.code == "ok"){
                    $.messager.alert('提示','登陆成功!','info',function () {
                        window.location.href = "http://localhost:8080/main"
                    });
                }else {
                    $.messager.alert('提示','用户不存在或密码错误!','info',function () {
                        window.location.href = "http://localhost:8080/login"
                    });
                }

            }
        });

    }
    function clearForm(){
        $('#ff').form('clear');
    }
    function register(){
        $('#register').form('submit', {
            url:"/register",
            success:function(data){
                var data = eval('(' + data + ')');
                if(data.code == 'ok'){
                    $.messager.alert('提示','注册成功!','info');
                }else {
                    $.messager.alert('提示','注册失败!','info');
                }
            }
        });
    }
    function registerClear(){
        $('#register').form('clear');
    }

</script>
</body>
</html>