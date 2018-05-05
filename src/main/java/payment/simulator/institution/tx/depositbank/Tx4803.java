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


import payment.api.tx.depositbank.Tx4803Request;


public class Tx4803 extends HttpServlet {

    private static final long serialVersionUID = 6697471785410663172L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String serialNumber = request.getParameter("SerialNumber");
            String projectNo = request.getParameter("ProjectNo");
            String repaymentType = request.getParameter("RepaymentType");
            long amount = Long.parseLong(request.getParameter("Amount"));
            String operationType = request.getParameter("OperationType");
            String remark = request.getParameter("Remark");
           
        
            

            // 2.创建交易请求对象
            Tx4803Request tx4803Request = new Tx4803Request();
            tx4803Request.setInstitutionID(institutionID);
            tx4803Request.setSerialNumber(serialNumber);
            tx4803Request.setProjectNo(projectNo);
            tx4803Request.setRepaymentType(repaymentType);
            tx4803Request.setAmount(amount);
            tx4803Request.setOperationType(operationType);
            tx4803Request.setRemark(remark);
     

            // 3.执行报文处理
            tx4803Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4803Request.getRequestPlainText());
            request.setAttribute("message", tx4803Request.getRequestMessage());
            request.setAttribute("signature", tx4803Request.getRequestSignature());
            request.setAttribute("txCode", "4803");
            request.setAttribute("txName", "P2P项目还款冻结/撤销");
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
