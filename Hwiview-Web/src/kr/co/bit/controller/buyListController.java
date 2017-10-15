package kr.co.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;
import kr.co.bit.vo.buyVO;

public class buyListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		DAO dao = new DAO();
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		List<buyVO> buy= dao.selectBuyInfoByName(id);
		System.out.println(buy);
		
		request.setAttribute("buy", buy);
		
		
		
		
		return "/BuyProduct/buyList.jsp";
	}

}
