import http.requests.*;
import processing.serial.*;
Serial port; 


String[] lines; // .envファイルの内容を格納する配列
String filePath = "../.env"; // .envのファイルパス

// 環境変数を読み込むための関数を用意
String getEnv(String key) {
 lines = loadStrings(filePath);
 for (String line : lines) {
   String[] parts = line.split("=");
   if (parts.length == 2 && parts[0].equals(key)) {
     return parts[1];
   }
 }
 return null;
}


String sendMessage = "人が通った!!";

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
      delay(5000);
    }else {
      bgColor = color(255,255,0);
    }
  }
}

void fetchAPI() {
    String AUTH = getEnv("LINE_NOTIFY_TOKEN");
    String CTYPE = "application/x-www-form-urlencoded";

  
    PostRequest post = new PostRequest("https://notify-api.line.me/api/notify", "UTF-8"); //notify-api.line.meへ送信するための新しいPOSTリクエストオブジェクトを作成する
    
    post.addHeader("Content-Type", CTYPE);
    post.addHeader("Authorization",  "Bearer "+ AUTH);//ヘッダー情報をここで追加してく
    //post.addData("message", "%E4%BA%BA%E3%81%8C%E9%80%9A%E3%81%A3%E3%81%9F%EF%BC%81%EF%BC%81"); //パラメタを追加する
    post.addData("message", sendMessage); //add data to request
    post.send();
    println("Reponse Content: " + post.getContent());

}

    
