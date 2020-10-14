<template>
    <div>
        <div :style="{display:isShow ? 'block' : 'none'}">
            <!-- 成功登陆时 -->
            <div id="collection"  v-if="$store.state.isloaded">
                <div class="close" @click="close">
                    <img src="/img/me/err_white.png">
                </div>
                <div class="c_top f_t">添加到歌单</div>
                <div class="content">
                    <ul class="m_list">
                        <li class="list-item" @click="createList">
                            <span class="icon_add"></span>
                            <span class="font_f1">新建歌单</span>
                        </li>
                        <li class="list-item" v-for="(p,index) of $store.state.userList" :key="index" @click="insertSong(song,p)">
                            <div class="icon">
                                <img :src="image[index]">
                            </div>
                            <div class="font">
                                <p class="font_f font_1">{{p.userListName}}</p>
                                <p class="font_f font_2">by {{$store.state.user.nickname}}</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 未登录 -->
            <my-notlog :show="show"></my-notlog>
        </div>
        <!-- 添加歌单弹出 -->
        <my-alert :show="alertShow" :titles="1"></my-alert>
        <!-- 弹出是否收藏成功 -->
        <div class="c_f" :style="{opacity: success ? '1' : '0'}">收藏成功</div>
        <div class="c_f" :style="{opacity: fail ? '1' : '0'}">该歌曲已存在</div>
        <div class="c_f" :style="{opacity: warn ? '1' : '0'}">所有歌曲已存在</div>
    </div>
</template>
<style scoped>
    #collection{
        position: fixed;
        width: 480px;
        height: 420px;
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
    .c_top{
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
    .content{
        width: 100%;
        height: 380px;
        overflow-x: hidden;
        overflow-y: scroll;
    }
    .list-item{
        display: flex;
        cursor: pointer;
        align-items: center;
        box-sizing: border-box;
        list-style: none;
        width: 100%;
        height: 50px;
        padding: 10px 0px 10px 35px;
        border-bottom: 1px solid #999;
    }
    .list-item:first-child{
        background-color: #e6e6e6;
    }
    .list-item:hover{
        background-color: #e6e6e6;
    }
    .icon_add{
        display: block;
        width: 35px;
        height: 35px;
        margin-right: 15px;
        background: url('/img/me/icon.png') no-repeat 0 -495px;
        cursor: pointer;
    }
    .font_f1{
        font-size: 14px;
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
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        cursor: pointer;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    .font_1{
        font-size: 14px;
    }
    .font_2{
        color: #666;
    }
    .c_f{
        position: fixed;
        width: 200px;
        height: 40px;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        text-align: center;
        line-height: 40px;
        background-color: #fff;
        box-shadow: 1px 1px 7px 2px #666;
        border-radius: 8px;
        font-size: 16px;
        color: rgb(80, 7, 122);
        font-weight: 600;
        letter-spacing: 3px;
        transition: all .5s linear;
    }
    


</style>
<script>
import MyAlert from './MyAlert_songlist.vue'
import MyNotlog from './MyNotlog.vue'
export default {
    components:{
        MyAlert,
        MyNotlog
    },
    props:{
        show:{
            type:[Number],
            require:true
        },
        song:{
            type:[Object,Array],
            require:true
        }
    },
    data(){
        return {
            image:['/img/userimg/1.jpg','/img/userimg/2.jpg','/img/userimg/3.jpg','/img/userimg/4.jpg','/img/userimg/5.jpg','/img/userimg/6.jpg','/img/userimg/7.jpg','/img/userimg/8.jpg','/img/userimg/9.jpg'],
            isShow: false,   //弹框出现状态
            alertShow:0,      //新建歌单弹出状态，值变化弹出
            success: false,   //收藏成功后，变化为true
            fail: false,      //收藏失败后，变化为false
            warn: false,      //多首歌曲收藏失败后，变化为false
            codeAll:0         //收藏多首歌曲，若code为0表示所有歌曲均重复
        }
    },
    methods:{
        // 关闭弹框
        close(){
            this.isShow = false;
        },
        //新建歌单时，改变alertShow使其弹出
        createList(){
            this.alertShow++;
        },
        
        //将歌收藏至点击的歌单
        insertSong(song,message){
            if (song instanceof Array) {
                console.log(11111111111);
                let uListId = message.uListId;
                this.codeAll = 0;
                let i = 0;
                song.forEach(el => {
                    let songId = el.songId;
                    this.axios.get('/me/collectSong?songId=' + songId +'&uListId=' + uListId).then(res => {
                        let code = res.data.code;
                        i++;
                        this.codeAll += code;
                        this.isShow = false;
                        if (i == song.length && this.codeAll != 0) {
                            this.success = true;
                            setTimeout(() => {
                                this.success = false;
                            },2000)
                        }
                        if (i == song.length && this.codeAll == 0) {
                            this.warn = true;
                            setTimeout(() => {
                                this.warn = false;
                            },2000)
                        }
                    });
                });
            } else {
                console.log(22222222222);
                let songId = song.songId;
                let uListId = message.uListId;
                this.axios.get('/me/collectSong?songId=' + songId +'&uListId=' + uListId).then(res => {
                    let code = res.data.code;
                    if (code == 0) {
                        this.fail = true;
                        setTimeout(() => {
                            this.fail = false;
                        },2000)
                    } else {
                        this.success = true;
                        this.$emit('updateS');
                        setTimeout(() => {
                            this.success = false;
                        },2000)
                    }
                    this.isShow = false;
                });
            }
        }
    },
    created(){
    },
    watch:{
        show(){
            this.isShow = true;
        }
    }
}
</script>