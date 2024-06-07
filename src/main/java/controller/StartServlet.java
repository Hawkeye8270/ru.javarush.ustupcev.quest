package controller;


import model.Question;
import org.jetbrains.annotations.NotNull;
import service.QuestionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/start")
public class StartServlet extends HttpServlet {

    private QuestionService questionService;

    @Override
    public void init() throws ServletException {
        try {
            String questionsFilePath = "questions.json";
            questionService = new QuestionService(questionsFilePath);
        } catch (IOException e) {
            throw new ServletException("Exception load question", e);
        }
    }

    @Override
        protected void doPost(@NotNull HttpServletRequest req, @NotNull HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        String name = req.getParameter("name");

        if (name != null && !name.isEmpty()) {
            session.setAttribute("playerName", name);
            if (session.getAttribute("gameCount") == null) {
                session.setAttribute("gameCount", 0);
            }
        }

        String option = req.getParameter("option");
        String stepIdParam = req.getParameter("stepId");

        if (stepIdParam == null || stepIdParam.isEmpty()) {
            throw new ServletException("Missing or empty parameter: stepId");
        }

        int stepId;
        try{
            stepId = Integer.parseInt(stepIdParam);
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid stepId parameter", e);
        }

        Question question = questionService.getQuestionById(stepId);
        if (question == null) {
            throw new ServletException("No question found for stepId: " + stepId);
        }

        if (option == null) {
            req.setAttribute("errorMessage", "Please select an option.");
            forwardToQuestion(req, resp, name, question);
            return;
        }

        Question.Option selectedOption = question.getOptions().get(option);
        if (selectedOption == null) {
            req.setAttribute("errorMessage", "Invalid option selected");
            forwardToQuestion(req, resp, name, question);
            return;
        }

        req.setAttribute("outcome", selectedOption.getOutcome());
        req.setAttribute("name", name);
        req.setAttribute("nextStep", String.valueOf(selectedOption.getNextStep()));

        if (selectedOption.getNextStep() == null || selectedOption.getNextStep() == -1) {
            req.getRequestDispatcher("/gameOver.jsp").forward(req, resp);
        } else if (selectedOption.getNextStep() == 0) {
            req.getRequestDispatcher("/win.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/out.jsp").forward(req, resp);
        }
    }

        private void forwardToQuestion(@NotNull HttpServletRequest request, @NotNull HttpServletResponse response,
                                       String name, Question question) throws ServletException, IOException {

        request.setAttribute("name", name);
        request.setAttribute("question", question);
        request.setAttribute("stepId", question.getId());
        request.getRequestDispatcher("/question.jsp").forward(request, response);
    }
}
