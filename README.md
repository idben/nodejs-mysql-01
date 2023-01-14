# 簡單的nodeJS 與 mySQL 的連線教學
## 專案的建立
1. 建立一個全新的專案資料夾，拉進 VSCode 中。
2. 在 VSCode 中建立一個資料夾，取名為 server，做為伺服器用。
3. 打開命令提示字元或終端機，進入到 server 資料夾，初始化專案
  ```bash
    npm init
  ```
4. 在 server 資料夾中建立主要的程式，index.js
5. 完成初步的專案建立

## 安裝需要的套件
1. 為了快速搭建一個網站，需要 express
  ```bash
    npm i express
  ```
2. 為了讓不同 port 中的程式可以讀到跨 port 的內容(跨網域)，需要 cors
  ```bash
    npm i cors
  ```
3. 為了讀取 mySQL，需要 mysql
  ```bash
    npm i mysql
  ```
4. 想要讓 index.js 只要一修改，伺服器就自動 reload，需要中介軟體(middleware)，nodemon
  ```bash
    npm i nodemon
  ```
5. 一般來說，在 index.js 中使用套件需要先引用與定義
  ```javascript
    const express = require('express');
  ```
  如果想讓引用與定義與寫 reactJS 中的 ES6 語法一致，那需要在 package.json 中設定 type 為 module
  ```json
    "main": "index.js",
    "type": "module",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1"
    },
  ```
  這樣一來，就可以寫成
  ```javascript
    import express from "express";
  ```
6. 完成所需套件的安裝

## 建立資料庫
1. 開啟 xampp，開啟 phpMyAdmin
2. 建立一個新資料庫叫 nodejsTest
3. 將附上的 sql 檔匯入
	1. 點選一下左側的 nodejsTest
	2. 再由中間上方找到「匯入」選項
	3. 選擇附件 nodejsTest.sql
	4. 再按下方的「匯入」按鈕
	5. 結果應該是在 nodejsTest 資料庫下產生一個 users 的資料表
4. 完成後點一下左側的 nodejsTest 下的 users 資料表，檢查看看是否有兩筆資料

## 撰寫 index.js 建立伺服器
1. 為了要使用 express，要引用 express，並建立變數實體 express
2. 為了要使用 mysql，要引用 mysql，並建立變數實體 mysql
3. 為了要使用 cors，要引用 cors，並建立變數實體 cors
  ```javascript
    import express from "express";
    import mysql from "mysql";
    import cors from "cors";
  ```
4. 開啟 server 程式 express，也就是去執行它的意思。而為了之後能夠方便取用，把執行它的結果放進變數 app 中
  ```javascript
    const app = express();
  ```
5. 這時候就有一個主機 app 了，但要建立一個對外的通道讓別人進來，通道就是 port，而這個範例會使用通道 3001
  ```javascript
    app.listen(3001, ()=>{
      console.log('Connect to server!')
    });
  ```
6. 這時候如果在位於 server 資料夾下的命令提示字元或終端機，輸入以下的指令，就可以看把主機開起來放著
  ```bash
    node index.js
  ```
7. 但是之後會一直加指令進來 index.js，只要加了，就要 ctrl + c 把主機中斷，然後再重新下指令開啟，很～～～累。所以使用剛剛有裝的中介軟體 nodemon 來幫我們做事。也就是要讓 nodemon 幫我們執行 index.js
	1. 進到 package.json
	2. 在 scripts 裡加上這句
    ```json
      "server": "nodemon index.js"
    ```
	3. 因為 scripts 裡原本也只有一句 test，所以把它覆寫後，完整的 scripts 會像這樣
    ```json
      "scripts": {
        "server": "nodemon index.js"
      },
    ```
8. 回到位於 server 資料夾下的命令提示字元或終端機，輸入以下的指令
    ```bash
      npm run server
    ```
    這時候就可以看到
    ```
      [nodemon] starting `node index.js`
      Connect to server!
    ```
9. 試著改一下「Connect to server!」變成「Welcome to server!」，然後記得存檔。這時候就會看到命令提示字元或終端機中的字主動會更新成「Welcome to server!」了

## 連結與使用 mySQL
1. 在開始使用前，設定一下主機能夠使用 JSON 格式
2. 在開始使用前，設定主機能夠被跨網域存取
  ```javascript
    const app = express();

    app.use(express.json());
    app.use(cors());
  ```
3. 設定 mySQL 的連線設定
	1. 由 mysql 中的方法 createConnection() 來建立連線
	2. 並將連線的結果指定給變數 db，這樣將來只要認這個變數就知道是資料庫連線結果
    ```javascript
      app.use(cors());

      const db = mysql.createConnection({
      });
    ```
	3. 設定連線的細節，帳號、密碼或是 port 號等等
    ```javascript
      const db = mysql.createConnection({
        host: "localhost",
        port: "8086",	// 預設是 3306，老師有改過，所以要輸入改過的
        user: "admin",
        password: "a12345",
        database: "nodejsTest",
      });
    ```
	4. 測試有沒有連線成功
    ```javascript
      const db = mysql.createConnection({
        // 略
      });

      db.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
      });
    ```
	  儲存後，就可以在命令提示字元看到成功或失敗的訊息
    ![操作圖示](https://github.com/idben/nodejs-mysql-01/blob/main/readmeimgs/info1.png)

4. 設計讀取所有使用者的 API
	1. 假設，想要取得所有使用者資料，不需要先傳給主機任何訊息，那麼就只要使用方法 get 即可
    ```javascript
      db.connect(function(err) {
        // 略
      });

      app.get();
    ```
	2.  要設定要取用的入口，由網址中決定。比如說是由 localhost:3001/users
    ```javascript
      app.get("/users");
    ```
	3. 設定取用時要做的事
    ```javascript
      app.get("/users", function(){});
    ```
	4. 取用的 function 會自動帶入兩個參數
    ```javascript
      app.get("/users", function(req, res){});
    ```
	5. 先寫一句 sql 來取得所有使用者資料，放在一個變數中待用
    ```javascript
      app.get("/users", function(req, res){
        const q = "SELECT * FROM users";
      });
    ```
	6. 再由資料庫連線，也就是變數 db，去執行
    ```javascript
      app.get("/users", function(req, res){
        const q = "SELECT * FROM users";
        db.query(q});
      });
    ```
	7. 執行時總是要告知做什麼事，做什麼事就是寫在一組 function。
	有結果時，會帶錯誤或是回傳的資料進這個 function
    ```javascript
      app.get('/users', (req, res)=>{
        const q = "SELECT * FROM users";
        db.query(q, (err, data)=>{
        });
      });
  ```
	8. 如果有錯誤，就把錯誤用 JSON 格式回傳
	有 return 程式就會停在這句。
	沒有錯，就是有結果，就把結果變成 JSON 回傳
    ```javascript
      app.get('/users', (req, res)=>{
        const q = "SELECT * FROM users";
        db.query(q, (err, data)=>{
          if(err) return res.json(err); // 如果有錯誤，就把錯誤用 JSON 格式回傳
          return res.json(data); // 沒有錯，就是有結果，就把結果變成 JSON 回傳
        });
      });
    ```
	9. 存檔，由 postman 測試看看。或是在網址輸入localhost:3001/users 測試
    ![操作圖示](https://github.com/idben/nodejs-mysql-01/blob/main/readmeimgs/info2.png)

## 完成




