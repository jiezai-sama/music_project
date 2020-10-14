<template>
    <div>
        <div id="notlog" :style="{display:isShow ? 'block' : 'none'}" v-if="!$store.state.isloaded">
            <div class="close" @click="close">
                <img src="/img/me/err_white.png" alt="">
            </div>
            <div class="s_1 f_t">提示</div>
            <div class="s_2">
                <p class="f_2">亲爱的用户，您还没有登陆</p>
                <div class="a_btn">
                    <button class="mybtn" @click="reg">去注册</button>
                    <button class="mybtn" @click="log">去登陆</button>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
    #notlog{
        position: fixed;
        width: 480px;
        height: 180px;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        border: 1px solid #333;
        border-radius: 8px;
        background-color: #fff;
    }
    .close{
        position: absolute;
        cursor: pointer;
        right: 10px;
        top: 12px;
        width: 15px;
        height: 15px;
    }
    .close>img{
        width: 100%;
    }
    .s_1{
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        line-height: 40px;
        padding-left: 20px;
        background-color: #2D2D2D;
    }
    .f_t{
        font-size: 14px;
        color: #fff;
        font-weight: 600;
    }
    .s_2{
        display: flex;
        width: 100%;
        height: 140px;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
    }
    .f_2{
        font-size: 16px;
        color: #333;
        font-weight: 600;
    }
    .a_btn{
        display: flex;
        justify-content: center;
    }
    .mybtn{
        display: block;
        width: 80px;
        height: 30px;
        text-align: center;
        color: #6639A6;
        margin: 0px 20px;
    }
</style>
<script>
export default {
    props:{
        show:{
            type:[Number],
            require: true
        }
    },
    data(){
        return {
            isShow: false
        }
    },
    methods:{
        close(){
            this.isShow = false;
        },
        log(){
            this.$router.push('/login');
        },
        reg(){
            this.$router.push('/register');
        }
    },
    watch:{
        show(){
            this.isShow = true;
        }
    }
}
</script>  