<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<%@page import="cpcn.institution.tools.util.XmlUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模拟商户</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Common.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Form.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Table.css">
</head>
<body>
<p class="title">模拟商户</p>
<%
String prettyPlainText = (String)request.getAttribute("plainText");
%>
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
    <tr>
        <td class="head" height="24" colspan="2">${txName}(${txCode})</td>
    </tr>
    <tr class="mouseout">
        <td width="100" class="label" height="400">响应报文</td>
        <td width="*" class="content">            
            <textarea name="RequestPlainText" cols="120" rows="20" wrap="off"><%=prettyPlainText %></textarea>
        </td>
    </tr>
</table>

</body>
</html>
