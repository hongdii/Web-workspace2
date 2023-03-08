package com.kh.websocket;

import javax.websocket.Decoder.Text;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;
import com.kh.websocket.model.vo.Message;

public class JSONDecoder implements Text<Message>{
	// 디코더 사용하려면 Text 구현해야함
	
	@Override
	public void destroy() {
		
	}
	
	@Override
	public void init(EndpointConfig arg0) {
		
	}
	
	@Override
	public Message decode(String msg) {
		// 문자열 msg => Message 객체로 변환후 리턴
		return new Gson().fromJson(msg, Message.class);
	}
	
	@Override
	public boolean willDecode(String msg) {
		return true;
	}
}
