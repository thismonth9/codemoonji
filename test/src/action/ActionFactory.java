package action;


public class ActionFactory {
	private static ActionFactory instance = new ActionFactory(); //2. 스테틱!!!
	private ActionFactory() {}  //싱클톤!!!!!!!!!!!
	public static ActionFactory getInstance() { //스테틱!!! -> 1. 인스턴스변수 접근 못함
		return instance;
	}
	public Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "board_list" : action = new BoardListAction(); break;
		case "board_content" : action = new BoardContentAction(); break;
		
		}
		return action;
	}
}
