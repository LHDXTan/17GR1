package demo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.entity.Question;

public class QuestionServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 从请求参数中取得用户名
        String name = request.getParameter("username");
        // 城市
        String city = request.getParameter("city");
        // 开发语言
        String[] languages = request.getParameterValues("language");
        // 此处生成一个Question对象
        Question question = new Question();
        question.setUsername(name);
        question.setCity(city);
        question.setLanguages(java.util.Arrays.asList(languages));
        // 省略注册功能的实现代码
        // 把此question对象设置为request作用域内的一个变量
        request.setAttribute("question", question);
        request.getRequestDispatcher("/queSuccess.jsp")
               .forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        this.doGet(request, response);
    }

}
