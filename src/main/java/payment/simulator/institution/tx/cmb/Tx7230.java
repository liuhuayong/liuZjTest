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

package payment.simulator.institution.tx.cmb;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cpcn.institution.tools.util.StringUtil;
import payment.api.tx.cmb.Tx7230Request;

public class Tx7230 extends HttpServlet {

    private static final long serialVersionUID = 6004179945551458959L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String orderNo = request.getParameter("OrderNo");
            String orderType = request.getParameter("OrderType");
            String startDate = request.getParameter("StartDate");
            String endDate = request.getParameter("EndDate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            // 2.创建交易请求对象
            Tx7230Request tx7230Request = new Tx7230Request();
            tx7230Request.setInstitutionID(institutionID);
            tx7230Request.setOrderNo(orderNo);
            tx7230Request.setOrderType(orderType);
            if(StringUtil.isEmpty(startDate)){
                tx7230Request.setStartDate(null);
            }else{
                tx7230Request.setStartDate(sdf.parse(startDate));
            }
            if(StringUtil.isEmpty(endDate)){
                tx7230Request.setEndDate(null);
            }else{
                tx7230Request.setEndDate(sdf.parse(endDate));
            }

            // 3.执行报文处理
            tx7230Request.process();

            // 4.将参数放置到request对象
            // //3个交易参数
            request.setAttribute("plainText", tx7230Request.getRequestPlainText());
            request.setAttribute("message", tx7230Request.getRequestMessage());
            request.setAttribute("signature", tx7230Request.getRequestSignature());
            // //2个信息参数
            request.setAttribute("txCode", "7230");
            request.setAttribute("txName", "订单查询");
            request.setAttribute("Flag", "10");
            // 1个action(支付平台地址)参数
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