<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="payment.api.util.GUIDGenerator"%>
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
    <script language="JavaScript" type="text/JavaScript">

	function doSubmit() {    
    	document.form1.submit();
}

	function removeDiv(divID){
	    var obj1 = document.getElementById("Item");
	    var obj2 = document.getElementById(divID);
	    obj1.removeChild(obj2);
	    changeTotalCount();
	    changeTotalAmount();
	}
	var xmlHttp;
	
	function addItem(){
		var divID = new Date().getTime();
		var div = document.createElement("DIV");
		div.style.margin="1px";
		div.id = divID;
		document.getElementById("Item").appendChild(div);
		var url = "<%=contextPath %>/Tx3310_1";
		xmlHttp.open("POST",url,true);
		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
		xmlHttp.send("divID="+divID);
		xmlHttp.onreadystatechange = function() {
//			alert(xmlHttp.readyState + "--" + xmlHttp.status);
		    if (xmlHttp.readyState == 4) {
		        if (xmlHttp.status == 200) {
		            if(xmlHttp.responseText != null && xmlHttp.responseText != ""){
//		            	alert(xmlHttp.responseText);
		               var newDiv = document.getElementById(divID);
		               newDiv.innerHTML = xmlHttp.responseText;
		               changeTotalAmount();
		               changeTotalCount();
		           }
		        }
		     }
		}
		
	}
	function createXMLHttpRequest(){
	    //Mozilla 浏览器（将XMLHttpRequest对象作为本地浏览器对象来创建）
	    if(window.XMLHttpRequest){ //Mozilla 浏览器
	        xmlHttp = new XMLHttpRequest();
	    }else if(window.ActiveXObject) { //IE浏览器
	    //IE浏览器（将XMLHttpRequest对象作为ActiveX对象来创建）
	        try{
	            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	        }catch(e){
	            try {
	                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	            }catch(e){}
	        }
	    }
	    if(xmlHttp == null){
	        alert("不能创建XMLHttpRequest对象");
	        return false;
	    }
	}
	function changeTotalAmount(){
	   var amountObj = document.getElementsByName("Amount");
	   var countObj = document.getElementsByName("Count");
	   var leng = amountObj.length;
	   var totalAmount = 0;
	   var amount = 0;
	   for(var i = 0; i < leng; i ++){
	      amount = amountObj[i].value;
	      count = countObj[i].value;
	      if(amount != null && amount != ""){
	          if(amount !=0 ){
	             totalAmount = parseInt(totalAmount) + parseInt(amount)*parseInt(count);
	          }else{
	             amountObj[i].value = 1;
	             totalAmount = parseInt(totalAmount) + 1*parseInt(count);  
	          }
	          
	      }else{
	          amountObj[i].value = 1;
	          totalAmount = parseInt(totalAmount) + 1*parseInt(count);  
	      }
	   }
	   document.getElementById("TotalAmount").value = totalAmount;
	}

	function changeTotalCount(){
	   var countObj = document.getElementsByName("Count");
	   var leng = countObj.length;
	   var count = 0;
	   var totalCount = 0;
	   for(var i = 0; i < leng; i ++){
	      count = countObj[i].value;
	      if(count != null && count != ""){
	         if(count == 0){
	            countObj[i].value = 1;
	            totalCount = parseInt(totalCount) + 1;
	         }else{
	             totalCount = parseInt(totalCount) + parseInt(count);
	         }
	          
	      }else{
	         countObj[i].value = 1;
	         totalCount = parseInt(totalCount) + 1;
	      }
	   }
	   document.getElementById("TotalCount").value = totalCount;
	}
	
	window.onload = function(){
	   createXMLHttpRequest();
	   addItem();
	}

</script>
    <p class="title">
      模拟商户
    </p>
    <%
        String action = contextPath + "/Tx3310";
    %>
    <form action="<%=action%>" name="form1" method="POST">
      <table width="100%" cellpadding="2" cellspacing="1" border="0" align="center" bgcolor="#DDDDDD">
        <tr>
          <td class="head" height="24" colspan="2">
            优惠券批量下发（3310）
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>机构号码</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionID" size="40" value="000020" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>机构支付账户号码</td>
          <td width="*" class="content">
            <input type="text" name="InstitutionPaymentAccountNumber" placeholder="必填" size="40" value="" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>下发批次号</td>
          <td width="*" class="content">
            <input type="text" name="BatchNo" size="40" value="<%=GUIDGenerator.genGUID() %>" />
          </td>
        </tr>
        <tr class="mouseout">
          <td width="120" class="label" height="24"><font color="red">*</font>总金额</td>
          <td width="*" class="content">
            <input type="text" name="TotalAmount" size="40" value="0" />
          </td>
        </tr>
        <tr class="mouseout">
        <td width="120" class="label" height="24">优惠券明细</td>
        <td width="*" class="content" id="Item">
          <a href="javascript:void(0)" onclick="addItem()">添加明细</a>
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

      <input type="hidden" name="TxCode" value="3310" />
    </form>

  </body>
</html>
