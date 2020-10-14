const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

//轮播图接口
r.get('/carousel',(req,res) => {
    let sql = 'SELECT id,img,href,color FROM carousel';
    pool.query(sql,(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    })
})

//歌单接口
r.get('/songlist',(req,res) => {
    let sql = 'SELECT id,listName,introduce,image_sm,image_lg FROM songlist' ;
    pool.query(sql,(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    });
})

module.exports = r ;