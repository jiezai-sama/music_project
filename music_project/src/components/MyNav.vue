<template>
    <!-- 设置头部导航栏 -->
        <div id="navbar">
            <div class="container">
                <div><img src="/img/index/logo.png"></div>
                <ul class="nav_1">
                    <li class="nav-item" v-for="(item,index) of navList" :key="index" :class="heightLight == index ? active : ''" @click="moveTo(index)">
                        <router-link :to="url[index]">{{item}}</router-link> 
                    </li>
                </ul>
                <ul class="nav_2">
                    <li class="nav-item font">
                        <my-search></my-search>
                    </li>
                    <li class="nav-item font" v-if="$store.state.isloaded == false">
                        <router-link to="/register">注册</router-link>
                        <span>|</span>
                        <router-link to="/login">登录</router-link>
                    </li>
                    <li class="nav-item circle" v-else @mouseover="changeshow(1)" @mouseleave="changeshow(2)">
                        <div>
                            <img :src="'http://127.0.0.1:3000/api/download/' + $store.state.user.imgURL">
                        </div>
                        <div class="selector" :style="{display:show ? 'block' : 'none'}">
                            <router-link to="/me" class="f_1">我的主页</router-link>
                            <router-link to="/mymessage" class="f_1">个人设置</router-link>
                            <p class="f_1" @click="removeMessage">退出</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
</template>
<script>
import MySearch from './MySearch.vue'
export default {
    props:{
        'light':{
            type:[String,Number],
            require:true
        }
    },
    components:{
        MySearch
    },
    data(){
        return {
            active:'active',
            heightLight: 0,
            navList:['发现音乐','我的音乐'],
            url:['/','/me'],
            show: false
        }
    },
    methods:{
        //跳转
        moveTo(index){
            this.$router.push(this.url[index]);
        },
        //确定navbar中谁高亮显示
        lights(){
            this.heightLight = this.light;
        },
        //移除用户信息,歌单信息
        removeMessage(){
            this.$store.commit('removeUserMessage');
            this.$store.commit('removeAllList');
        },
        changeshow(count){
            if (count == 1){
                this.show = true;
            }else{
                this.show = false;
            }
        }
    },
    mounted(){
        this.lights();
    }
}
</script>
<style scoped>
    #navbar{
        width: 100%;
        height: 70px;
        background-color: #242424;
    }
    #navbar .container{
        display: flex;
        width: 1100px;
        height: 70px;
        margin: 0 auto;
        justify-content: start;
        font-size: 16px;
    }

    #navbar .container .nav_1{
        display: flex;
        justify-content: start;
        min-width: 285px;
        padding: 0px 290px 0px 30px;
        color: #ccc;
    }
    #navbar .container .nav_1 .nav-item{
        list-style: none;
        width: 95px;
        height: 70px;
        text-align: center;
        line-height: 70px;
        cursor: pointer;
    }
    #navbar .container .nav_1 .nav-item a{
        text-decoration: none;
        color: #ccc;
        font-size: 16px;
    }

    #navbar .container .nav_1 .nav-item:hover{
        background-color: #000;
    }
    .active{
        background-color: #000;
    }

    #navbar .container .nav_2{
        display: flex;
        justify-content: space-between;
        width: 315px;
        height: 70px;
    }
    #navbar .container .nav_2 .nav-item{
        position: relative;
        height: 70px;
    }
    .font{
        line-height: 70px;
    }
    #navbar .container .nav_2 a{
        text-decoration: none;
        color: #ccc;
        font-size: 16px;
    }
    #navbar .container .nav_2 span{
        color: #ccc;
        margin: 0 5px;
    }
    .circle{
        display: flex;
        align-items: center;
        position: relative;
    }
    .circle>div:first-child{
        cursor: pointer;
        width: 40px;
        height: 40px;
        margin-right: 20px;
        border-radius: 10px;
        overflow: hidden;
    }
    .circle>div>img{
        width: 100%;
        border-radius: 50%;
    }
    #navbar .selector{
        position: absolute;
        width: 150px;
        left: -60px;
        top: 70px;
        background-color: #242424;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        z-index: 999;
    }
    #navbar .selector .f_1{
        display: block;
        cursor: pointer;
        width: 100%;
        height: 40px;
        line-height: 40px;
        text-align: center;
        font-size: 16px;
        color: #aaa;
    }
    #navbar .selector .f_1:hover{
        background-color: #111;
    }
</style>