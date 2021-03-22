package com.khlibrary.wishBook.model.vo;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class NaverBookApi {

    public void NaverBookApi() {
    	
    }


	public List<NaverBook> searchBook(String keyword, int display) {
        String clientId = "Lt2CWe7q40LzGBQXOYAj"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "uC2sxKUWM6"; //애플리케이션 클라이언트 시크릿값"


        String text = null;
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        
        String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text + (display != 0? "&display=" + display : "");    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/book.xml="+ text; // xml 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        //System.out.println(responseBody);
        
        List<NaverBook> list = new ArrayList<>();

        JSONParser parser = new JSONParser();
        Object obj;
        
		try {
			obj = parser.parse(responseBody.toString());
			

	        JSONObject jsonObject = (JSONObject) obj;
	        JSONArray getArray = (JSONArray) jsonObject.get("items");
	        for (int i = 0; i < getArray.size(); i++) {
	        	
	            JSONObject object = (JSONObject) getArray.get(i);

	            String getTitle = (String) object.get("title");
	            String titleFilter = getTitle.replaceAll("<b>", "");
	            String title = titleFilter.replaceAll("</b>", "");
	            
	            String author = (String) object.get("author");
	            String publisher = (String) object.get("publisher");
	            String pubdate = (String) object.get("pubdate");
	            String image = (String) object.get("image");
	            
	            //System.out.println(title + ", " + author + ", " +publisher + ", " +pubdate + ", " +image);
	            
	            list.add(new NaverBook(title, author , publisher, pubdate, image));
	            
	            //System.out.println(list.toString());
	         }
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
        return list;
    }
	
	


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
    

    
}
