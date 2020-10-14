<template>
    <div id="songlist">
        <!-- 设置头部导航栏 -->
        <my-nav :light="0"></my-nav>
        <!-- 设置小导航栏 -->
        <my-littlenav :light_top="0" :light="undefined" ></my-littlenav>
        <!-- 内容区域 -->
        <div id="content">
            <div class="left">
                <div class="introduce">
                    <div class="img"><img :src="list.image_lg"></div>
                    <div class="detail">
                       <div class="detail_1">
                            <p class="tag">歌 单</p>
                            <p class="title">{{list.listName}}</p>
                        </div>
                        <p>
                            <span>创建者：</span>
                            <span>{{list.nickname}}</span>
                        </p>
                        <p>
                            <span>标签:</span>
                            <span>{{list.tags}}</span>
                        </p>
                        <p>
                            <span>简介:</span>
                            <span>{{list.introduce}}</span>
                        </p>
                        <!-- 按钮 -->
                        <my-btn :music="music"></my-btn>
                    </div>
                </div> 
                <div class="list">
                    <p>歌曲列表</p>
                    <!-- 歌曲列表 -->
                    <my-table :title="table" :music="music" :notWant="0"></my-table>
                </div>
            </div>
            <div class="right">
                <p class="title">相关推荐</p>
                <ul class="range_1">
                    <li v-for="(p,index) of recommend" :key="index" @click="changeId">
                        <div class="img">
                            <router-link :to="`/songlist/${p.id}`"><img :src="p.image_sm"></router-link>
                        </div>
                        <div class="text">
                            <p class="title_1">
                                <router-link :to="`/songlist/${p.id}`">{{p.listName}}</router-link>
                            </p>
                            <p class="user">
                                <span>by</span>
                                <router-link :to="`/user/${p.userId}`">{{p.nickname}}</router-link>
                             </p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
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
    #content .left .introduce{
        display: flex;
        margin-bottom: 40px;
    }
    #content .left .introduce .img{
        width: 208px;
        height: 208px;
        box-sizing: border-box;
        border: 1px solid #a56cc1;
        background-color:#d6e6f2;
        padding: 3px;
        box-shadow: 1px 1px 1px 0px #a6acec;
    }
    #content .left .introduce .detail{
        width: 402px;
        padding-left: 20px;
        box-sizing: border-box;
    }
    #content .left .introduce .detail .detail_1{
        display: flex;
        margin-bottom: 30px;
    }
    #content .left .introduce .detail .detail_1 .tag{
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
    #content .left .introduce .detail .detail_1 .title{
        font:  20px '微软雅黑';
        line-height: 26px;
    }
    #content .left .introduce .detail>p span:first-child{
        font: bold 15px '微软雅黑';
        margin-right: 15px;
        line-height: 30px;
    } 
    #content .left .introduce .detail>p span:nth-child(2){
        font-size: 14px;
    }
    
    #content .left .list p{
        font-size: 20px;
        margin-bottom: 20px;
    }
    #content .right{
        width: 270px;
        padding: 20px 40px 40px 30px;
        border-left: 1px solid #c9d6df;
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
            list:{},
            music:[],
            table:['编号','歌曲标题','时长','歌手','专辑'],
            recommend:[],
            id:0
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        //页面进入,请求歌单详情数据
        getListDetails(){
            let id = this.$route.params.id;
            this.id = id;
            this.axios.get('/songlist?id=' + id).then(res => {
                let data = res.data.result[0];
                data.image_lg = require('../assets/type/lg/' + data.image_lg);
                this.list = data;
            });
        },
        //页面进入，请求歌单歌曲数据
        getListMusic(){
            let id = this.$route.params.id;
            this.axios.get('/songlist/music?id=' + id).then(res => {
                this.music = [];
                let data = res.data.result;
                data.forEach(el => {
                    el.image = require('../assets/music_image/' + el.image);
                    el.songURL = require('../assets/musiclist/' + el.songURL);
                    this.music.push(el);
                });
            })
        },
        //页面进入，请求相关推荐歌单数据
        getRecommendList(){
            let id = this.$route.params.id;
            this.axios.get('/songlist/recommend?id=' + id).then(res => {
                this.recommend = [];
                let data = res.data.result;
                data.forEach(el => {
                    el.image_sm = require('../assets/type/sm/' + el.image_sm);
                    this.recommend.push(el);
                });
            })
        },
        changeId(){
            this.id = this.$route.params.id;
        }
    },
    created(){
        this.getListDetails();
        this.getListMusic();
        this.getRecommendList();
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
    },
    watch:{
        id(){
            this.getListDetails();
            this.getListMusic();
            this.getRecommendList();           
        }
    }
}
</script>