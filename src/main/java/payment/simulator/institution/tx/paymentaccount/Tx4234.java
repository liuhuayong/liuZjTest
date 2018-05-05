package payment.simulator.institution.tx.paymentaccount;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.system.PaymentUserEnvironment;
import payment.api.tx.paymentaccount.Tx4234Request;

public class Tx4234 extends HttpServlet {

    private static final long serialVersionUID = -3558346254253485525L;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            // 1.取得参数
            // 此处为接口字段定义，Loop Start
            String institutionID = request.getParameter("InstitutionID");
            String phoneNumber = request.getParameter("PhoneNumber");
            String userName = request.getParameter("UserName");
            String identificationNumber = request.getParameter("IdentificationNumber");
            String userType = request.getParameter("UserType");
            String pageURL = request.getParameter("PageURL");
            // 此处为接口字段定义，Loop End

            // 2.创建交易请求对象
            Tx4234Request tx4234Request = new Tx4234Request();
            // 此处为接口字段定义，Loop Start
            tx4234Request.setInstitutionID(institutionID);
            tx4234Request.setPhoneNumber(phoneNumber);
            tx4234Request.setUserName(userName);
            tx4234Request.setIdentificationNumber(identificationNumber);
            tx4234Request.setUserType(userType);
            tx4234Request.setPageURL(pageURL);
            // 此处为接口字段定义，Loop End

            // 3.执行报文处理
            tx4234Request.process();

            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx4234Request.getRequestPlainText());
            request.setAttribute("message", tx4234Request.getRequestMessage());
            request.setAttribute("signature", tx4234Request.getRequestSignature());
            request.setAttribute("txCode", "4234");
            request.setAttribute("txName", "用户支付账户注册（专属户移动端）");
            request.setAttribute("Flag", "20");
            request.setAttribute("action", PaymentUserEnvironment.mobilepaymentuserpayURL);

            // 5.转向Request.jsp页面
            request.getRequestDispatcher("/Request4Mobile.jsp").forward(request, response);

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
