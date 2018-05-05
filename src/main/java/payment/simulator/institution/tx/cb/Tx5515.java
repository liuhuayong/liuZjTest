package payment.simulator.institution.tx.cb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import payment.api.tx.cb.Tx5515Request;

/**
 * <pre>
 * Modify Information:
 * Author       Date        Description
 * ============ =========== ============================
 * jjzhu    2017/9/05   Create this file
 * 
 * </pre>
 */

public class Tx5515 extends HttpServlet {

    private static final long serialVersionUID = -8327625515460862750L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String institutionID = req.getParameter("InstitutionID");
            String batchNo = req.getParameter("BatchNo");
            String fileName = req.getParameter("FileName");
            String abstractString = req.getParameter("AbstractString");

            Tx5515Request txRequest = new Tx5515Request();
            txRequest.setInstitutionID(institutionID);
            txRequest.setBatchNo(batchNo);
            txRequest.setFileName(fileName);
            txRequest.setAbstractString(abstractString);

            txRequest.process();

            req.setAttribute("plainText", txRequest.getRequestPlainText());
            req.setAttribute("message", txRequest.getRequestMessage());
            req.setAttribute("signature", txRequest.getRequestSignature());
            req.setAttribute("txCode", "5515");
            req.setAttribute("txName", "境内收款人文件上传");
            req.setAttribute("Flag", "30");
            req.setAttribute("action", req.getContextPath() + "/SendMessage");

            req.getRequestDispatcher("/Request.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            processException(req, resp, e.getMessage());
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
