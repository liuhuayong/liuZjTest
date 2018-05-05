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
<script language="JavaScript" type="text/JavaScript">

function doSubmit() {    
    document.form1.submit();
}

</script>
<p class="title">模拟商户</p>
<%
    String action = contextPath + "/Tx2811";
%>
<form action="<%=action%>" name="form1" method="POST">
<table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
    <tr>
        <td class="head" height="24" colspan="2">扫码支付（2811）</td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>机构编号</td>
        <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000020"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>支付交易流水号</td>
        <td width="*" class="content">
            <input type="text" name="PaymentNo" size="40" value="<%=GUIDGenerator.genGUID()%>"/>
        </td>
    </tr>
    
    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>支付方式</td>
        <td width="*" class="content">
            <select id="PaymentWay" name="PaymentWay" style="width: 274">
              <option value="10">微信扫码支付</option>
              <option value="20">支付宝扫码支付</option>
              <option value="30">银联扫码支付</option>
            </select>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">失效时间，单位：分钟</td>
        <td width="*" class="content">
            <input type="text" name="ExpirePeriod" size="40" value=""/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>订单金额，单位：分</td>
        <td width="*" class="content">
            <input type="text" name="Amount" size="40" value="1000"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>可打折金额，单位：分</td>
        <td width="*" class="content">
            <input type="text" name="DiscountAmount" size="40" value="1"/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>商品描述</td>
        <td width="*" class="content">
            <input type="text" name="Goods" placeholder="必填" size="40" value=""/><%if("20".equals(debugMode)){ %><font color="#FF0000" size="2">测试环境交易状态返回规则：商品描述字段填‘20’返回失败状态；其他返回成功状态</font><%} %>
            
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">商品ID</td>
        <td width="*" class="content">
            <input type="text" name="ProductID" size="40" value=""/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">商品标记</td>
        <td width="*" class="content">
            <input type="text" name="GoodsTag" size="40" value=""/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">分账模式</td>
        <td width="*" class="content">
            <select id="SplitType" name="SplitType" style="width: 274">
              <option value=""></option>
              <option value="10">不分账</option>
              <option value="20">按比例分账</option>
              <option value="30">按金额分账</option>
            </select>
        </td>
    </tr>
    
    <tr class="mouseout">
        <td width="120" class="label" height="24">备注</td>
        <td width="*" class="content">
            <input type="text" name="SplitType" size="40" value=""/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24"><font color="red">*</font>结算标识</td>
        <td width="*" class="content">
            <input type="text" name="SettlementFlag" size="40" value="0001"/>
        </td>
    </tr>
    
    <tr class="mouseout">
        <td width="120" class="label" height="24">员工编号</td>
        <td width="*" class="content">
            <input type="text" name="OperatorID" size="40" value=""/>
        </td>
    </tr>
    <tr class="mouseout">
        <td width="120" class="label" height="24">门店编号</td>
        <td width="*" class="content">
            <input type="text" name="StoreID" size="40" value=""/>
        </td>
    </tr>
    <tr class="mouseout">
        <td width="120" class="label" height="24">商户机具终端编号</td>
        <td width="*" class="content">
            <input type="text" name="TerminalID" size="40" value=""/>
        </td>
    </tr>

    <tr class="mouseout">
        <td width="120" class="label" height="24">备用域</td>
        <td width="*" class="content">
            <select id="LimitPay" name="LimitPay" style="width: 274">
              <option value="">不使用该字段</option>
              <option value="10">10-信用卡可用</option>
              <option value="20">20-信用卡不可用</option>
            </select>
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
