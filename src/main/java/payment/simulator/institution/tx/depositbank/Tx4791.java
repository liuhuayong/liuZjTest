/**
 * <pre>
 * Copyright Notice:
 *    Copyright (c) 2005-2009 China Financial Certification Authority(CFCA)
 *    A-1 You An Men Nei Xin An Nan Li, Xuanwu District, Beijing ,100054, China
 *    All rights reserved.
 * 
 *    This software is the confidential and proprietary information of
 *    China Financial Certification Authority (&quot;Confidential Information&quot;).
 *    You shall not disclose such Confidential Information and shall use 
 *    it only in accordance with the terms of the license agreement you 
 *    entered into with CFCA.
 * </pre>
 */

package payment.simulator.institution.tx.depositbank;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import payment.api.tx.depositbank.Tx4791Request;


public class Tx4791 extends HttpServlet {

    private static final long serialVersionUID = 6697471785410663172L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String projectNo = request.getParameter("ProjectNo");
            String transferNo = request.getParameter("TransferNo");
            String paymentNo = request.getParameter("PaymentNo");
            String recipientDepositAccountNumber = request.getParameter("RecipientDepositAccountNumber");
            long availableBalance = Long.parseLong(request.getParameter("AvailableBalance"));
            long amount = Long.parseLong(request.getParameter("Amount"));
            long transferPrice = Long.parseLong(request.getParameter("TransferPrice"));
            String intDate = request.getParameter("IntDate");
            String returnRate = request.getParameter("ReturnRate");
            long fee = Long.parseLong(request.getParameter("Fee"));
            String transferDepositAccountNumber = request.getParameter("TransferDepositAccountNumber");
            String forgetPwdURL = !request.getParameter("ForgetPwdURL").equals("")?request.getParameter("ForgetPwdURL").trim():null;
            String pageURL = !request.getParameter("PageURL").equals("")?request.getParameter("PageURL").trim():null;
        
            

            // 2.创建交易请求对象
            Tx4791Request tx4791Request = new Tx4791Request();
            tx4791Request.setInstitutionID(institutionID);
            tx4791Request.setProjectNo(projectNo);
            tx4791Request.setTransferNo(transferNo);
            tx4791Request.setPaymentNo(paymentNo);
            tx4791Request.setRecipientDepositAccountNumber(recipientDepositAccountNumber);
            tx4791Request.setAvailableBalance(availableBalance);
            tx4791Request.setAmount(amount);
            tx4791Request.setTransferPrice(transferPrice);
            tx4791Request.setIntDate(intDate);
            tx4791Request.setReturnRate(returnRate);
            tx4791Request.setFee(fee);
            tx4791Request.setTransferDepositAccountNumber(transferDepositAccountNumber);
            tx4791Request.setForgetPwdURL(forgetPwdURL);
            tx4791Request.setPageURL(pageURL);
     

            // 3.执行报文处理
            tx4791Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4791Request.getRequestPlainText());
            request.setAttribute("message", tx4791Request.getRequestMessage());
            request.setAttribute("signature", tx4791Request.getRequestSignature());
            request.setAttribute("txCode", "4791");
            request.setAttribute("txName", "P2P项目投资支付");
            request.setAttribute("Flag", "40");
            request.setAttribute("action", request.getContextPath() + "/SendMessage");


            // 5.转向Request.jsp页面
            request.getRequestDispatcher("/Request.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            processException(request, response, e.getMessage());
        }
    }

    private void processException(HttpServletRequest request, HttpServletResponse response, String errorMessage) {
        try {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/ErrorPage.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

}
