<template>
    <div id="register">
        <div class="container">
            <div class="page">
                <div class="page_1">
                    <img src="/img/index/logo.png">
                    <p class="detail">带你聆听世界的声音</p>
                </div>
                <div class="page_2">
                    <p class="title">注册</p>
                    <div class="uname">
                        <span>用户名</span>
                        <input type="text" placeholder="请输入6~12位的用户名" @blur="uname_check" v-model="uname">
                        <div class="icon">
                            <img :src="`/img/register/${uname_img}`">
                        </div>
                    </div>
                    <div class="upwd">
                        <span>密码</span>
                        <input type="password" placeholder="请输入8~12位的密码" @blur="upwd_check" v-model="upwd">
                        <div class="icon">
                            <img :src="`/img/register/${upwd_img}`">
                        </div>
                    </div>
                    <div class="cpwd">
                        <span>确认密码</span>
                        <input type="password" placeholder="请确认密码" @blur="cpwd_check" v-model="cpwd">
                        <div class="icon">
                            <img :src="`/img/register/${cpwd_img}`">
                        </div>
                    </div>
                    <button @click="handle">注  册</button>
                    <div class="warning" :class="message">用户名已存在</div>
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
        font: bolder 20px '方正舒体';
    }
    .container .page .page_2 .title{
        font: bolder 35px '方正舒体';
        text-align: center;
        margin-bottom: 30px;
    }
    .container .page .page_2 input{
        box-sizing: border-box;
        width: 300px;
        height: 40px;
        border: none;
        border-bottom: 1px solid #faf;
        outline: none;
        margin-bottom: 10px;
    }
    .container .page .page_2 button{
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
    .uname,.upwd,.cpwd{
        position: relative;
    }
    .icon{
        position: absolute;
        left: 270px;
        top:35px;
    }
    .warning{
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        left: 130px;
        top: 210px;
        width: 120px;
        height: 30px;
        border-radius: 10px;
        background-color:rgba(82,18,98,.4);
        font: bolder 14px '微软雅黑';
        box-shadow: 1px 1px 1px 1px #521262;
        color: #b80d57;
        opacity: 0;
        transition: 3s ease-out;
    }
    .warning.active{
        opacity: 1;
    }
</style>
<script>
export default {
    data(){
        return {
            uname:'',
            upwd:'',
            cpwd:'',
            uname_img:'empty.png',
            upwd_img:'empty.png',
            cpwd_img:'empty.png',
            code:0,
            message:''
        }
    },
    methods:{
        uname_check(){
            let unameRegExp = /^[a-zA-Z0-9]{6,12}$/;
            if (unameRegExp.test(this.uname)){
                this.uname_img = 'success.png';
                return true;
            }else{
                this.uname_img = 'err.png';
                return false;
            }
        },
        upwd_check(){
            let upwdRegExp = /^[a-zA-Z0-9]{8,12}$/;
            if (upwdRegExp.test(this.upwd)){
                this.upwd_img = 'success.png';
                return true;
            }else{
                this.upwd_img = 'err.png';
                return false;
            }
        },
        cpwd_check(){
            if (this.upwd == this.cpwd){
                this.cpwd_img = 'success.png';
                return true;
            }else{
                this.cpwd_img = 'err.png';
                return false;
            }
        },
        //获取当前时间的函数
        getTime(){
            let time = new Date();
            let year = time.getFullYear();
            let month =time.getMonth() + 1;
            let date = time.getDate();
            time = '' + year + '-' + month + '-' + date;
            return time
        },
        handle(){
            let time = this.getTime();
            if (this.uname_check() && this.upwd_check() && this.cpwd_check()){
                this.axios.post('/register','uname=' + this.uname + '&upwd=' + this.upwd +'&time=' + time).then(res => {
                    if (res.data.code == 0){
                        this.code++;
                    }else{
                        this.$router.push('/register/success');
                    }
                })
            }
        }
    },
    watch:{
        code(){
            this.message = 'active';
            setTimeout(() => {
                this.message = ''
            },5000);
        }
    }
}
</script>