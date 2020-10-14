<template>
    <div id="main">
        <!-- 设置头部导航栏 -->
        <my-nav :light="0"></my-nav>
        <!-- 设置小导航栏 -->
        <my-littlenav :light="0" :light_top="0"></my-littlenav>
        <!-- 设置轮播图板块 -->
        <div id="carousel" :style="{backgroundImage: carousel[0] && carousel[banner_page].color}">
            <div class="container">
                <!-- 轮播图区域 -->
                <my-swiper :carousel="carousel" v-on:say="receive"></my-swiper>
                <!-- 下载区域 -->
                <div id="download">
                    <img src="/img/index/load.png">
                    <router-link to="/" class="mask"></router-link>
                </div>
            </div>
        </div>
        <!-- 内容区域 -->
        <div id="content">
            <!-- 左边的区域 -->
            <div class="left">
                <!-- 第一部分：歌单区域 -->
                <p class="title">歌单推荐</p>
                <div class="playlist">
                    <div class="playlist-item" v-for="(p,index) of songlist" :key="index">
                        <router-link :to="`/songlist/${p.id}`">
                            <img :src="p.image_sm">
                            <p>{{p.listName}}</p>
                            <div class="mask">
                                <img src="/img/index/air.png" class="img_1">
                                <img src="/img/index/play.png" class="img_2">
                            </div>
                        </router-link>
                    </div>
                </div>
            </div>
            <!-- 右侧区域 -->
            <div class="right">
                <div class="login" v-if="$store.state.isloaded == false">
                    <p>登录麦吉音乐，倾听世界的声音</p>
                    <router-link to="/login">用户登录</router-link>
                </div>
                <div class="loaded" v-else>
                    <div class="r_img">
                        <img :src="'http://127.0.0.1:3000/api/download/' + $store.state.user.imgURL">
                    </div>
                    <div class="r_f">
                        <p class="u_1">{{$store.state.user.nickname}}</p>
                    </div>
                </div>
            </div>
        </div>  

        <!-- 脚步区域 -->
        <my-footer></my-footer>                          
    </div>
</template>
<style scoped>
    /* 轮播图 */
    #carousel{
        width: 100%;
        height: 285px;
    }
    #carousel .container{
        display: flex;
        position: relative;
        width: 984px;
        height: 285px;
        margin: 0 auto;
    }
    #carousel .container #download{
        position: relative;
        width: 254px;
        height: 285px;
    }
    #carousel .container #download .mask{
        display: block;
        position: absolute;
        width: 214px;
        height: 55px;
        left: 19px;
        top: 186px;
        border-radius: 3px;
        background-color: rgba(255,255,255,.1);
    }
    #carousel .container #download .mask:hover{
        background-color: rgba(255,255,255,.01);
    }
    /* 内容区域 */
    #content{
        display: flex;
        flex-wrap: nowrap;
        width: 984px;
        min-height: calc(100vh - 437px);
        border: 1px solid #c9d6df;
        border-bottom: none;
        border-top: none;
        margin: 0 auto;
        background-color: #f9f7f7;
        font-size: 14px;
        box-sizing: border-box;
    }
    #content .left{
        width: 730px !important;
        padding: 20px;
        box-sizing: border-box;
    }
    #content .left .title{
        width: 100%;
        height: 30px;
        border-bottom: 2px solid #878ecd;
        font: 20px '微软雅黑';
        color: #6639a6;
        letter-spacing: 4px;
        margin-bottom: 20px;
    }
    #content .left .playlist{
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    #content .left .playlist .playlist-item{
        position: relative;
        flex-basis: 20.01%;
        height: 200px;
        margin-bottom: 20px;
    }
    #content .left .playlist .playlist-item a{
        text-decoration: none;
        color: #000;
        font-size: 14px;
    }
    #content .left .playlist .playlist-item p{
        padding-top: 3px;
        line-height: 20px;
    }
    #content .left .playlist .playlist-item .mask{
        position: absolute;
        width: 140px;
        height: 27px;
        background-color: rgba(55,55,55,.6);
        left: 0px;
        top: 113px;
    }
    #content .left .playlist .playlist-item .mask .img_1{
        width: 16px;
        position: absolute;
        left: 15px;
        top: 5px;
    }
    #content .left .playlist .playlist-item .mask .img_2{
        width: 16px;
        position: absolute;
        right: 15px;
        top: 6px;
    }

    #content .right{
        width: 254px;
        border-left: 1px solid #c9d6df;
    }
    #content .right .login{
        width: 100%;
        height: 130px;
        background-image: linear-gradient(to top,#ccc,#FBFBFB);
    }
    #content .right .login p{
        font-size: 16px;
        color: #666;
        padding: 20px 20px;
        letter-spacing: 2px;
        line-height: 22px;
        text-align: center;
    }
    #content .right .login a{
        display: block;
        text-decoration: none;
        width: 100px;
        height: 30px;
        margin: 0 auto;
        text-align: center;
        line-height: 30px;
        background-color: #a56cc1;
        border-radius: 3px;
        color: #fff;
        cursor: pointer;
    }
    #content .right .login a:hover{
        background-color: #9d6dfc;
    }
    #content .right .loaded{
        display: flex;
        width: 100%;
        height: 100px;
        background-image: linear-gradient(to top,#ccc,#FBFBFB);
    }
    #content .right .r_img{
        box-sizing: border-box;
        width: 80px;
        height: 80px;
        border: 1px solid #ccc;
        margin: 10px;
    }
    #content .right .r_img>img{
        width: 100%;
    }
    #content .right .r_f{
        width: 150px;
        margin: 10px;
    }
    .u_1{
        width: 140px;
        white-space: nowrap;
        text-overflow: ellipsis;
        font-size: 16px;
        font-weight: 400;
        color: #a56cc1;
    }

</style>
<script>
import MyNav from '../components/MyNav.vue'
import MyLittlenav from '../components/MyLittlenav.vue'
import MySwiper from '../components/index/MySwiper.vue'
import MyFooter from '../components/MyFooter.vue'
import storage from '../common/storage.js'
export default {
    components:{
        MyNav,
        MyLittlenav,
        MySwiper,
        MyFooter
    },
    data(){
        return {
            carousel:[],
            songlist:[],
            banner_page:0,
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        //接收轮播子组件传递过来的数据
        receive(data){
            this.banner_page = data;
        },
        //请求轮播图数据
        getSwiperData(){
            this.axios.get('/index/carousel').then( res => {
                let data = res.data.result;
                data.forEach(el => {
                    el.img = require('../assets/' + el.img);
                    this.carousel.push(el);
                });
                this.carousel.push(this.carousel[0]);
            })
        },
        //请求歌单数据
        getSongList(){
            this.axios.get('/index/songlist').then( res => {
                let data = res.data.result;
                data.forEach(el => {
                    el.image_sm = require('../assets/type/sm/' + el.image_sm);
                    el.image_lg = require('../assets/type/lg/' + el.image_lg);
                    this.songlist.push(el);
                })
            })
        }
    },
    mounted(){
        this.getSwiperData();
        this.getSongList();
        this.getSessionstorge();
        this.getuserMessage();
    }
}
</script>