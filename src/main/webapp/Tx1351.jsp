<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="payment.api.util.GUIDGenerator"%>
<%@page import="payment.api.system.PaymentEnvironment"%>
<%
    String contextPath = request.getContextPath();
    String debugMode = PaymentEnvironment.debugMode;
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
    String action = contextPath + "/Tx1351";
%>
<form action="<%=action%>" name="form1" method="POST">
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
    <tr>
        <td class="head" height="24" colspan="2">市场订单订购支付(1351)</td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>机构编号</td>
        <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000020"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>市场订单号</td>
        <td width="*" class="content">
            <input type="text" name="OrderNo" size="40" value="<%=GUIDGenerator.genGUID()%>"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>支付交易流水号</td>
        <td width="*" class="content">
            <input type="text" name="PaymentNo" size="40" value="<%=GUIDGenerator.genGUID()%>"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>支付金额，单位：分</td>
        <td width="*" class="content">
            <input type="text" name="Amount" size="40" value="1000"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">账户名称</td>
        <td width="*" class="content">
            <input type="text" name="AccountName" size="40" value="互联网部"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">账户号码</td>
        <td width="*" class="content">
            <input type="text" name="AccountNumber" size="40" value="6221558812340001"/><%if("20".equals(debugMode)){ %><font color="#FF0000" size="2">测试环境交易状态返回规则：账户号码末两位是‘10’返回成功状态；‘20’返回失败状态；‘30’返回处理中状态</font><%} %>
        </td>
    </tr>
    
    <tr class="mouseout">
        <td width="120" class="label" height="24">开户证件类型</td>
          <td width="*" class="content">
            <select id="IdentificationType" name="IdentificationType" style="width: 274">
              <option value="0">身份证</option>
              <option value="1">户口薄</option>
              <option value="2">护照</option>
              <option value="3">军官证</option>
              <option value="4">士兵证</option>
              <option value="5">港澳居民来往内地通行证</option>
              <option value="6">台湾同胞来往内地通行证</option>
              <option value="7">临时身份证</option>
              <option value="8">外国人居留证</option>
              <option value="9">警官证</option>
              <option value="X">其他证件</option>
            </select>
          </td>
        </tr>
     <tr class="mouseout">
        <td width="120" class="label" height="24">证件号码
         </td>
          <td width="*" class="content">
            <input type="text" name="IdentificationNumber" size="40" value="" />
          </td>
    </tr>
    
    <tr class="mouseout">
        <td width="120" class="label" height="24">手机号
         </td>
          <td width="*" class="content">
            <input type="text" name="PhoneNumber" size="40" value="" />
          </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>接收前台通知URL</td>
        <td width="*" class="content">
        <%
              String url = null;
              if(request.getHeader("Referer") == null){
                  url = request.getRequestURL().substring(0, request.getRequestURL().indexOf(request.getRequestURI()) + request.getContextPath().length()) + "/ReceiveNoticePage";
              }else{
                  url = request.getHeader("Referer").substring(0, request.getHeader("Referer").indexOf(request.getContextPath()) + request.getContextPath().length()) + "/ReceiveNoticePage";
              }
          %>
            <input type="text" name="PageURL" size="40"
            value="<%=url%>" />
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">备注</td>
        <td width="*" class="content">
            <input type="text" name="Remark" size="40" value=""/>
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

window.onload=function(){
    CreateBank("; bank.xml; ");
}
function doSubmit() {    
    document.form1.submit();
}

</script>

