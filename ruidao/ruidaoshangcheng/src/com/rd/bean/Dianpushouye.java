package com.rd.bean;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rd.bean.Product;
import com.rd.bean.Shop;
import com.rd.service.impl.ProductServiceImpl;
import com.rd.service.impl.ShopServiceImpl;

@SuppressWarnings("serial")
public class Dianpushouye extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String string = (String)request.getParameter("m");
		Integer shopid = Integer.valueOf(string);
		List<Product> products = new ProductServiceImpl().findBypshop(shopid);
		Shop shop = new ShopServiceImpl().findshopbyid(shopid);
		request.setAttribute("products", products);
		request.setAttribute("shop",shop);
		request.getRequestDispatcher("/dianpushouye.jsp").forward(request, response);

		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
