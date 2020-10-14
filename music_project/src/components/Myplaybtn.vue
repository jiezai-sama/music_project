<template>
    <div id="btn">
        <div class="btn_1">
            <span @click="addAllSongsPlay(music)">播放</span>
            <img src="/img/song/play.png">
        </div>
        <div class="btn_2" @click="addAllSongs(music)">
            <img src="/img/album/plus.png">
        </div>
        <div class="btn_3" :style="{display:notWant == 3 ? 'none' : 'block'}" >
            <img src="/img/album/package.png">
            <span @click="collect">收藏</span>
        </div>
        <my-collection :show="collectCount" :song="music"></my-collection>
    </div>               
</template>
<script>
import MyCollection from './MyCollection.vue'
import music from '../common/music.js'
export default {
    components:{
        MyCollection
    },
    props:{
        music:{
            type:[Array],
            require:true
        },
        notWant:{
            type:[Number],
            require:true
        }
    },
    data(){
        return {
            collectCount:0, //是否弹出收藏框，变化则弹出
        }
    },
    methods:{
        addAllSongsPlay: music.addAllSongsPlay,
        addAllSongs: music.addAllSongs,
        collect(){
            this.collectCount++;
        }
    },
    mounted(){
    }
}
</script>
<style scoped>
    #btn{
        display: flex;
        margin-top: 15px;
    }
    #btn .btn_1{
        position: relative;
        width: 66px;
        height: 31px;
        line-height: 31px;
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        background-image: linear-gradient(to right,#7e6bc4 0%,#7e6bc4 95%,#574b90);
        color: #fff;
        font-size: 14px;
        cursor: pointer;
    }
    #btn .btn_1:hover{
        opacity: .9;
    }
    #btn .btn_1>span{
        margin-left: 10px;
    }
    #btn .btn_1>img{
        position: absolute;
        left: 42px;
        top: 9px;
    }
    #btn .btn_2{
        position: relative;
        width: 31px;
        height: 31px;
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        background-image: linear-gradient(to right,#7e6bc4 0%,#7e6bc4 90%,#574b90);
        cursor: pointer;
    }
    #btn .btn_2:hover{
        opacity: .9;
    }
    #btn .btn_2>img{
        position: absolute;
        left: 9px;
        top: 9px;
        width: 45%;
    }
    #btn .btn_3{
        position: relative;
        width: 60px;
        height: 30px;
        border: 1px solid #aaa;
        border-radius: 5px;
        margin-left: 10px;
        background-color: #eee;
        cursor: pointer;
    }
    #btn .btn_3:hover{
        opacity: .8;
    }
    #btn .btn_3>img{
        position: absolute;
        width: 34%;
        left: 5px;
        top: 5px;
    }
    #btn .btn_3>span{
        font-size: 14px;
        line-height: 30px;
        margin-left: 28px;
        color: #666;
    }
</style>