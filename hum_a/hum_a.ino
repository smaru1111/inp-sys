const int ledPin = 4;
const int pirPin = 2;

 
void setup() {
  // put your setup code here, to run once:
  // シリアル通信速度
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  delay(5000);
}
 
void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(pirPin) == LOW) {
    digitalWrite(ledPin, HIGH);
    Serial.write(1);
    Serial.println(1);         // シリアル通信でカウンターの値をPCに送信
    delay(100);
  } else {
    digitalWrite(ledPin, LOW);
    Serial.write(0);
    Serial.println(0);         // シリアル通信でカウンターの値をPCに送信
    delay(100);
  }
}