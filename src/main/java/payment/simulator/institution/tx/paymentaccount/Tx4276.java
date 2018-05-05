package payment.simulator.institution.tx.paymentaccount;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.tx.paymentaccount.Tx4276Request;


/**
 *专属账户签约查询
 * 
 * <pre>
 * Modify Information:
 * Author       Date        Description
 * ============ =========== ============================
 * VBA Macro    2014/8/15   Create this file
 * 
 * </pre>
 */
public class Tx4276 extends HttpServlet{

    private static final long serialVersionUID = -2314166584340483320L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String agreementNo = request.getParameter("AgreementNo");

            // 2.创建交易请求对象
            Tx4276Request tx4276Request = new Tx4276Request();
            tx4276Request.setInstitutionID(institutionID);
            tx4276Request.setAgreementNo(agreementNo);

            // 3.执行报文处理
            tx4276Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4276Request.getRequestPlainText());
            request.setAttribute("message", tx4276Request.getRequestMessage());
            request.setAttribute("signature", tx4276Request.getRequestSignature());
            request.setAttribute("txCode", "4276");
            request.setAttribute("txName", "专属账户签约查询");
            request.setAttribute("Flag", "20");
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

