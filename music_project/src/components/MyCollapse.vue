<template>
    <div id="collapse">
        <div class="name">
            <div class="name_1" @click="changeicon">
                <span class="tri">
                    <img :src="arrow">
                </span>
                <p class="cname">{{title}}({{list.length}})</p> 
            </div>
            <div class="btn" @click="changeAlertShow(1)">
                新建
            </div>
        </div>
        <ul class="list" :style="{display:isShow ? 'block' : 'none'}">
            <li class="list_n" :class="light == index ? 'active' : ''" v-for="(s,index) of list" :key="index"  @click="changelist(index)">
                <div class="icon">
                    <img :src="images[index]">
                </div>
                <div class="font">
                    <p class="font_f font_1" >{{list[index].userListName}}</p>
                    <p class="font_f font_2">by {{$store.state.user.nickname}}</p>
                </div>
                <span class="icon_up" title="编辑" :style="{display:index == 0 ? 'none' : 'block'}" @click="changeAlertShow(0)"></span>
                <span class="icon_del" title="删除" :style="{display:index == 0 ? 'none' : 'block'}" @click="delShows"></span>
            </li>
        </ul>
        <my-alert :show="alertShow" :titles="titles" :list="list" :light="light"></my-alert>
        <my-del :show="delShow" :list="list" :light="light"></my-del>
    </div>
</template>
<style scoped>
    .name{
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-sizing: border-box;
        padding: 0px 30px;
        margin-top: 20px;
        width: 100%;
        height: 40px;
    }
    .name:hover{
        background-color: rgba(103, 59, 165, 0.1);
    }
    .name_1{
        display: flex;
        cursor: pointer;
    }
    .tri{
        display: block;
        width: 16px;
        height: 16px;
    }
    .tri>img{
        width: 100%;
    }
    .cname{
        font-size: 16px;
        font-weight: 600;
        margin-left: 5px;
        color: #333;
    }
    .btn{
        display: block;
        width: 44px;
        height: 16px;
        border: 1px solid #6639A6;
        border-radius: 5px;
        text-align: center;
        line-height: 16px;
        font-size: 12px;
        cursor: pointer;
        color: #6639A6;
    }
    .list_n{
        list-style: none;
        display: flex;
        align-items: center;
        box-sizing: border-box;
        padding-left: 40px;
        width: 100%;
        height: 54px;
    }
    .list_n:hover{
        background-color: rgba(103, 59, 165, 0.1);
    }
    .list_n.active{
        background-color: rgba(103, 59, 165, 0.1);
    }
    .icon{
        width: 40px;
        height: 40px;
        cursor: pointer;
    }
    .icon>img{
        width: 100%;
    }
    .font{
        width: 150px;
        height: 40px;
        margin-left: 10px;
    }
    .font_f{
        width: 140px;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        cursor: pointer;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .font_1{
        font-size: 14px;
    }
    .font_2{
        color: #666;
    }
    .icon_up{
        display: block;
        cursor: pointer;
        width: 13px;
        height: 13px;
        margin: 0px 5px;
        background: url('/img/me/icon.png') no-repeat 0px -270px;
    }
    .icon_del{
        display: block;
        cursor: pointer;
        width: 13px;
        height: 13px;
        margin: 0px 5px;
        background: url('/img/me/icon.png') no-repeat 0px -284px;
    }
</style>
<script>
import MyAlert from './MyAlert_songlist.vue'
import MyDel from './MyDelalert.vue'
export default {
    components:{
        MyAlert,
        MyDel
    },
    props:{
        title:{
            type:[String,Number],
            require:true
        },
        list:{
            type:[Array],
            require:true
        },
        images:{
            type:[Array],
            require:true
        }
    },
    data(){
        return {
            arrow:'/img/me/right.png',  //保存箭头的图片位置
            isShow:true,                //展示与否
            alertShow: 0,              //弹出框弹出与否,值发生变化即弹出
            delShow: 0,               //弹出框弹出与否,值发生变化即弹出
            light:0,                    //高亮显示,默认为0
            id:'',                      //默认为当前用户的第一个歌单的id
            titles:''                   //表示弹出框是修改框(0) 还是 插入框(1)
        }
    },
    methods:{
        //点击更换图标,和下方的展示
        changeicon(){
            if (this.isShow){
                this.isShow = false;
                this.arrow = '/img/me/right.png';
            }else{
                this.isShow = true;
                this.arrow = '/img/me/down.png';
            }
        },
        changeAlertShow(state){
            this.titles = state;
            this.alertShow ++;
        },
        //点击改变查看的歌单
        changelist(index){
            this.light = index;
            this.$emit('changeCount',this.light);
        },
     
        updateS(){
            this.$emit('updateS');
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
        //打开删除框
        delShows(){
            this.delShow++;
            console.log(1);
        }
    },
    mounted(){
        this.getTime();
    }
}
</script>