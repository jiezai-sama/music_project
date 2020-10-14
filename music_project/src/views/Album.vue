<template>
    <div id="album">
        <my-nav :light="0"></my-nav>
        <my-littlenav :light_top="0" :light="undefined"></my-littlenav>
        <!-- 内容区域 -->
        <div id="content">
            <!-- 左区域 -->
            <div class="left">
                <div class="intr_1">
                    <div class="intr1_left">
                        <div class="img">
                            <img :src="detail.CDurl">
                        </div>
                    </div>
                    <div class="intr1_right">
                        <div class="detail_1">
                            <p class="tag">专 辑</p>
                            <p class="title">{{detail.CDName}}</p>
                        </div>
                        <p>
                            <span>歌手：</span>
                            <span>
                                <router-link class="singer" :to="`/singer/${detail.singerId}`">{{detail.singerName}}</router-link>
                            </span>
                        </p>
                        <p>
                            <span>发行时间：</span>
                            <span>{{detail.publishDate}}</span>
                        </p>
                        <p>
                            <span>发行公司：</span>
                            <span>{{detail.publisher}}</span>
                        </p>
                        <!-- 按钮 -->
                        <my-btn :music="songs"></my-btn>
                    </div>
                </div>

                <div class="intr_2">
                    <p class="intr2_title">个人简介：</p>
                    <div class="text_show" v-html="detail.introduce" :style="{height:isOpen ? '' : '96px'}" :class="isOpen ? '' : 'hide'"></div>
                </div>
                <!-- 收起，展开个人简介 -->
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
                <!-- 歌曲区域 -->
                <div class="list">
                    <p>歌曲列表</p>
                    <my-table :music="songs" :title="table" :notWant="5"></my-table>
                </div>
            </div>
            <!-- 右侧区域展示 -->
            <div class="right">
                <p class="title">相关专辑推荐</p>
                <ul class="range_1">
                    <li v-for="(p,index) of others" :key="index" @click="changeId">
                        <div class="img">
                            <router-link :to="`/album/${p.CDId}`"><img :src="p.CDurl"></router-link>
                        </div>
                        <div class="text">
                            <p class="title_1">
                                <router-link :to="`/album/${p.CDId}`">{{p.CDName}}</router-link>
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
            detail:{},
            isOpen:false,
            songs:[],
            table:['编号','歌曲标题','时长','歌手'],
            others:[],
            id:0
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        //请求专辑详情数据函数，在created调用
        getAlbumDetails(){
            let id = this.$route.params.id;
            this.axios.get('/album?id=' + id).then(res => {
                let data = res.data.result[0];
                data.CDurl = require('../assets/album_image/' + data.CDurl);
                this.detail = data;
            })
        },
        //请求专辑的歌曲数据，在created调用
        getAlbumSongs(){
            let id = this.$route.params.id;
            this.axios.get('/album/song?id=' + id).then(res => {
                let data = res.data.result;
                data.forEach(el => {
                    el.image = require('../assets/music_image/' + el.image);
                    el.songURL = require('../assets/musiclist/' + el.songURL);
                    this.songs.push(el);
                });
            })
        },
        //请求相关推荐的专辑，在created调用
        getOtherAlubm(){
            let id = this.$route.params.id;
            this.axios.get('/album/other?id=' + id).then(res => {
                let data = res.data.result;
                data.forEach(el => {
                    el.CDurl = require('../assets/album_image/' + el.CDurl);
                })
                this.others = data;
            });
        },
        //点击跳转到同组件，id不同的页面时，重新获取id值
        changeId(){
            this.id = this.$route.params.id;
        },
        //改变自我简介的收起展开
        changeShow(){
            if (this.isOpen){
                this.isOpen = false;
            }else{
                this.isOpen = true;
            }
        },
    },
    created(){
        this.getAlbumDetails();
        this.getAlbumSongs();
        this.getOtherAlubm();
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
    },
    watch:{
        id(){
            this.getAlbumDetails();
            this.getAlbumSongs();
            this.getOtherAlubm();
        }
    }
}
</script>
<style scoped>
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
        width: 210px;
        height: 177px;
        background-image: url('/img/album/coverall.png');
        background-position: 0 -986px;
    }
    #content .left .intr_1 .intr1_left .img{
        width: 177px;
        height: 177px;
        border: 1px solid #c9d6df;
    }
    #content .left .intr_1 .intr1_right{
        width: 360px;
        margin-left: 20px;
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
    #content .left .intr_1 .intr1_right>p .singer{
        text-decoration: none;
        color: #333;
    }
    #content .left .intr_1 .intr1_right>p .singer:hover{
        text-decoration: underline;
    }
   
    #content .left .intr2_title{
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 15px;
    }
    #content .left .intr_2 .text_show{
        width: 100%;
        text-overflow: ellipsis;
        min-height: 96px;
    }
    #content .left .intr_2 .text_show.hide{
        overflow: hidden;
    }
    #content .left .arrow>div{
        text-align: right;
        cursor: pointer;
    }
    #content .left .arrow .arrow_font{
        font-size: 12px;
        color: #6639a6;
        margin-right: 5px;
    }
    #content .left .arrow .arrow_down{
        display: inline-block;
        width: 20px;
        height: 20px;
        background: url('/img/album/down.png') no-repeat;
        background-position: 0px 10px;
    }
    #content .left .arrow .arrow_up{
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
    #content .left .intr_2 .text_show p{
        font-size: 12px;
        line-height: 24px;
        text-indent: 24px;
        color: #666;
    }
</style>