package payment.simulator.institution.tx.p2poptimize;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.tx.p2poptimize.Tx3602Request;


public class Tx3602 extends HttpServlet {
    
    private static final long serialVersionUID = 6697471785410663173L;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1.取得参数
            String institutionID = request.getParameter("InstitutionID");
            String projectNo = request.getParameter("ProjectNo");
            
        
            
            // 2.创建交易请求对象
            Tx3602Request tx3602Request = new Tx3602Request();
            tx3602Request.setInstitutionID(institutionID);
            tx3602Request.setProjectNo(projectNo);
           
            // 3.执行报文处理
            tx3602Request.process();
            // 4.将参数放置到request对象
            request.setAttribute("plainText", tx3602Request.getRequestPlainText());
            request.setAttribute("message", tx3602Request.getRequestMessage());
            request.setAttribute("signature", tx3602Request.getRequestSignature());
            request.setAttribute("txCode", "3602");
            request.setAttribute("Flag", "20");
            request.setAttribute("txName", "P2P项目信息查询");
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
