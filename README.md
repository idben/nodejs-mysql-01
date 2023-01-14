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
