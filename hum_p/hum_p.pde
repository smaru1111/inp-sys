import http.requests.*;
import processing.serial.*;
Serial port; 

String CTYPE = "application/x-www-form-urlencoded";
String AUTH = "BDAoOtJJIjL1C64VCmCVVObg9mg5Oe9yApvxfmxlxWk";

String sendMessage = "人が通った!!";
int cnt = 0;

int ledPin = 4;
int pirPin = 2;


color bgColor = color(0);
 
void setup() {
  size(400, 200);
  
  port = new Serial(this, "COM3", 9600);
  port.clear();                         
}
 

void draw() {
  background(bgColor);
  if(port.available() > 0){
    int v = port.read();          // データを読み込む
    if (v == 1){
      bgColor = color(255,0,0);
      cnt =+ 1;
      fetchAPI(cnt);
      delay(5000);
    }else {
      bgColor = color(255,255,0);
    }
  }
}

void fetchAPI(int cnt) {
    String dispCnt = Integer.valueOf(cnt).toString();
  
    PostRequest post = new PostRequest("https://notify-api.line.me/api/notify", "UTF-8"); //notify-api.line.meへ送信するための新しいPOSTリクエストオブジェクトを作成する
    
    post.addHeader("Content-Type", CTYPE);
    post.addHeader("Authorization",  "Bearer " + AUTH);//ヘッダー情報をここで追加してく
    //post.addData("message", "%E4%BA%BA%E3%81%8C%E9%80%9A%E3%81%A3%E3%81%9F%EF%BC%81%EF%BC%81"); //パラメタを追加する
    post.addData("message", dispCnt+sendMessage); //add data to request
    post.send();
    println("Reponse Content: " + post.getContent());

}

    
