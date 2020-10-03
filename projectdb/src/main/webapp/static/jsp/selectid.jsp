<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2020/9/20
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/static/js/jquery-1.12.4.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/insertBill" method="post">
    <table border="1px">
        <tr>
            <td style="text-align: center">申报项目信息</td>
        </tr>
        <tr>
            <td>项目编号<input type="text" name="id" value="${projectdb.id}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>项目名称<input type="text" name="projectname" value="${projectdb.projectname}"></td>
        </tr>
        <tr>
            <td>申报开始日期<input type="text" name="startdate" value="${projectdb.startdate}" pattern="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td>申报结束日期<input type="text" name="enddate" value="${projectdb.enddate}" pattern="yyyy-MM-dd"></td>
        </tr>
        <tr>
            <td>类型
            </td>
            <td><select name="status">
                <option value="0">已申报</option>
                <option value="1">审核中</option>
                <option value="2">已审核</option>
            </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="保存"><%--<input type="button" onclick="reback()" value="重置">--%>
                <input type="button" value="返回" onclick="fanhui()">
            </td>
        </tr>
    </table>
</form>
<script>
    $("form").submit(function () {
        var projectname = $("[name='projectname']").val();
        var startdate = $("[name='startdate']").val();
        var status = $("[name='status']").val();
        var enddate = $("[name='enddate']").val();
        if (projectname == "") {
            alert("项目名称不能为空");
            return false;
        }
        if (startdate == "") {
            alert("项目开始申报时间不能为空");
            return false;
        }
        if (enddate == "") {
            alert("项目结束申报时间不能为空");
            return false;
        }

        if (status == "") {
            alert("请选取状态");
            return false;
        }
        var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if (!startdate.match(reg)) {
            alert("时间格式不正确!!!");
            return false;
        }
        var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if (!enddate.match(reg)) {
            alert("时间格式不正确!!!");
            return false;
        }
    })

   /* function reback() {
        $("[name='type']").val("");
    }*/
    function fanhui() {
        location.href="/select"
    }
</script>
</body>
</html>
