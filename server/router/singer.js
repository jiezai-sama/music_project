const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT songId,songName,singerId,singerName,time,image,songURL,cyricURL,publishDate,language,CDId,CDName FROM song WHERE singerId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    })
})

r.get('/albums',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT CDId,CDName,CDurl,publishDate,publisher,singerId,singerName,introduce FROM cd WHERE singerId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    })
})

r.get('/singer',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT singerId,singerName,image_sm,image_lg,singerSex,introduce FROM singer WHERE singerId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    })
})

r.get('/other',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT singerId,singerName,image_sm,image_lg,singerSex,introduce FROM singer';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        let arr = [];
        result.forEach(el => {
            if(el.singerId != id){
                arr.push(el);
            }
        });
        res.send({message:'查询成功',code:1,result:arr});
    });
})





module.exports = r ;