<template>

    <div id="singer">
        <!-- 头部导航栏 -->
        <my-nav :light="0"></my-nav>
        <!-- 小导航栏 -->
        <my-littlenav :light="undefined" :light_top="0"></my-littlenav>
        <!-- 内容区域 -->
        <div id="content">
            <div class="left">
                <div class="itr">
                    <p class="itr_f1">{{singerIntr.singerName}}</p>
                    <div class="itr_i1">
                        <img :src="singerIntr.image_lg">
                    </div>
                </div>
                <ul class="m_tabs">
                    <li class="tab-item" 
                        v-for="(p,index) of m_tabs" 
                        :key="index" 
                        :class="light == index ? 'active' : ''"
                        @click="changeLight(index)">{{p}}</li>
                    <li class="tab-seat"></li>
                </ul>
                <!-- 热门作品 -->
                <div class="songArticle" :style="{display:showName == 'song' ? 'block' : 'none'}">
                    <div class="article_1">
                        <!-- 按钮 -->
                        <my-btn :music="music"></my-btn>
                        <p class="art_f">热门单曲</p>
                    </div>
                    <div class="list">
                        <!-- 音乐列表 -->
                        <my-table :music="music" :title="table" :notWant="4"></my-table>
                    </div>
                </div>
                <!-- 所有专辑 -->
                <div class="albums" :style="{display:showName == 'album' ? 'block' : 'none'}">
                    <div class="album">
                        <div class="album-item" v-for="(a,index) of album" :key="index">
                            <router-link class="url" :to="`/album/${a.CDId}`">
                                <img :src="a.CDurl">    
                            </router-link>
                            <router-link :to="`/album/${a.CDId}`" class="cd_name">{{a.CDName}}</router-link>
                            <p class="cd_time">{{a.publishDate}}</p>
                        </div>
                    </div>
                </div>
                <!-- 艺人介绍 -->
                <div class="itro" :style="{display:showName == 'introduce' ? 'block' : 'none'}">
                    <div v-html="singerIntr.introduce">

                    </div>
                </div>
            </div>
            <div class="right">
                <p class="title">相关歌手推荐</p>
                <ul class="range_1">
                    <li v-for="(p,index) of otherSinger" :key="index" @click="changeId">
                        <div class="img">
                            <router-link :to="`/singer/${p.singerId}`"><img :src="p.image_sm"></router-link>
                        </div>
                        <div class="text">
                            <p class="title_1">
                                <router-link :to="`/singer/${p.singerId}`">{{p.singerName}}</router-link>
                            </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div> 
        <!-- 脚部区域 -->
        <my-footer></my-footer>
    </div>
</template>
<script>
import MyNav from '../components/MyNav.vue'
import MyLittlenav from '../components/MyLittlenav.vue'
import MyFooter from '../components/MyFooter.vue'
import MyBtn from '../components/Myplaybtn.vue'
import MyTable from '../components/MyTablelist.vue'
import storage from '../common/storage.js'


export default {
    components:{
        MyNav,
        MyLittlenav,
        MyFooter,
        MyBtn,
        MyTable
    },
    data(){
        return {
            m_tabs:['热门作品','所有专辑','艺人介绍'],
            light:0,                                    //高亮显示，默认为第一个
            music:[],                                   //该歌手的热门歌曲
            showName:'song',                            //song 显示歌曲  album显示专辑  introduce 显示介绍内容
            album:[],                                   //该歌手的专辑
            singerIntr:{},                              //该歌手的信息
            otherSinger:[],                             //其他歌手
            id:'',                                      //网址上的id
            table:['编号','歌曲标题','时长','专辑']       //歌曲列表的标题传入子组件
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        //获取该歌手的热门歌曲
        getSongs(){
            let id = this.$route.params.id;
            this.axios.get('/singer?id=' + id).then(res => {
                this.music = [];
                let data = res.data.result;
                data.forEach(el => {
                    el.songURL = require('../assets/musiclist/' + el.songURL);
                    el.image = require('../assets/music_image/' + el.image);
                    this.music.push(el);
                })
            })
        },
        //获取该歌手的专辑列表
        getAlbums(){
            let id = this.$route.params.id;
            this.axios.get('/singer/albums?id=' + id).then(res => {
                this.album = [];
                let data = res.data.result;
                data.forEach(el => {
                    el.CDurl = require('../assets/album_image/' + el.CDurl);
                    this.album.push(el);
                })
            })
        },
        //获取该歌手的自我简介
        getSingerIntroduce(){
            let id = this.$route.params.id;
            this.axios.get('/singer/singer?id=' + id).then(res => {
                let data = res.data.result[0];
                data.image_lg = require('../assets/singer/lg/' + data.image_lg);
                data.image_sm = require('../assets/singer/sm/' + data.image_sm);
                this.singerIntr = data;
            })
        },
        //获取其它歌手的信息
        getOtherSinger(){
            let id = this.$route.params.id;
            this.otherSinger = [];
            this.axios.get('/singer/other?id=' + id).then(res => {
                let data = res.data.result;
                data.forEach(el => {
                    el.image_lg = require('../assets/singer/lg/' + el.image_lg);
                    el.image_sm = require('../assets/singer/sm/' + el.image_sm);
                    this.otherSinger.push(el);
                });
            })
        },
        //改变歌曲的id
        changeId(){
            this.id = this.$route.params.id;
        },
        //改变高亮显示,和下方显示
        changeLight(index){
            this.light = index;
            switch (index){
                case 0:
                    this.showName = 'song';
                    break;
                case 1:
                    this.showName = 'album';
                    break;
                case 2:
                    this.showName = 'introduce'
                    break;
            }
        },
        
    },
    created(){
        this.getSongs();
        this.getAlbums();
        this.getSingerIntroduce();
        this.getOtherSinger();
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
    },
    watch:{
        id(){
            this.getSongs();
            this.getAlbums();
            this.getSingerIntroduce();
            this.getOtherSinger();
        }
    }
}
</script>
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
    /* 左边内容区域 */
    #content .left{
        width: 710px;
        box-sizing: border-box;
        padding: 40px 35px;
    }
    #content .left .itr{
        width: 100%;
        height: 333px;
        margin-bottom: 1px;
    }
    #content .left .itr .itr_f1{
        width: 100%;
        height: 34px;
        font-size: 24px;
        line-height: 24px;
        font-weight: normal;
    }
    #content .left .itr .itr_i1{
        width: 640px;
        height: 300px;
        border: 1px solid #999;
    }
    #content .left .itr .itr_i1>img{
        width: 100%;
    }
    #content .left .m_tabs{
        display: flex;
        width: 640px;
        height: 40px;
        background-color: #eee;
        border: 1px solid #ccc;
        border-bottom: none;
    }
    #content .left .m_tabs>.tab-item{
        box-sizing: border-box;
        list-style: none;
        flex-basis: 20%;
        height: 40px;
        text-align: center;
        line-height: 40px;
        color: #666;
        font-size: 16px;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #ccc;
        cursor: pointer;
    }
    #content .left .m_tabs>.tab-item.active{
        border-left: 1px solid #ccc;
        border-right: 1px solid #ccc;
        border-top: 2px solid #6639a6;
        border-bottom: none;
        background-color: #F9F7F7;
    }
    #content .left .m_tabs>.tab-item:first-child.active{
        border-left: none;
    }
    #content .left .m_tabs>.tab-seat{
        box-sizing: border-box;
        flex-basis: 40%;
        border-bottom: 1px solid #ccc;   
        border-top: 1px solid #ccc;
    }
    #content .left .songArticle .article_1{
        display: flex;
        height: 47px;
        margin-bottom: 15px;
        justify-content: space-between;
    }
    #content .left .songArticle .article_1 .art_f{
        line-height: 75px;
        color: #666;
        font-size: 14px;
        font-weight: 600;
    }


    
   
    /* 专辑区域 */
    #content .left .album{
        display: flex;
        justify-content: start;
        flex-wrap: wrap;
    }
    #content .left .album .album-item{
        width: 145px;
        height: 120px;
        margin-top: 20px;
        background: url('/img/singer/coverall.png') no-repeat -170px -850px;
        flex-basis: 25%;
    }
    #content .left .album .album-item .url{
        display: block;
        width: 120px;
        height: 120px;
    }
    #content .left .album .album-item .url>img{
        width: 100%;
    }
    #content .left .album .album-item .cd_name{
        display: block;
        width: 120px;
        height: 24px;
        margin-top: 5px;
        line-height: 24px;
        text-decoration: none;
        white-space: nowrap;
        overflow: hidden;
        text-overflow:ellipsis;
        font-size: 14px;
        color: #666;
        font-weight: 600;
    }
    #content .left .album .album-item .cd_time{
        display: block;
        width: 120px;
        height: 20px;
        font-size: 12px;
        color: #666;
        text-decoration: none;
    }
    /* 艺人介绍 */
    #content .left .itro{
        width: 100%;
    }
    #content .left .itr>div{
        width: 100%;
    }

    /* 右边内容区域 */
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
<style>
    .title_f{
        height: 30px;
        line-height: 30px;
        font-size: 16px;
        font-weight: 600;
        color: #333;
        margin-top: 15px;
    }
    .content_f{
        line-height: 150%;
        font-size: 14px;
        color: #666;
        margin: 10px 0;
    }
</style>