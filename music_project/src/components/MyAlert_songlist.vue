<template>
    <!-- 弹出的新建框 -->
    <div class="alert" :style="{display:alertShow ? 'block' : 'none'}">
        <div class="close" @click="changeAlertShow(0)">
            <img src="/img/me/err_white.png" alt="">
        </div>
        <div class="alert_t f_white">{{titles == 0 ? '修改歌单名' : '新建歌单'}}</div>
        <div class="alert_c">
            <div class="c_input">
                歌单名：
                <input type="text" v-model="value"> 
                <p class="c_detail f_red" :style="{display:warn ? 'block' : 'none'}">歌单名不能为空</p>
            </div>
            <p class="c_detail">可通过“收藏”将音乐添加到新歌单中</p>
            <button class="mybtn" @click="insert(titles)">确定</button>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        show:{
            type:[Number],
            require:true
        },
        titles:{
            type:[Number,String],
            require:true
        },
        list:{
            type:[Array],
            require:true
        },
        light:{
            type:[Number],
            require:true
        }
    },
    data(){
        return {
            alertShow: false,   //弹出框弹出与否
            warn: false,
            value:''            //用户输入的歌单名
        }
    },
    methods:{
        changeAlertShow(){
            this.alertShow = false;
            this.warn = false;
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
        //创建,修改歌单，插入数据库
        insert(state){
            if (this.titles == 1){
                if (this.value == ''){
                    this.warn = true;
                }else{
                    let id = this.$store.state.user.id;
                    let time = this.getTime();
                    this.axios.get('/me/create?value=' + this.value + '&id=' + id + '&time=' + time).then(res => {
                        if (res.data.code == 1){
                            this.alertShow = false;
                            let message = res.data.result[0];
                            this.$store.commit('addUserList',message);
                            this.value = ''
                        }
                    });
                }
            }else{
                if (this.value == ''){
                    this.warn = true;
                }else{
                    let listId = this.list[this.light].uListId;
                    this.axios.get('/me/update?value=' + this.value + '&id=' + listId).then(res => {
                        if (res.data.code == 1){
                            this.alertShow = false;
                            let message1 = {index:this.light,name:this.value};
                            this.$store.commit('updateList',message1);
                            this.value = ''
                        }
                    })
                }
            }
        }
    },
    watch:{
        show(){
            this.alertShow = true;
        }
    }
}
</script>
<style scoped>
    .alert{
        position: fixed;
        width: 480px;
        height: 210px;
        border: 1px solid #333;
        border-radius: 5px;
        background-color: #fff;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
    }
    .alert_t{
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        line-height: 40px;
        padding-left: 20px ;
        background-color: #2D2D2D;
    }
    .f_white{
        color: #fff;
        font-size: 14px;
        font-weight: 600;
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
    .alert_c{
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        width: 100%;
        height: 170px;
        padding: 10px 0px 10px 40px;
    }
    .c_input{
        width: 100%;
    }
    .c_input>input{
        width: 300px;
        height: 19px;
        padding: 5px 6px 6px;
        border: 1px solid #cdcdcd;
        border-radius: 2px;
        line-height: 19px;
        outline: none;
    }
    .c_detail{
        box-sizing: border-box;
        padding-left: 70px;
        margin-top: 10px;
        font-size: 12px;
        color: #666;
    }
    .f_red{
        color: red;
    }
    .mybtn{
        display: block;
        width: 80px;
        height: 30px;
        text-align: center;
        color: #6639A6;
        margin-left: 70px;
    }
</style>