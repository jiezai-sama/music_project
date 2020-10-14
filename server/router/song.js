const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT songId,songName,singerId,singerName,time,image,songURL,cyricURL,publishDate,language,CDId,CDName FROM song WHERE songId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result})
    });
})

r.get('/other',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT songId,songName,singerId,singerName,image FROM song LIMIT 0,6';
    pool.query(sql,(err,result) => {
        if (err) throw err;
        let arr = [];
        result.forEach(el => {
            if (el.songId != id){
                arr.push(el);
            }
        })
        res.send({message:'查询成功',code:1,result:arr});       
    })
})

module.exports = r ;