const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('',(req,res) => {
    let value = decodeURI(req.query.value);
    value = '%' + value + '%';
    let sql = 'SELECT songId,songName,singerId,singerName,time,image,songURL,cyricURL,publishDate,language,CDId,CDName FROM song WHERE songName LIKE ?';
    pool.query(sql,[value],(err,result_1) => {
        if (err) throw err;
        sql = 'SELECT singerId,singerName,image_sm,image_lg,singerSex,introduce FROM singer WHERE singerName LIKE ?';
        pool.query(sql,[value],(err,result_2) => {
            if (err) throw err;
            sql = 'SELECT CDId,CDName,CDurl,publishDate,publisher,singerId,singerName,introduce FROM cd WHERE CDName LIKE ?';
            pool.query(sql,[value],(err,result_3) => {
                if (err) throw err;
                res.send({message:'查询成功',code:1,result:[result_1,result_2,result_3]});
            })
        })
    })
});



module.exports = r ;