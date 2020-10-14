const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.post('',(req,res) => {
    let uname = req.body.uname;
    let upwd = req.body.upwd;
    let sql = 'SELECT id,username,password,nickname,userSex,phone,imgURL FROM user WHERE username=? AND password=MD5(?)';
    pool.query(sql,[uname,upwd],(err,result) => {
        if (err) throw err;
        if (result.length == 0){
            res.send({message:'账号或密码错误',code:0});
        }else{
            res.send({message:'登陆成功',code:1,result:result});
        }
    });
})

module.exports = r ;
