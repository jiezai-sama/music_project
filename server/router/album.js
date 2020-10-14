const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('',(req,res) => {
    let cdId = req.query.id;
    let sql = 'SELECT CDId,CDName,CDurl,publishDate,publisher,singerId,singerName,introduce FROM cd WHERE CDId=?';
    pool.query(sql,[cdId],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result})
    });
})

r.get('/song',(req,res) => {
    let cdId = req.query.id;
    let sql = 'SELECT songId,songName,singerId,singerName,time,image,songURL,cyricURL,publishDate,language,CDId,CDName FROM song WHERE CDId=?';
    pool.query(sql,[cdId],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    });
})

r.get('/other',(req,res) => {
    let cdId = req.query.id;
    let sql = 'SELECT CDId,CDName,CDurl,singerId,singerName FROM cd LIMIT 0,8';
    pool.query(sql,[cdId],(err,result) => {
        if (err) throw err;
        let arr = [];
        result.forEach(el => {
            if (el.CDId != cdId){
                arr.push(el)
            }
        })
        res.send({message:'查询成功',code:1,result:arr});
    })
})
module.exports = r ;