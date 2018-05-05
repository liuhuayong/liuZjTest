<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="payment.api.util.GUIDGenerator"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>模拟商户</title>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Common.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Form.css"/>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/Table.css"/>
</head>
<body>
<p class="title">模拟商户</p>
<%
	String action = contextPath + "/Tx6101";
%>
<form action="<%=action%>" name="form1" method="POST">
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
	<tr>
		<td class="head" height="24" colspan="2">基金开户 (6101)</td>
	</tr>
	
	<tr class="mouseout">
		<td width="120" class="label" height="24">机构编号</td>
		<td width="*" class="content">
			<input type="text" name="InstitutionID" size="40" value="000020"/>
		</td>
	</tr>
	
	<tr class="mouseout">
        <td width="120" class="label" height="24">基金公司编号</td>
        <td width="*" class="content">
            <input type="text" name="FundID" size="40" value="8401"/>
        </td>
    </tr>
	
	<tr class="mouseout">
        <td width="120" class="label" height="24">交易流水号</td>
        <td width="*" class="content">
            <input type="text" name="TxSN" size="40" value="<%=GUIDGenerator.genGUID()%>"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">手机号码</td>
        <td width="*" class="content">
            <input type="text" name="PhoneNumber" size="40" value="13756554322"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">用户姓名</td>
        <td width="*" class="content">
            <input type="text" name="UserName" size="40" value="Prince"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">身份证号码</td>
        <td width="*" class="content">
            <input type="text" name="IdentificationNumber" placeholder="必填" size="40" value=""/>
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