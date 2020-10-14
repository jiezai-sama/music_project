<template>
    <div id="register">
        <div class="container">
            <div class="page">
                <div class="page_1">
                    <img src="/img/index/logo.png">
                    <p class="detail">带你聆听世界的声音</p>
                </div>
                <div class="page_2">
                    <p class="title_1">恭喜您注册成功</p>
                    <p>现在您可以:</p>
                    <router-link to="/" class='button'>返回首页</router-link>
                    <router-link to="/login" class='button'>返回登录页面</router-link>
                    <p class="title_2">还有{{seconds}}秒自动跳转到登陆页面</p>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
    .container{
        position: relative;
        width: 100vw;
        height: 100vh;
        opacity: .9;
        background: url('/img/register/bgc.png') no-repeat;
        background-size: cover;
    }
    .container .page{
        display: flex;
        position: absolute;
        width: 768px;
        height: 480px;
        left: 45%;
        top: 25%;
        border-radius: 10px;
        box-shadow: 4px 4px 10px 1px #000;
        overflow: hidden;
    }
    .container .page .page_1{
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 304px;
        padding: 0px 40px;
        background-color:#521262;
    }
    .container .page .page_1 img{
        height: 110px;
    }
    .container .page .page_1 .detail{
        padding: 0px 15px;
        font: bolder 16px '黑体';
        color: #ddd;
        text-align-last: justify;
    }
    .container .page .page_2{
        display: flex;
        position: relative;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        width: 384px;
        background-color: #fff;
        padding: 70px 40px;
        box-sizing: border-box;
        font: bolder 20px '微软雅黑';
    }
    .container .page .page_2 .title_1{
        font: bolder 35px '方正舒体';
        color: #f07b3f;
        text-align: center;
        margin-bottom: 30px;
    }
    .container .page .page_2 p{
        width: 100%;
    }
    .container .page .page_2 .title_2{
        text-align: center;
    }
    .button{
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        width: 150px;
        height: 40px;
        border: 1px solid #521262;
        border-radius: 10px;
        box-shadow: 1px 1px 1px 1px #000;
    }
</style>
<script>
export default {
    data(){
        return {
            seconds:15
        }
    },
    mounted(){
        setInterval(() => {
            this.seconds--;
        },1000);
    },
    watch:{
        seconds(){
            if (this.seconds == 0){
                this.$router.push('/login');
            }
        }
    }
}
</script>