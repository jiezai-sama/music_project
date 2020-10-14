<template>
    <div id="song">
        <!-- 设置头部导航栏 -->
        <my-nav :light="0"></my-nav>
        <!-- 设置小导航栏 -->
        <my-littlenav :light="undefined" :light_top="0" ></my-littlenav>
        <!-- 内容区域 -->
        <div id="content">
            <div class="left">
                <div class="intr_1">
                    <div class="intr1_left">
                        <div class="img">
                            <img :src="song[0] && song[0].image">
                            <img src="/img/song/circle.png">
                        </div>
                    </div>
                    <div class="intr1_right">
                        <div class="detail_1">
                            <p class="tag">歌曲</p>
                            <p class="title">{{song[0] && song[0].songName}}</p>
                        </div>
                        <p>
                            <span>歌手：</span>
                            <span>
                                <router-link class="desc" :to="`/singer/${song[0] && song[0].singerId}`">{{song[0] && song[0].singerName}}</router-link>
                            </span>
                        </p>
                        <p>
                            <span>所属专辑：</span>
                            <span>
                                <router-link class="desc" :to="`/album/${song[0] && song[0].CDId}`">{{song[0] && song[0].CDName}}</router-link>
                            </span>
                        </p>
                        <!-- 按钮 -->
                        <my-btn :music="song"></my-btn>
                        <!-- 歌词 -->
                        <div class="lyric">
                            <div class="lrc_content" :style="{height:isOpen ? '' : '240px',overflow:isOpen ? '' : 'hidden'}">
                                <p v-for="(lrc,index) of lyric" :key="index">{{lrc[1]}}</p>
                            </div>
                            <!-- 收起展开 -->
                            <div class="arrow" @click="changeShow">
                                <div v-show="!isOpen">
                                    <span class="arrow_font">展开</span>
                                    <span class="arrow_down"></span>
                                </div>
                                <div v-show="isOpen">
                                    <span class="arrow_font">收起</span>
                                    <span class="arrow_up"></span>
                                </div>
                            </div>                         

                        </div>
                    </div>
                </div>                
            </div>
            <div class="right">
                <p class="title">相关歌曲推荐</p>
                <ul class="range_1">
                    <li v-for="(p,index) of otherSongs" :key="index" @click="changeId">
                        <div class="img">
                            <router-link :to="`/song/${p.songId}`"><img :src="p.image"></router-link>
                        </div>
                        <div class="text">
                            <p class="title_1">
                                <router-link :to="`/song/${p.songId}`">{{p.songName}}</router-link>
                            </p>
                            <p class="user">
                                <span>by</span>
                                <router-link :to="`/singer/${p.singerId}`">{{p.singerName}}</router-link>
                             </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 底部区域 -->
        <my-footer></my-footer>
    </div>
</template>
<style scoped>
    /* 内容区域 */
    #content{
        display: flex;
        width: 980px;
        margin: 0 auto;
        background-color: #f9f7f7;
        min-height: calc(100vh - 105px);
        border: 1px solid #c9d6df;
        border-bottom: none;
        border-top: none;
    }
    #content .left{
        width: 710px;
        box-sizing: border-box;
        padding: 40px 35px;
    }
    #content .left .intr_1{
        display: flex;
        margin-bottom: 20px;
    }
    #content .left .intr_1 .intr1_left{
        width: 200px;
        height: 200px;
        margin-right: 30px;
    }
    #content .left .intr_1 .intr1_left .img{
        position: relative;
        width: 200px;
        height: 200px;
    }
    #content .left .intr_1 .intr1_left .img img:first-child{
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
    }
    #content .left .intr_1 .intr1_left .img img:last-child{
        position: absolute;
    }
    #content .left .intr_1 .intr1_right{
        width: 360px;
        margin-left: 20px;
        margin-top: 10px;
    }
    #content .left .intr_1 .intr1_right .detail_1{
        display: flex;
        margin-bottom: 20px;
    }
    #content .left .intr_1 .intr1_right .detail_1 .tag{
        width: 58px;
        height: 26px;
        background-image: linear-gradient(30deg,#6639a6 0%,#d59bf6 80%,#c3bef0 100%);
        color: #fff;
        border-bottom-right-radius: 10px;
        border-top-right-radius: 10px;
        text-align: center;
        line-height: 26px;
        font-size: 14px;
        margin-right: 15px;
    }
    #content .left .intr_1 .intr1_right .detail_1 .title{
        font-size:  20px;
        line-height: 26px;
    }
    #content .left .intr_1 .intr1_right>p span:first-child{
        font-size: 12px;
        margin-right: 8px;
        line-height: 20px;
        color: #333;
    }
    #content .left .intr_1 .intr1_right>p span:nth-child(2){
        font-size: 12px;
        color: #333;
    }
    #content .left .intr_1 .intr1_right>p .desc{
        text-decoration: none;
        color: #333;
    }
    #content .left .intr_1 .intr1_right>p .desc:hover{
        text-decoration: underline;
    }

    #content .left .intr_1 .intr1_right .lyric{
        margin-top: 30px;
    }
    #content .left .intr_1 .intr1_right .lyric .lrc_content p{
        height: 24px;
        font-size: 12px;
        font-weight: 400px;
        line-height: 24px;
        color: #333;
    }
    #content .lyric .arrow>div{
        text-align: right;
        cursor: pointer;
    }
    #content .lyric .arrow .arrow_font{
        font-size: 12px;
        color: #6639a6;
        margin-right: 5px;
    }
    #content .lyric .arrow .arrow_down{
        display: inline-block;
        width: 20px;
        height: 20px;
        background: url('/img/album/down.png') no-repeat;
        background-position: 0px 10px;
    }
    #content .lyric .arrow .arrow_up{
        display: inline-block;
        width: 20px;
        height: 20px;
        background: url('/img/album/up.png') no-repeat;
        background-position: 0px 10px;
    }


    #content .left .list p{
        font-size: 20px;
        margin: 15px 0;
    }
    #content .left .list table{
        width: 640px;
        border: 1px solid #c3bef0;
        border-top: 3px solid #6639a6;
        box-sizing: border-box;
        font-size: 13px;
    }
    #content .left .list th{
        height: 34px;
        box-sizing: border-box;
        padding: 8px 10px 8px 10px;
        background-color: #cadefc;
        text-align: left;
        font-size: 15px;
        border: 1px solid #c3bef0;
    }
    #content .left .list th:first-child{
        width: 100px;
    }

    #content .left .list td{
        height: 30px;
        box-sizing: border-box;
        padding: 6px 10px 6px 10px;
    }
    #content .left .list tbody tr:nth-of-type(2n){
        background-color: #d6e6f2;
    }
    #content .left .list table a{
        color: #000;
        font-size: 13px;
        text-decoration: none;
    }
    #content .left .list table a:hover{
        text-decoration: underline;
    }
    #content .left .list tbody tr:nth-of-type(2n+1){
        background-color: #f7fbfc;
    }


    #content .right{
        width: 270px;
        padding: 20px 40px 40px 30px;
        border-left: 1px solid #c9d6df;
        box-sizing: border-box;
    }
    #content .right .title{
        border-bottom: 1px solid #aaa;
        padding-bottom: 5px;
        margin-bottom: 25px;
        font-size: 14px;
        font-weight: bold;
    }
    #content .right .range_1 li{
        display: flex;
        list-style: none;
        width: 200px;
        height: 50px;
        margin-bottom: 15px;
    }
    #content .right .range_1 li .img{
        width: 50px;
        height: 50px;
    }
    #content .right .range_1 li .img img{
        width: 100%;
    }
    #content .right .range_1 li .text{
        width: 140px;
        height: 50px;
        margin-left: 10px;
        padding-top: 2px;
    }
    #content .right .range_1 li .text .title_1{
        width: 140px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow:ellipsis;
        margin-bottom: 10px;

    }
    #content .right .range_1 li .text .title_1 a{
        text-decoration: none;
        font-size: 14px;
        font-weight: 400;
        color: #000;
    }
    #content .right .range_1 li .text .title_1 a:hover{
        text-decoration: underline;
    }
    #content .right .range_1 li .text .user{
        width: 140px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow:ellipsis;
    }
    #content .right .range_1 li .text .user span{
        font-size: 13px;
        font-weight: 400;
        margin-right: 10px;
    }
    #content .right .range_1 li .text .user a{
        font-size: 12px;
        font-weight: 400;
        color: #333;
        text-decoration: none;
    }
    #content .right .range_1 li .text .user a:hover{
        text-decoration: underline;
    }



    
</style>
<script>
import MyNav from '../components/MyNav.vue'
import MyLittlenav from '../components/MyLittlenav.vue'
import MyFooter from '../components/MyFooter.vue'
import MyBtn from '../components/Myplaybtn.vue'
import storage from '../common/storage.js'

export default {
    components:{
        MyNav,
        MyLittlenav,
        MyFooter,
        MyBtn
    },
    data(){
        return {
            song:[],         
            lyric:[],
            isOpen:false,
            otherSongs:[],
            id:''
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        //获取歌曲数据函数，并返回一个promise对象
        getSongDetails(){
            return new Promise(resolve => {
                let id = this.$route.params.id;
                this.axios.get('/song?id=' + id).then(res => {
                    let data = res.data.result[0];
                    data.image = require('../assets/music_image/' + data.image);
                    data.songURL = require('../assets/musiclist/' + data.songURL);
                    this.song.push(data);
                    resolve();
                });
            })
        },
        //首先从数据库获取歌词地址，再通过地址请求lrc文件的内容，在created中调用
        async getLyricText(){
            this.lyric = [];
            await this.getSongDetails();
            this.axios.get('http://localhost:8080/img/lrc/' + this.song[0].cyricURL).then(res => {
                var arrLrc = res.data.split('[');
                arrLrc.forEach(el => {
                    let a = el.split(']')
                    this.lyric.push(a);
                })
            })
        },
        //获取相关歌曲推荐，在created中调用
        getOtherSongs(){
            let id = this.$route.params.id;
            this.axios.get('/song/other?id=' + id).then(res => {
                this.otherSongs = [];
                let data = res.data.result;
                data.forEach(el => {
                    el.image = require('../assets/music_image/' + el.image);
                    this.otherSongs.push(el);
                })
            })
        },
        //改变歌曲的id
        changeId(){
            this.id = this.$route.params.id;
        },
        //改变歌词的收起，展开状态
        changeShow(){
            if (this.isOpen){
                this.isOpen = false;
            }else{
                this.isOpen = true;
            }
        },
        
        //点击改变音量条的出现
        change_1(){
            if (this.show == 'none'){
                this.show = 'block'
            }else{
                this.show = 'none'
            }
        }
        
    },
    created(){
        this.getLyricText();
        this.getOtherSongs();
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
    },
    watch:{
        isPlay(){
            if (this.isPlay == true){
                this.img_url = 'pause_1.png';
            }else{
                this.img_url = 'play_1.png';
            }
        },
        id(){
            this.getLyricText();
            this.getOtherSongs();
        }

    }
}
</script>