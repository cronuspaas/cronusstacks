package org.example;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

public class HelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException
    {
	Properties p = new Properties();
	p.load(this.getClass().getClassLoader().getResourceAsStream("app.properties"));
        // Very simple - just return some plain text
        PrintWriter writer = response.getWriter();
        writer.print(String.format("%s cronus from tomcat", p.getProperty("greeting", "Hello")));
    }
}
