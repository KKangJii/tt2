package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.buyVO;

public class buyProcessController implements Controller{

	private String url;
	private String msg;
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String product_name = request.getParameter("product_name");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String basic_addr = request.getParameter("basic_addr");
		String detail_addr = request.getParameter("detail_addr");
		String prot = request.getParameter("prot");
		
		buyVO buy = new buyVO();
		buy.setName(name);
		buy.setId(id);
		buy.setProduct_name(product_name);
		buy.setTel1(tel1);
		buy.setTel2(tel2);
		buy.setTel3(tel3);
		buy.setBasic_addr(basic_addr);
		buy.setDetail_addr(detail_addr);
		buy.setProt(prot);
		
		System.out.println(buy);
		
		DAO dao = new DAO();
		dao.insertBuyInfo(buy);
		
		msg = "구매등록 완료!";
		url = request.getContextPath();
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/BuyProduct/buyProcess.jsp";
	}
	
}
