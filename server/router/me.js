const express = require('express');
const r = express.Router();
const pool = require('../pool.js');


r.get('',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT uListId,userId,userListName,createDate FROM userwithsonglist WHERE userId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'歌单查询完成',code:1,result:result});
    }); 
})

r.get('/create',(req,res) => {
    let id = req.query.id;
    let value = decodeURI(req.query.value);
    let time = req.query.time;
    let sql = 'INSERT INTO userwithsonglist (userId,userListName,createDate) VALUES (?,?,?)';
    pool.query(sql,[id,value,time],(err,result) => {
        if (err) throw err;
        let lid = result.insertId;
        sql = 'SELECT uListId,userId,userListName,createDate FROM userwithsonglist WHERE uListId=?';
        pool.query(sql,[lid],(err,result_1) => {
            if (err) throw err;
            res.send({message:'插入成功',code:1,result:result_1});
        });
    })
});



r.get('/song',(req,res) => {
    let id = req.query.id;
    let sql = 'SELECT uSong,listId,songId,songName,singerId,singerName,time,image,songURL,cyricURL,publishDate,language,CDId,CDName FROM userlistwithsong INNER JOIN song ON sId=songId  WHERE listId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        res.send({message:'查询成功',code:1,result:result});
    });
})

r.get('/update',(req,res) => {
    let id = req.query.id;
    let value = decodeURI(req.query.value);
    let sql = 'UPDATE userwithsonglist SET userListName=? WHERE uListId=?';
    pool.query(sql,[value,id],(err,result) => {
        if (err) throw err;
        res.send({message:'修改成功',code:1});
    })
})

r.get('/delList',(req,res) => {
    let id = req.query.id;
    let sql = 'DELETE FROM userwithsonglist WHERE uListId=?';
    pool.query(sql,[id],(err,result) => {
        if (err) throw err;
        sql = 'DELETE FROM userlistwithsong WHERE listId=?';
        pool.query(sql,[id],(err,result) => {
            if (err) throw err;
            res.send({message:'删除成功',code:1});
        })
    })
})

r.get('/delSong',(req,res) => {
    let id = req.query.id;
    let sql = 'DELETE FROM userlistwithsong WHERE uSong=?';
    pool.query(sql,[id],(err,result) => {
        if(err) throw err;
        res.send({message:'删除成功',code:1})
    });
})

r.get('/collectSong',(req,res) => {
    let songId = req.query.songId;
    let uListId = req.query.uListId;
    let sql = 'SELECT sId FROM userlistwithsong WHERE listId=?';
    pool.query(sql,[uListId],(err,result) => {
        if (err) throw err;
        sql = 'INSERT INTO userlistwithsong (listId,sId) VALUES(?,?)';
        if (result.length != 0){
            let bool = result.some(el => {
                return el.sId == songId
            })
            if (bool) {
                res.send({message:'已有该歌曲',code:0});
            } else {
                pool.query(sql,[uListId,songId],(err,result) => {
                    if (err) throw err;
                    res.send({message:'加入成功',code:1});
                })
            }
        } else {
            pool.query(sql,[uListId,songId],(err,result) => {
                if (err) throw err;
                res.send({message:'加入成功',code:1});
            })
        }
    })
})

r.get('/user',(req,res) => {
    let id = req.query.id;
    let sex = req.query.sex;
    let img = req.query.picture;
    let phone = req.query.phone;
    let nickname = req.query.nickname;
    let sql = 'UPDATE user SET nickname=?,userSex=?,phone=?,imgURL=? WHERE id=?'
    pool.query(sql,[nickname,sex,phone,img,id],(err,result) => {
        if (err) throw err;
        sql = 'SELECT id,username,password,nickname,userSex,phone,imgURL FROM user WHERE id=?';
        pool.query(sql,[id],(err,result_1) => {
            if (err) throw err;
            res.send({code:1,result:result_1});
        })
    })
})


module.exports = r ;