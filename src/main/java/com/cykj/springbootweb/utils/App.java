package com.cykj.springbootweb.utils;

//百度人脸识别https://ai.baidu.com/tech/face/detect
//车牌识别https://ai.baidu.com/ai-doc/OCR/ck3h7y191
//身份证识别https://ai.baidu.com/tech/ocr_cards/idcard
//电子围栏
public class App {
	public static void main(String[] args) {
		// SpringApplication.run(App.class, args);
		String token = BaiduAuthService.getAuth();
		System.out.println(token);
		String filePath = "src/main/resources/image/me.jpg";
		try {
			String fileString = Base64Util.encodeBase64File(filePath);
			
			//先注册人脸库
			//{"error_code":0,"error_msg":"SUCCESS","log_id":1011010505945,"timestamp":1586331588,"cached":0,"result":{"face_token":"c2f822dac21481a8ed5b30c98e78e823","location":{"left":367.42,"top":356.75,"width":364,"height":395,"rotation":0}}}
			String addResult = BaiduFaceDetect.add(token, fileString);
			System.out.println("注册人脸信息:" + addResult);
			
			//再根据图片信息获取人脸信息
			
			//{"error_code":0,"error_msg":"SUCCESS","log_id":9425358455941,"timestamp":1586331783,"cached":0,"result":{"face_num":1,"face_list":[
			//{"face_token":"c2f822dac21481a8ed5b30c98e78e823"
			//,"location":{"left":367.42,"top":356.75,"width":364,"height":395,"rotation":0},"face_probability":1,"angle":{"yaw":6.41,"pitch":1.37,"roll":-2.13},"face_shape":{"type":"oval","probability":0.4},"face_type":{"type":"human","probability":1}}]}}
			String faceResult = BaiduFaceDetect.faceDetect(token, fileString);
			System.out.println("返回识别信息" + faceResult);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
