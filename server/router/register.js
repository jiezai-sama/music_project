const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.post('', (req,res) => {
    let uname = req.body.uname;
    let upwd = req.body.upwd;
    let time = req.body.time;
    let sql = 'SELECT id FROM user WHERE username=?';
    pool.query(sql,[uname],(err,result) => {
        if (err) throw err;
        if (result.length != 0){
            res.send({message:'用户名已存在',code:0});
        }else{
            sql = 'INSERT INTO user (username,password) VALUES (?,MD5(?))';
            pool.query(sql,[uname,upwd],(err,result) => {
                if (err) throw err;
                sql = 'SELECT id FROM user WHERE username=?';
                pool.query(sql,[uname],(err,result) => {
                    if (err) throw err;
                    let id = result[0].id;
                    sql = "INSERT INTO userwithsonglist (userId,userListName,createDate,img) VALUES (?,'我喜欢的音乐',?,'/img/userimg/1.jpg')";
                    pool.query(sql,[id,time],(err,result) => {
                        if (err) throw err;
                        res.send({message:'注册成功',code:1});
                    })
                })
            });
        }
    });
});
module.exports = r ;