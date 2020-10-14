const express = require('express');
const r = express.Router();
const pool = require('../pool.js');
const  multer = require('multer');
let fs = require("fs");

//上传文件路径
const upload = multer({
    dest: "myUpload/"
});

//一次处理一张字段名为head的图片
const singleMidle = upload.single("head");

r.post('/avatar',singleMidle,(req,res,next) => {
    let file = req.file;
    fs.renameSync('myUpload/' + file.filename, 'myUpload/' + file.originalname);
    res.send('ok');
})

r.get('/download/:picture',(req,res) => {
    res.sendFile(process.cwd()+"/myUpload/"+req.params.picture)    //服务器该文件的绝对路径
});





module.exports = r ;
