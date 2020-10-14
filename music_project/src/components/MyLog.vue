<template>
    <div id="login">
        <div class="show" :style="{display: isShow ? 'block' : 'none'}">
            <div class="page" >
                <div class="close" @click="changeshow">
                    <img src="/img/me/err.png" alt="">
                </div>
                <div class="page_1">
                    <img src="/img/index/logo.png">
                    <p class="detail">带你聆听世界的声音</p>
                </div>
                <div class="page_2">
                    <p class="title">登录麦吉音乐</p>
                    <p class="detail">查看并管理您收藏的私人音乐</p>
                    <p class="detail">方便随时收听</p>
                    <button @click="to">去登录</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            isShow: true
        }
    },
    methods:{
        to(){
            this.$router.push('/login');
        },
        changeshow(){
            this.isShow = false;
            console.log(1);
        }
    }
}
</script>
<style scoped>
    .show{
        width: 768px;
        height: 480px;
        position: fixed;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
    }
    .page{
        display: flex;
        width: 768px;
        height: 480px;
        border-radius: 10px;
        box-shadow: 4px 4px 10px 1px #000;
        overflow: hidden;
    }
    .close{
        position: absolute;
        width:25px;
        height: 25px;
        right: 10px;
        top: 10px;
        z-index: 999;
        cursor: pointer;
    }
    .close>img{
        width: 100%;
    }
    .page .page_1{
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 304px;
        padding: 0px 40px;
        background-color:#521262;
    }
    .page .page_1 img{
        height: 110px;
    }
    .page .page_1 .detail{
        padding: 0px 15px;
        font: bolder 16px '黑体';
        color: #ddd;
        text-align-last: justify;
    }
    .page .page_2{
        display: flex;
        position: relative;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        width: 384px;
        background-color: #fff;
        padding: 70px 40px;
        box-sizing: border-box;
    }
    .page .page_2 .title{
        font-size: 26px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 30px;
        color: #521262;
    }
  
    .page .page_2 button{
        display: block;
        width: 150px;
        height: 40px;
        margin-top: 10px;
        border-radius: 10px;
        font: bold 20px '微软雅黑';
        cursor: pointer;
        color: #521262;
        border: 1px solid #521262;
    }
   
</style>