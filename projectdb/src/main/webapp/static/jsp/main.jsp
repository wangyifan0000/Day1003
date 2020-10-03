<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2020/9/20
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/static/js/jquery-1.12.4.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/" method="post">
    <select name="status">
        <option value="0">已申报</option>
        <option value="1">审核中</option>
        <option value="2">已审核</option>
    </select>
    <input type="submit" value="查询">
    <table border="1px">
        <tr>
            <td>申报项目列表</td>
        </tr>
        <tr>
            <td>项目编号</td>
            <td>项目名称</td>
            <td>项目申报开始日期</td>
            <td>项目申报结束日期</td>
            <td>申报状态</td>
            <td>操作</td>
        </tr>
        <c:forEach var="project" items="${pageInfo.list}">
            <tr>
                <td>${project.id}</td>
                <td>${project.projectname}</td>
                <td><fmt:formatDate value="${project.startdate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${project.enddate}" pattern="yyyy-MM-dd"/></td>
                <td><c:if test="${project.status}==0">已申报</c:if>
                    <c:if test="${project.status}==1">审核中</c:if>
                    <c:if test="${project.status}==2">已审核</c:if>
                </td>
                <td><c:if test="${project.status!=2}"><a href="javascript:void(0)" onclick="update(${project.id})"></a></c:if></td>
            </tr>
        </c:forEach>
        <tr>
            <a>${success}</a> <a>${fail}</a>
            <div>
                < a href="select?pageNum=${pageInfo.firstPage}">首页</ a>
            <c:if test="${pageInfo.hasPreviousPage}">
            < a href="select?pageNum=${pageInfo.prePage}">上一页</ a>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="i">
        < a href="select?pageNum=${i}">${i}</ a>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage}">
    < a href="select?pageNum=${pageInfo.nextPage}">下一页</ a>
</c:if>
</div>
        </tr>
    </table>
</form>
<script>
    $(function () {
        $("tr:odd").css("background-color", "yellow");
    })
    function update(id) {
        location.href = "/selectById/"+id;
    }
</script>
</body>
</html>
