package com.cykj.springbootweb.source;

import javax.servlet.annotation.WebServlet;

import org.springframework.boot.web.servlet.ServletComponentScan;

//可以直接访问jsp页面，不需要control转发
//jsp页面需要放在webapp目录下，不要在WEB-INF目录
@ServletComponentScan
@WebServlet(urlPatterns = "*.jsp",name = "JspServlet")
public class JspServlet extends org.apache.jasper.servlet.JspServlet{
}
