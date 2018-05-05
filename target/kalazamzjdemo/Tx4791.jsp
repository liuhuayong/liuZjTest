<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="payment.api.util.GUIDGenerator"%>
<%@page import="payment.api.system.PaymentEnvironment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String contextPath = request.getContextPath();
    String debugMode = PaymentEnvironment.debugMode;
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
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
    <script language="JavaScript" type="text/JavaScript">


function doSubmit() {    
    document.form1.submit();
}


</script>
    <p class="title">
      模拟商户
    </p>
    <%
        String action = contextPath + "/Tx4791";
    %>
    <form action="<%=action%>" name="form1" method="POST">
      <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
        <tr>
          <td class="head" height="24" colspan="2">
            P2P项目债权转让（4791）
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>机构编号</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000020" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>项目编号</td>
          <td width="*" class="content">
            <input type="text" name="ProjectNo" placeholder="必填" size="40" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>债券转让支付流水号</td>
          <td width="*" class="content">
            <input type="text" name="TransferNo" size="40" value="<%=GUIDGenerator.genHSGUID()%>" />
          </td>
        </tr>
         <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>原支付流水号</td>
          <td width="*" class="content">
            <input type="text" name="PaymentNo" size="40" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>承接人电子账户号码</td>
          <td width="*" class="content">
            <input type="text" name="RecipientDepositAccountNumber"  size="40" value="" />
          </td>
        </tr> 
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>可转让金额</td>
          <td width="*" class="content">
            <input type="text" name="AvailableBalance"  size="40" value="100" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>转让金额</td>
          <td width="*" class="content">
            <input type="text" name="Amount"  size="40" value="100" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>转让价格</td>
          <td width="*" class="content">
            <input type="text" name="TransferPrice"  size="40" value="100" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>起息日</td>
          <td width="*" class="content">
            <input type="text" name="IntDate" size="40" value="<%=today %>" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>预期年化收益率</td>
          <td width="*" class="content">
            <input type="text" name="ReturnRate"  size="40" value="1150" />
          </td>
        </tr>
         <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>转让手续费</td>
          <td width="*" class="content">
            <input type="text" name="Fee"  size="40" value="10" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>转让人电子账户号码</td>
          <td width="*" class="content">
            <input type="text" name="TransferDepositAccountNumber"  size="40" value="" />
          </td>
        </tr> 
        
        <%
              String url = null;
              if(request.getHeader("Referer") == null){
                  url = request.getRequestURL().substring(0, request.getRequestURL().indexOf(request.getRequestURI()) + request.getContextPath().length());
              }else{
                  url = request.getHeader("Referer").substring(0, request.getHeader("Referer").indexOf(request.getContextPath()) + request.getContextPath().length());
              }
          %>
         <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>忘记密码URL</td>
          <td width="*" class="content">
            <input type="text" name="ForgetPwdURL" size="40"
              value="<%=url%>/Tx4721.jsp" />
          </td>
        </tr>                        
         <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>通知URL</td>
          <td width="*" class="content">
            <input type="text" name="PageURL" size="40"
              value="<%=url%>/PageForward.jsp?status=2" />
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
