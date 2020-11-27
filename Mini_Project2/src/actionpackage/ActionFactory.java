package actionpackage;


public class ActionFactory {
	private static final ActionFactory instance =new ActionFactory();
	private ActionFactory() {}
	public static ActionFactory getinstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action=null;
		
		switch(command) {
		case "memberjoin":
			action=new MemberJoinAction();
			break;
			
		case "memberdelete":
			action=new MemberDeleteAction();
			break;
		
		case "memberlogin":
			action=new MemberLoginAction();
			break;
			
		case "findmemberid":
			action= new FindMemberIDAction();
			break;
				
		case "findmemberpw":
			action=new FindMemberPWAction();
			break;
		
		case "memberinfoselect":
			action=new MemberInfoSelectAction();
			break;
			
		case "memberinfoupdate":
			action=new MemberInfoUpdateAction();
			break;
			
		case "showboard":
			action= new ShowBoardAction();
			break;
			
		case "searchboard":
			action= new SearchBoardAction();
			break;
			
		case "showcontent":
			action= new ShowContentAction();
			break;
			
		case "writeboard":
			action=new WriteBoardAction();
			break;
			
		case "updateboard":
			action=new UpdateBoardAction();
			break;
			
		case "deleteboard":
			action=new DeleteBoardAction();
			break;
			
		case "replyboard":
			action=new ReplyBoardAction();
			break;
			
		case "memberlogout":
			action=new MemberLogoutAction();
			break;
			
		
		case "searchmain":
			action=new SearchMainAction();
			break;
		
		case "detail":		//
			action=new ShowproductDetailAction();
			break;
			
		//후기 게시판
		case "review_board":	//후기 게시판.
			action = new ShowReviewBoardAction();
			break;
			
		case "show_review":	//후기 게시판-후기 상세 보기.
			action = new ShowReviewAction();
			break;
			
		case "write_review":	//후기 등록.
			action = new WriteReviewAction();
			break;
			
		case "goto_writeReview":	//후기 페이지로.
			action = new GotoWriteReviewAction();
			break;
			
		case "update_review":	//후기 수정.
			action = new UpdateReviewAction();
			break;
			
		case "delete_review":	//후기 삭제
			action = new DeleteReviewAction();
			break;
			
		case "write_Re_review":	//후기에 답글 달기.
			action = new WriteReplyOfReviewAction();
			break;
			
		//관리자	
		case "admin_showmember":
			action=new Admin_ShowMember();
			break;
			
		case "admin_showorder":
			action=new Admin_ShowOrderAction();
			break;
			
		case "show_dateSales":
			action=new Admin_ShowdateSalesAction();
			break;
			
		case "show_sumsales":
			action=new Admin_ShowSumSales();
			break;
			
		case "compareSales":
			action=new Admin_CompareSales();
			break;
			
		case "insertproduct":
			action=new Admin_InsertProduct();
			break;
			
		//장바구니	
		case "showbasket":
			action=new ShowBasketAction();
			break;	
			
		case "loginCheck":
			action=new LoginCheckAction();
			break;
			
		case "insertbasket":
			action=new InsertBasket();
			break;
		
		case "deletebasket":
			action=new DeleteBasketAction();
			break;
			
		//주문
		case "orderproduct":
			action=new OrderProductAction();
			break;
			
		case "insertorder":
			action=new InsertOrderAction();
			break;	
			
			//order 폼 받기
		case "directorder":
			action=new DirectinsertrOrderAction();
			break;	
		
			//order db넣어주기
		case "directpay":
			action=new DirectinsertrPayAction();
			break;
		
		//마이페이지
		case "showorderlist":
			action=new ShowOrderListAction();
			break;
		
		}
		return action;
	}
	
}
