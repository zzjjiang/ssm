<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Demo</title>
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.7.0/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.7.0/demo/demo.css">
    <script type="text/javascript" src="../../jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
</head>
<body>
<h2>Basic Layout</h2>
<p>The layout contains north,south,west,east and center regions.</p>
<div style="margin:20px 0;"></div>
<div class="easyui-layout" style="width:700px;height:350px;">
    <div data-options="region:'north'" style="height:50px">
        <input class="easyui-searchbox" data-options="prompt:'Please Input Value',searcher:doSearch" style="width:300px"></input>
        <script>
            function doSearch(value){
                alert('You input: ' + value);
            }
        </script>
    </div>
    <div data-options="region:'west',split:true" title="菜单"  style="width:100px;">
        <div id="sm" class="easyui-sidemenu" data-options="data:menu"></div>
        <script type="text/javascript">
            var menu = [{
                text: '用户管理',
                iconCls: 'icon-sum',
                state: 'open',
                children: [{
                    text: '用户列表'
                },{
                    text: 'Option2'
                },{
                    text: 'Option3',
                    children: [{
                        text: 'Option31'
                    },{
                        text: 'Option32'
                    }]
                }]
            },{
                text: 'Item2',
                iconCls: 'icon-more',
                children: [{
                    text: 'Option4'
                },{
                    text: 'Option5'
                },{
                    text: 'Option6'
                }]
            }];

        </script>
    </div>
    <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        <table class="easyui-datagrid"
               data-options="url:'/list',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true,toolbar:toolbar">
            <thead>
            <tr>
                <th data-options="field:'id'" width="80">id</th>
                <th data-options="field:'username'" width="100">用户名</th>
                <th data-options="field:'password'" width="100">密码</th>
                <th data-options="field:'createTime',align:'right'" width="120">创建时间</th>
                <th data-options="field:'updateTime',align:'right'" width="120">更新时间</th>
            </tr>
            </thead>
        </table>
        <script type="text/javascript">
            var toolbar = [{
                text:'Add',
                iconCls:'icon-add',
                handler:function(){$('#my').window('open')}
            }];
        </script>
    </div>

</div>
<div id="my" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save',closed:true" style="width:500px;height:200px;padding:10px;">
    <form id="add" method="post" action="login">
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
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()">add</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
    </div>
</div>
</body>
<script>

    function add() {
        $('#add').form('submit', {
            url:"/register",
            success:function(data){
                var data = eval('(' + data + ')');
                if(data.code == 'ok'){
                    $.messager.alert('提示','添加成功!','info',function () {
                        window.location.href = "http://localhost:8080/main";
                    });
                }else {
                    $.messager.alert('提示','添加失败!','info');
                }
            }
        });
    }
    function clearForm(){
        $('#add').form('clear');
    }
</script>
</html>
