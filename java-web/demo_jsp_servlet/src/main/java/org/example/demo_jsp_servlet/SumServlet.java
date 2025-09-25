package org.example.demo_jsp_servlet;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet",value = "/sum")
public class SumServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // khi gửi lên bằng method get => chạy
        System.out.println("--------Get run-------------");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("form-sum.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // khi gửi lên bằng method post => chay
        System.out.println("--------Post run-------------");
        // lấy dữ liệu từ client gửi lên
        int num1 = Integer.parseInt(req.getParameter("n1"));
        int num2 = Integer.parseInt(req.getParameter("n2"));
        int sum = num1+num2;
        req.setAttribute("sum",sum);
        req.setAttribute("num1",num1);
        req.setAttribute("num2",num2);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("form-sum.jsp");
        requestDispatcher.forward(req,resp);


    }
}
