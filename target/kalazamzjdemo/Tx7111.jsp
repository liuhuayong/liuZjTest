<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="payment.api.util.GUIDGenerator"%>
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
    <script type="text/javascript" src="<%=contextPath%>/js/bankIDList.js"></script>
  </head>
  <body>
<script type="text/JavaScript">
window.onload=function(){
        show(authPayBankList);
};

function doSubmit() {
    document.form1.submit();
}

</script>
		<p class="title">模拟商户</p>
		<%
			String action = contextPath + "/Tx7111";
		%>
    <form action="<%=action%>" name="form1" method="POST">
      <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
        <tr>
          <td class="head" height="24" colspan="2">投资人白名单上传（7111）</td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">订单编号</td>
          <td width="*" class="content">
            <input type="text" name="OrderNo" size="40" value="1300000012554" />
          </td>
        </tr>     
        <tr class="mouseout">
          <td width="120" class="label" height="24"> 机构编号</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000020" />
          </td>
        </tr>
        
       <tr class="mouseout">
          <td width="120" class="label" height="24">交易流水号</td>
          <td width="*" class="content">
            <input type="text" name="PaymentNo" size="40" value="<%=GUIDGenerator.genGUID()%>" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">账户号码</td>
          <td width="*" class="content">
            <input type="text" name="AccountNumber" size="40" value="7113021233334345560" />
          </td>
        </tr>     
        <tr class="mouseout">
          <td width="120" class="label" height="24">账户名称</td>
          <td width="*" class="content">
            <input type="text" name="AccountName" size="40" value="测试账户一" />
          </td>
        </tr>     
        <tr class="mouseout">
          <td width="120" class="label" height="24">支付金额</td>
          <td width="*" class="content">
            <input type="text" name="Amount" size="40" value="1" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">人行联行号</td>
          <td width="*" class="content">
            <input type="text" name="BankNo" size="40" value="103524" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">分支行名称</td>
          <td width="*" class="content">
            <input type="text" name="BranchName" size="40" value="宣武门支行" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">分支行省份</td>
          <td width="*" class="content">
            <input type="text" name="Province" size="40" value="北京" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">分支行城市</td>
          <td width="*" class="content">
            <input type="text" name="City" size="40" value="北京" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">开户证件类型</td>
          <td width="*" class="content">
            <select id="IdentificationType" name="IdentificationType" style="width: 274">
	            <option value ="0" >身份证</option>
				<option value ="1">户口簿</option>
				<option value ="2">护照</option>
				<option value ="3">军官证</option>
				<option value ="4">士兵证</option>
				<option value ="5">港澳居民来往内地通行证</option>
				<option value ="6">台湾同胞来往内地通行证</option>
				<option value ="7">临时身份证</option>
				<option value ="8">外国人居留证</option>
				<option value ="9">警官证</option>
				<option value ="X">其他证件</option>
            </select>
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">证件号码</td>
          <td width="*" class="content">
            <input type="text" name="IdentificationNumber" size="40" value="110302198901012365" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">
            银行ID
          </td>
          <td width="*" class="content">
            <select id="bankList" name="BankID" style="width: 274">
            </select>
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24">
            账户类型
          </td>
          <td width="*" class="content">
            <select id="AccountType" name="AccountType" style="width: 274">
              <option value="11">11-个人账户</option>
              <option value="12">12-企业账户</option>
            </select>
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

      <input type="hidden" name="TxCode" value="7111" />
    </form>

  </body>
</html>
