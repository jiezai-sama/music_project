const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('',(req,res) => {
    let listId = req.query.id;   
    let sql = 'SELECT id,listName,introduce,image_sm,image_lg,typeId,tags,userId,nickname FROM songlist WHERE id=?';
    pool.query(sql,[listId],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    });
    
    
})

r.get('/music',(req,res) => {
    let listId = req.query.id;
    let sql = 'SELECT songlistId,l.songId,songName,singerId,singerName,time,songURL,CDId,CDName,cyricURL,image FROM songlistwithsong AS l INNER JOIN song AS s ON l.songId=s.songId WHERE songlistId=?';
    pool.query(sql,[listId],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    })
})

r.get('/recommend',(req,res) => {
    let listId = req.query.id;
    let sql = 'SELECT id,listName,image_sm,userId,nickname FROM songlist LIMIT 0,6';
    pool.query(sql,(err,result) => {
        if (err) throw err;
        let arr = [];
        result.forEach(el => {
            if (el.id != listId){
                arr.push(el);
            }
        });
        res.send({message:'查询成功',code:1,result:arr});
    }) 
})



module.exports = r ;