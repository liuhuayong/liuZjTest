<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="payment.api.util.GUIDGenerator"%>
<%@page import="payment.api.system.PaymentEnvironment"%>
<%
    String contextPath = request.getContextPath();
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
    <script type="text/javascript">

function doSubmit() {    
    document.form1.submit();
}

function addPaymentAccountNumber() {    
    var newDIV=document.createElement("div");
    newDIV.innerHTML="<input name='PaymentAccountNumber' style='width: 274'/> <a href='javascript:void(0)' onclick='removePaymentAccountNumber(this)'>删除</a>";
    document.getElementById("PaymentAccountNumberTd").appendChild(newDIV);
}
function removePaymentAccountNumber(newA) {    
     var newDiv = newA.parentNode;
     newDiv.parentNode.removeChild(newDiv);
}
</script>
    <p class="title">
      模拟商户
    </p>
    <%
        String action = contextPath + "/Tx8132";
    %>
    <form action="<%=action%>" name="form1" method="POST">
      <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
        <tr>
          <td class="head" height="24" colspan="2">
            账户认证等级批量查询（8132）
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>机构号码</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" placeholder="必填" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td class="label" height="24"><font color="red">*</font>账户号码</td>
          <td width="*" class="content" id="PaymentAccountNumberTd">
          <div><input name="PaymentAccountNumber" style="width: 274"></input> <a href="javascript:void(0)" onclick="addPaymentAccountNumber()">添加</a></div>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td height="10" colspan="2" />
        </tr>
        <tr>
          <td width="200" height="28" />
          <td width="*">
            <input type="button" class="ButtonMouseOut" onmouseover="this.className='ButtonMouseOver'"
              onmouseout="this.className='ButtonMouseOut'" style="width: 60px" value="提交" onclick="doSubmit()">
          </td>
        </tr>
      </table>

    </form>

  </body>
</html>
