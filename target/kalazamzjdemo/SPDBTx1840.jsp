<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String contextPath = request.getContextPath();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String today = simpleDateFormat.format(new Date());
%>
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
    String action = contextPath + "/SPDBTx1840";
%>
<form action="<%=action%>" name="form1" method="POST">
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
    <tr>
        <td class="head" height="24" colspan="2"> 监管银行对账（1840）</td>
    </tr>
    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>监管银行ID</td>
        <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="310"/>
        </td>
    </tr>
     <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>被监管的机构编号</td>
        <td width="*" class="content">
            <input type="text" name="InstitutionIDSupervised" size="40" value="001112"/>
        </td>
    </tr>
    <tr class="mouseout">
        <td width="120" class="label" height="24">结算标识</td>
        <td width="*" class="content">
            <input type="text" name="SettlementFlag" size="40" value="0001"/>
        </td>
    </tr>
    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>对账日期</td>
        <td width="*" class="content">
            <input type="text" name="Date" size="40" value="<%=today %>"/>
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td height="10" colspan="2"/>
    </tr>
    <tr>
        <td width="200" height="28"/>
        <td width="*" >
            <input type="button" class="ButtonMouseOut" onmouseover="this.className='ButtonMouseOver'" onmouseout="this.className='ButtonMouseOut'" style="width: 60px" value="提交" onclick="doSubmit()">
        </td>
    </tr>
</table>
</form>
</body>
</html>

<script language="JavaScript" type="text/JavaScript">
function doSubmit() {    
    document.form1.submit();
}
</script>
