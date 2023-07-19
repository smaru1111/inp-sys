'use strcit';

require('dotenv').config();
const axios = require('axios');
const qs = require('querystring');
const BASE_URL = 'https://notify-api.line.me';
const PATH = '/api/notify';
const LINE_TOKEN = process.env.LINE_NOTIFY_TOKEN; //先ほど発行したトークン

const config = {
  baseURL: BASE_URL,
  url: PATH,
  method: 'post',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': `Bearer ${LINE_TOKEN}`
  },
  data: qs.stringify({
    message: `line通知`,
  })
};

(async function(){
  const response = await axios.request(config);
  console.log(response)
})();


// var five = require("johnny-five");
// var board = new five.Board();

// board.on("ready", function() {
//   // Create an Led on pin 13
//   var led = new five.Led(13);
//   // Blink every half second
//   led.blink(500); 
// });
