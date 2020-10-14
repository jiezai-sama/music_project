<template>
    <div id="table">
        <table class="music_list">
            <thead>
                <tr>
                    <th v-for="(t,index) of title" :key="index">{{title[index]}}</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(s,index) of music" :key="index">
                    <td>
                        <div>
                            <span>{{index+1}}</span>
                            <span class="icon_p" @click="addSongPlay(s)"></span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <router-link :to="`/song/${s.songId}`">{{s.songName}}</router-link>
                            <div>
                                <span title="添加" class="icon_add" @click="addSong(s)"></span>
                                <span title="收藏" class="icon_s" @click="collect(s)"></span>
                                <span title="删除" class="icon_d" :style="{display:del ? 'block' : 'none'}" @click="alertDel(s)"></span>
                            </div>
                        </div>
                    </td>
                    <td>{{s.time}}</td>
                    <td v-if="notWant != 4">
                        <router-link :to="`/singer/${s.singerId}`">{{s.singerName}}</router-link>
                    </td>
                    <td v-if="notWant != 5">
                        <router-link :to="`/album/${s.CDId}`">{{s.CDName}}</router-link>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- 删除框 -->
        <my-del :show="delCount" :list="clickSong" v-on:updateS="updateS"></my-del>
        <!-- 收藏框 -->
        <my-collection :show="collectCount" :song="clickSong" v-on:updateS="updateS"></my-collection>

    </div>
</template>
<script>
import music from '../common/music.js'
import MyDel from './MyDelalert.vue'
import MyCollection from './MyCollection.vue'
export default {
    props:{
        title:{
            type:[Array],
            require:true
        },
        music:{
            type:[Array],
            require:true
        },
        notWant:{
            type:[Number],
            require:true
        },
        del:{
            type:[Boolean],
            require:true
        }
    },
    components:{
        MyDel,
        MyCollection
    },
    data(){
        return {
            delCount:0,     //是否弹出删除框，变化则弹出
            collectCount:0, //是否弹出收藏框，变化则弹出
            clickSong:{}    //当前点击的歌
        }
    },
    methods:{
        addSongPlay: music.addSongPlay,
        addSong: music.addSong,
        alertDel(s){
            this.delCount++;
            this.clickSong = s;
        },
        collect(s){
            this.collectCount++;
            this.clickSong = s;
        },
        updateS(){
            this.$emit('updateS');
        }
    }
}
</script>
<style scoped>
    .music_list{
        width: 640px;
        border: 1px solid #c3bef0;
        border-top: 3px solid #6639a6;
        box-sizing: border-box;
        font-size: 13px;
    }
    .music_list tbody tr:nth-of-type(2n){
        background-color: #d6e6f2;
    }
    .music_list tbody tr:nth-of-type(2n+1){
        background-color: #f7fbfc;
    }
    .music_list a{
        color: #000;
        font-size: 13px;
        text-decoration: none;
    }
    .music_list a:hover{
        text-decoration: underline;
    }
    .music_list th{
        height: 34px;
        box-sizing: border-box;
        padding: 8px 10px 8px 10px;
        background-color: #cadefc;
        text-align: left;
        font-size: 15px;
        border: 1px solid #c3bef0;
        font-weight: 600;
    }
    .music_list th:first-child{
        width: 75px;
    }
    .music_list td{
        height: 30px;
        box-sizing: border-box;
        padding: 6px 10px 6px 10px;
        line-height: 18px;
    }
    .music_list td:first-child>div{
        display: flex;
        width: 100%;
        justify-content: space-around;
    }
    .icon_p{
        display: block;
        cursor: pointer;
        width: 17px;
        height: 17px;
        background: url('/img/singer/table.png') no-repeat 0 -103px;
    }
    .icon_p:hover{
        background: url('/img/singer/table.png') no-repeat 0 -128px;
    }
    .music_list td:nth-child(2)>div{
        display: flex;
        justify-content: space-between;
    }
    .music_list td:nth-child(2)>div>div{
        display: flex;
        justify-content: space-between;
    }
    .icon_add{
        display: block;
        width: 17px;
        height: 17px;
        margin-right: 15px;
        cursor: pointer;
        background: url('/img/singer/icon.png') no-repeat 0px -698px;
    }
    .icon_add:hover{
        background: url('/img/singer/icon.png') no-repeat -22px -698px;
    }
    .icon_s{
        display: block;
        width: 17px;
        height: 17px;
        margin-right: 15px;
        cursor: pointer;
        background: url('/img/singer/table.png') no-repeat 0px -173px;
    }
    .icon_s:hover{
        background: url('/img/singer/table.png') no-repeat -20px -173px;
    }
    .icon_d{
        display: block;
        width: 17px;
        height: 17px;
        margin-right: 15px;
        cursor: pointer;
        background: url('/img/singer/table.png') no-repeat 0px -216px;
    }
    .icon_d:hover{
        background: url('/img/singer/table.png') no-repeat -20px -216px;
    }
    
</style>