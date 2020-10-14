<template>
    <div id="me">
        <!-- 导航栏 -->
        <my-nav :light="1"></my-nav>
        <!-- 小导航栏 -->
        <my-littlenav :light_top="1" :light="undefined"></my-littlenav>
        <!-- 内容区域 -->
        <div id="content_1" v-if="$store.state.isloaded">
            <div class="left">
                <!-- 折叠栏 -->
                <my-collapse :title="title" :images="images" :list="createlist" v-on:changeCount="changeCount"></my-collapse>
            </div>
            <div class="right">
                <div class="introduce">
                    <div class="img"><img :src="images[light]"></div>
                    <div class="detail">
                       <div class="detail_1">
                            <p class="tag">歌 单</p>
                            <p class="title">{{createlist[light] && createlist[light].userListName}}</p>
                        </div>
                        <div class="detail_2">
                            <div class="u_icon"><img :src="'http://127.0.0.1:3000/api/download/' + $store.state.user.imgURL" alt=""></div>
                            <span class="ul_t purple">{{$store.state.user.nickname}}</span>
                            <span class="ul_t">{{createlist[light] && createlist[light].createDate}}创建</span>
                        </div>
                        <!-- 按钮 -->
                        <my-btn :notWant="3" :music="music"></my-btn>
                    </div>
                </div>
                <!-- 音乐列表 -->
                <my-table :title="table" :music="music" :del="true" v-on:updateS="updateS"></my-table>
            </div>
        </div>
        <div id="content_2" v-else>
            <!-- 提示去登陆 -->
            <my-log></my-log>
        </div>
        <!-- 脚部区域 -->
        <my-footer></my-footer>
    </div>
</template>
<script>
import MyNav from '../components/MyNav.vue'
import MyLittlenav from '../components/MyLittlenav.vue'
import MyFooter from '../components/MyFooter.vue'
import MyCollapse from '../components/MyCollapse.vue'
import MyLog from '../components/MyLog.vue'
import MyBtn from '../components/Myplaybtn.vue'
import MyTable from '../components/MyTablelist.vue'
import storage from '../common/storage.js'
export default {
    components:{
        MyNav,
        MyLittlenav,
        MyFooter,
        MyCollapse,
        MyLog,
        MyBtn,
        MyTable
    },
    data(){
        return {
            images:['/img/userimg/1.jpg','/img/userimg/2.jpg','/img/userimg/3.jpg','/img/userimg/4.jpg','/img/userimg/5.jpg','/img/userimg/6.jpg','/img/userimg/7.jpg','/img/userimg/8.jpg','/img/userimg/9.jpg'],
            title:'创建的歌单',       //传入collapse组件的名字
            light:0,                 //歌单高亮显示下标
            table:['编号','歌曲标题','时长','歌手','专辑'], 
            music:[]
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        updateS(){
            this.getUserListSongs();
        },
        //改变高亮的显示的下标
        changeCount(index){
            this.light = index;
            this.getUserListSongs();
        },
        //请求用户显示的该歌单中的歌曲
        getUserListSongs(){
            if (JSON.stringify(this.createlist) != '[]'){
                let id = this.createlist[this.light].uListId;
                this.axios.get('/me/song?id=' + id).then(res => {
                    this.music = [];
                    let data = res.data.result;
                    if (data.length != 0){
                        data.forEach(el => {
                            el.image = require('../assets/music_image/' + el.image);
                            el.songURL = require('../assets/musiclist/' + el.songURL);
                            this.music.push(el);
                        })
                    }
                })
            }
        }
    },
    computed:{
        createlist(){
            return this.$store.state.userList;
        }
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
        this.getUserListSongs();
    },
    watch:{
        
    }
}
</script>
<style scoped>
    /* 内容区域 */
    #content_1,#content_2{
        display: flex;
        width: 980px;
        margin: 0 auto;
        background-color: #f9f7f7;
        min-height: calc(100vh - 105px);
        border: 1px solid #c9d6df;
        border-bottom: none;
        border-top: none;
    }
    #content_1 .left{
        width: 270px;
        border-right: 1px solid #c9d6df;
        box-sizing: border-box;
    }
    #content_1 .right{
        width: 710px;
        box-sizing: border-box;
        padding: 40px 35px;
    }
    

    #content_1 .right .introduce{
        display: flex;
        margin-bottom: 40px;
    }
    #content_1 .right .introduce .img{
        width: 208px;
        height: 208px;
        box-sizing: border-box;
        border: 1px solid #a56cc1;
        background-color:#d6e6f2;
        padding: 3px;
        box-shadow: 1px 1px 1px 0px #a6acec;
    }
    #content_1 .right .introduce .img>img{
        width: 100%;
    }
    #content_1 .right .introduce .detail{
        width: 402px;
        padding-left: 20px; 
        box-sizing: border-box;
    }
    #content_1 .right .introduce .detail .detail_1{
        display: flex;
        margin-bottom: 30px;
    }
    #content_1 .right .introduce .detail .detail_1 .tag{
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
    #content_1 .right .introduce .detail .detail_1 .title{
        font:  20px '微软雅黑';
        line-height: 26px;
    }
    .detail_2{
        display: flex;
        align-items: center;
        width: 100%;
        height: 40px;
        margin: 20px 0px;
    }
    .u_icon{
        width: 35px;
        height: 35px;
        margin-right: 15px;
        overflow: hidden;
        border: 1px solid #333;
    }
    .u_icon>img{
        width: 100%;
    }
    .ul_t{
        font-size: 12px; 
        color: #666;
        margin-right: 8px;
    }
    .ul_t.purple{
        font-size: 14px;
        color: #6639a6;
    }

    
</style>