package kr.co.bit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.DAO;

public class DeleteBuyController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String msg = "";
		String url = "";
		
		
		String[] str = request.getParameterValues("checkid");
		DAO dao = new DAO();
		for(int i = 0; i < str.length; i++){
			String check = str[i];
			dao.Checkdelete(check);
		}
		
		msg = "구매 취소 완료!";
		url = request.getContextPath() + "/BuyList.do";
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/BuyProduct/DeleteBuy.jsp";
	}
	

}
