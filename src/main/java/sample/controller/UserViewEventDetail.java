/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.comment.CommentSectionDAO;
import sample.comment.CommentSectionDTO;
import sample.notification.NotificationDAO;
import sample.notification.NotificationDTO;
import sample.posts.EventDAO;
import sample.posts.EventPost;
import sample.users.ParticipantsDTO;
import sample.users.UserDAO;

/**
 *
 * @author Tuan Be
 */
@WebServlet(name = "UserViewEventDetail", urlPatterns = {"/UserViewEventDetail"})
public class UserViewEventDetail extends HttpServlet {

    private static final String SUCCESS = "User_View_Event_Details.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            String getEventIDForEventDetail = (String) request.getAttribute("EVENT_DETAIL_ID");

            String getEventIDWhenComment = (String) request.getAttribute("eventID");

            String getUserIDWhenComment = (String) request.getAttribute("userName");

            String userID = null;
            String eventID = null;

            if (getEventIDForEventDetail != null) {
                eventID = getEventIDForEventDetail;

            } else if (getEventIDWhenComment != null) {
                eventID = getEventIDWhenComment;
            } else {
                eventID = request.getParameter("EVENT_ID");
            }

            if (getUserIDWhenComment != null) {
                userID = getUserIDWhenComment;
            } else {
                userID = request.getParameter("username");
            }

            String showQRCode = (String) request.getAttribute("ShowQRCode");
            request.setAttribute("ShowQRCodeWhenParticipant", showQRCode);

            UserDAO dao = new UserDAO();
            EventDAO evtDAO = new EventDAO();
            CommentSectionDAO cmtDAO = new CommentSectionDAO();
            NotificationDAO notiDAO = new NotificationDAO();

            int view = evtDAO.getAnEvent(eventID).getNumberOfView() + 1;
            EventPost numberOfView = new EventPost(eventID, view);
            evtDAO.countNumberOfView(numberOfView);

            ParticipantsDTO dto = new ParticipantsDTO();
            dto = dao.getParticipants(userID, eventID);
            request.setAttribute("CHECK_PARTICIPANTS", dto);

            EventPost getEventPostDetail = evtDAO.getAnEvent(eventID);
            request.setAttribute("USER_VIEW_EVENT_DETAIL", getEventPostDetail);

            int slotTime = evtDAO.getAnEvent(eventID).getSlotID();
            String takePlaceDate = evtDAO.getAnEvent(eventID).getTakePlaceDate();
            System.out.println(takePlaceDate);
            ArrayList<ParticipantsDTO> getSlotTimeID = dao.checkParticipantsDuplicate(userID, slotTime, takePlaceDate);
            System.out.println(getSlotTimeID);
            request.setAttribute("CHECK_SLOT_DUPLICATE", getSlotTimeID);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            long millis = System.currentTimeMillis();
            Date today = new Date(millis);
            String check = null;
            if (sdf.parse(takePlaceDate).before(today)) {
                check = "true";
            } else if (sdf.parse(takePlaceDate).equals(today) || sdf.parse(takePlaceDate).after(today)) {
                check = "false";
            }
            request.setAttribute("GET_TODAY", check);

            ArrayList<ParticipantsDTO> list = new ArrayList<>();
            list = dao.getParticipantsList(eventID);
            int participationLimit = list.size();
            request.setAttribute("PARTICIPATIONLIMIT", participationLimit);

            ArrayList<CommentSectionDTO> comment = new ArrayList<CommentSectionDTO>();
            comment = cmtDAO.getComment(eventID);
            request.setAttribute("COMMENT", comment);

            if (userID != null) {
                ArrayList<NotificationDTO> getNoti = new ArrayList<>();
                getNoti = notiDAO.getNotification(userID);
                request.setAttribute("GET_NOTIFICATION", getNoti);
            }

            url = SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
