<template>
    <div id="audio">
        <!-- 音乐播放标签 -->
       <audio ref="music" src=""></audio>
        <!-- 制作音乐进度条 -->
        <div id="bar">
            <div class="bar_content">
                <span class="prev" @click="prevSong"></span>
                <span class="current" :class="isPlay ? 'pause' : ''" @click="changePlayState"></span>
                <span class="next" @click="nextSong"></span>
                <div class="mask">
                    <img :src="(songContent && songContent.image) || '/img/playbar/default.jpg'">
                </div>
                <!-- 进度条制作 -->
                <div class="progress_bar">
                    <p class="title">{{songContent && songContent.songName}}</p>
                    <div class="square" @click="moveTo">
                        <div class="color" :style="{width:length + 'px'}"></div>
                        <div class="circle" :style="{left:length + 'px'}">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <p class="time">{{currentTime}} / {{durationTime}}</p>
                </div>
                <!-- 音量调节控制 -->
                <div class="control">
                    <span class="horn" @click="changeSoundShow"></span>
                    <div class="square" :style="{display:soundShow ? 'block' :'none'}">
                        <div class="small_square" >
                            <div class="color" :style="{height:soundLength + (-3) + 'px'}"></div>
                            <div class="circle" :style="{bottom:soundLength +  (-3) + 'px'}">
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <!-- 遮罩绑定事件，上面的small_square获取offsetY有问题 -->
                        <div class="super-mask" @click="changeSound"></div>
                    </div>
                </div>
                <!-- 播放顺序控制 -->
                <div class="playorder" @click="changeLoopStyle">
                    <span class="order" :class="loopStyle" :title="titles"></span>
                </div>
                <!-- 播放列表 -->
                <div class="playlist">
                    <span class="list_icon" @click="changeListShow">{{songList.length}}</span>
                    <div class="list_content" :style="{display:listShow ? 'block' : 'none'}">
                        <div class="title">
                            <p class="f_l">播放列表</p>
                            <span class="del_icon" @click="deleteAllSongs">全部清除</span>
                        </div>
                        <div class="list">
                            <table cellpadding="10">
                                <tbody>
                                    <tr v-for="(s,index) of songList" :key="index" @click="changeSongContent(index)" :class="songList.indexOf(songContent) == index ? 'block' : ''">
                                        <td >{{s.songName}}</td>
                                        <td>
                                            <div class="icons">
                                                <span class="icon_s" title="收藏" @click.stop="addCollect(s)"></span>
                                                <span class="icon_d" title="删除" @click.stop="deleteSong(index)"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- 歌词显示 -->
                <div class="lyric">
                    <span class="lyric_btn" @click="changeLyricShow">词</span>
                    <div class="lyric_content" :style="{display:lyricShow ? 'block' : 'none'}">
                        <div class="lyric_move" :style="{marginTop:-lyricMove + 'px'}">
                            <p v-for="(lyr,index) of lyric" :key="index">{{lyr[1]}}</p>
                        </div>
                    </div>
                </div>

                <!-- 收藏弹框 -->
                <my-collection :show="collectCount" :song="clickSong"></my-collection>
            </div>
        </div> 
    </div>
</template>
<script>
import MyCollection from './MyCollection.vue'
export default {
    components:{
        MyCollection
    },
    data(){
        return {
            isPlay:false,               //播放状态
            img_url:'play_1.png',       //播放按钮
            currentTime:'00:00',        //正在播放歌曲的进度时间
            durationTime:'00:00',       //当前歌曲的时长
            length:0,                   //进度条长度
            lyric:[],                   //当前歌曲歌词
            loopStyle:'list',           //循环方式：single:单曲循环 list:列表循环 随机:random
            titles:'列表循环',          //循环方式，中文提示，根据上面的变化
            soundLength:46,             //音量条长度        
            soundShow:false,            //音量条出现与否
            listShow:false,             //歌单列表出现与否
            lyricShow:false,            //歌词出现与否 
            lyricMove:0,                //歌词移动距离
            collectCount:0,             //点击改变其大小，控制收藏弹框的弹出
            clickSong:{}                //正在点击的歌曲
        }
    },
    methods:{
        //改变歌曲的播放暂停状态
        changePlayState(){
            if (this.isPlay == true){
                this.$refs.music.pause();
                this.isPlay = false;
            }else{
                this.$refs.music.play();    
                this.isPlay = true;
            }
        },
        //改变音量条的出现消失
        changeSoundShow(){
            if (this.soundShow){
                this.soundShow = false;
            }else{
                this.soundShow = true;
            }
        },
        //点击改变音量大小及颜色条
        changeSound(e){
            this.soundLength = 93 - e.offsetY;
            this.$refs.music.volume = this.soundLength / 93;
            console.log(this.$refs.music.volume);
        },
        //改变播放顺序
        changeLoopStyle(){
            switch (this.loopStyle) {
                case 'list':
                    this.loopStyle = 'single';
                    break;
                case 'single':
                    this.loopStyle = 'random';
                    break;
                case 'random':
                    this.loopStyle = 'list';
                    break;
            }
        },
        //改变歌曲列表出现与否
        changeListShow(){
            if (this.listShow){
                this.listShow = false;
            }else{
                this.listShow = true;
            }
        },
        //改编歌词出现与否
        changeLyricShow(){
            this.lyricShow ? this.lyricShow = false : this.lyricShow = true;
        },
        // 获取当前歌曲时间的函数，化为aa:bb的形式
        transTime(nowTime){
            let minute = Math.floor(nowTime / 60);
            minute = minute.toString().length == 1 ? ('0' + minute) : minute;
            let second = Math.floor(nowTime % 60);
            second = second.toString().length == 1 ? ('0' + second) : second;
            return `${minute}:${second}`
        },
        // 初始化播放状态
        playSong(obj){
            if(JSON.stringify(obj) != '{}'){
                this.isPlay = true;
                this.length = 0;
                this.durationTime = obj.time;
                this.currentTime = '00:00';
                this.$refs.music.src = obj.songURL;
                this.$refs.music.play();
            }else{
                this.isPlay = false;
                this.length = 0;
                this.currentTime = '00:00';
                this.durationTime = '00:00';
                this.$refs.music.src = '';
            }
        },
        //添加监听事件
        listener(){
            let audio = this.$refs.music;
            //播放过程中，更新进度条和当前时间,歌词
            audio.addEventListener('timeupdate',() => {
                this.currentTime = this.transTime(audio.currentTime);
                this.length = audio.currentTime / audio.duration*500;
                this.lyric.forEach((ele,index) => {
                    if (this.currentTime == ele[0].slice(0,5)){
                        this.lyricMove = index * 60;
                    }
                });
            })
            // 播放结束后，根据播放状态执行循环、单曲、随机播放
            audio.addEventListener('ended',() => {
                switch (this.loopStyle) {
                    case 'list':
                        this.listLoop();
                        break;
                    case 'single':
                        this.single();
                        break;
                    case 'random':
                        this.random();
                        break;
                }
            })
        },
        //循环播放
        listLoop(){
            let index = this.songList.indexOf(this.songContent);
            let length = this.songList.length;
            index == length - 1 ? index = 0 : index++;
            this.$store.commit('setContent',this.songList[index]);
        },
        //单曲循环
        single(){
            this.playSong(this.songContent);
        },
        //随机播放
        random(){
            let index = this.songList.indexOf(this.songContent);
            let length = this.songList.length;
            let randomNumber = Math.floor(Math.random() * length);
            while(index == randomNumber){
                randomNumber = Math.floor(Math.random() * length);
            }
            this.$store.commit('setContent',this.songList[randomNumber]);
        },
        //点击改变音乐播放进度及滚动条进度
        moveTo(e){
            let audio = this.$refs.music;
            let width = e.offsetX;
            this.length = e.offsetX;
            audio.currentTime = width / 500 * audio.duration;
        },
        //点击播放列表的歌曲，改变播放的歌曲
        changeSongContent(index){
            this.$store.commit('setContent',this.$store.state.playList[index]);
        },
        //删除列表中的歌曲
        deleteSong(index){
            if (this.songList.indexOf(this.songContent) == index){
                this.nextSong();
            }
            this.$store.commit('removeSong',this.$store.state.playList[index]);
        },
        // 清除列表所有歌曲
        deleteAllSongs(){
            this.$store.commit('removeAllSongs');
        },
        //下一首歌
        nextSong(){
            let index = this.songList.indexOf(this.songContent);
            index ==  this.songList.length - 1 ? index = 0 : index++; 
            this.$store.commit('setContent',this.$store.state.playList[index]);
        },
        //上一首歌
        prevSong(){
            let index = this.songList.indexOf(this.songContent);
            index ==  0 ? index =  this.songList.length - 1 : index--; 
            this.$store.commit('setContent',this.$store.state.playList[index]);
        },
        //请求当前歌曲的歌词
        getLyric(){
            this.lyric = [];
            if (JSON.stringify(this.songContent) != '{}'){
                this.axios.get('http://localhost:8080/img/lrc/' + this.songContent.cyricURL).then(res => {
                    var arrLrc = res.data.split('[');
                    arrLrc.forEach(el => {
                        let a = el.split(']')
                        this.lyric.push(a);
                    })
                })
            }
        },
        //添加到我的歌单
        addCollect(s){
            this.collectCount++;
            this.clickSong = s;
        }
    },
    computed:{
        //获取当前歌曲的播放信息
        songContent(){
            return this.$store.state.playContent;
        },
        //获取当前的播放列表信息
        songList(){
            return this.$store.state.playList;
        }
    },
    mounted(){
        this.listener();
    },
    watch:{
        //监听当前播放音乐，若发生改变，则重新播放并获取歌词
        songContent(){
            this.playSong(this.songContent);
            this.getLyric();
        },
        //监听循环方式变化，改变中文提示
        loopStyle(){
            switch (this.loopStyle) {
                case 'list':
                    this.titles = '列表循环';
                    break;
                case 'single':
                    this.titles = '单曲循环';
                    break;
                case 'random':
                    this.titles = '随机播放';
                    break;
            }
        }
    }
}
</script>
<style scoped>
/* 进度条制作 */
    #bar{
        position: fixed;
        bottom: 0px;
        height: 50px;
        width: 100%;
        background-color: rgba(0,0,0,.8);
    }
    #bar .bar_content{
        display: flex;
        align-items: center;
        position: relative;
        width: 982px;
        height: 50px;
        margin: 0 auto;
    }
    #bar .bar_content .prev{
        display: block;
        cursor: pointer;
        width: 28px;
        height: 28px;
        background: url('/img/playbar/playbar.png') no-repeat 0px -130px;
    }
    #bar .bar_content .prev:hover{
        background: url('/img/playbar/playbar.png') no-repeat -30px -130px;
    }
    #bar .bar_content .current{
        display: block;
        cursor: pointer;
        width: 36px;
        height: 36px;
        margin: 0 10px;
        background: url('/img/playbar/playbar.png') no-repeat 0px -204px;
    }
    #bar .bar_content .current:hover{
        background: url('/img/playbar/playbar.png') no-repeat -40px -204px;
    }
    #bar .bar_content .current.pause{
        background: url('/img/playbar/playbar.png') no-repeat 0px -165px;
    }
    #bar .bar_content .current.pause:hover{
        background: url('/img/playbar/playbar.png') no-repeat -40px -165px;
    }
    #bar .bar_content .next{
        display: block;
        cursor: pointer;
        width: 28px;
        height: 28px;
        background: url('/img/playbar/playbar.png') no-repeat -80px -130px;
    }
    #bar .bar_content .next:hover{
        background: url('/img/playbar/playbar.png') no-repeat -110px -130px;
    }

    


    #bar .bar_content .mask{
        width: 35px;
        height: 35px;
        margin-left: 30px;
        border-radius: 5px;
        overflow: hidden;
    }
    #bar .bar_content .mask img{
        width: 100%;
    }
    #bar .bar_content .progress_bar{
        display: flex;
        width: 620px;
        flex-direction: column;
        margin-left: 20px;
    }
    #bar .bar_content .progress_bar .title{
        color: #eee;
        font-size: 10px;
    }
    #bar .bar_content .progress_bar .square{
        position: relative;
        width: 500px;
        height: 6px;
        background-color: #3e4149;
        border-radius: 5px;
        margin-top: 10px;
        box-shadow: 1px 1px 4px -1px #fff;
        cursor: pointer;
    }
    #bar .bar_content .progress_bar .square .circle{
        position: absolute;
        top: 0px;
    }
    #bar .bar_content .progress_bar .square .circle span:first-child{
        display: block;
        position: absolute;
        width: 14px;
        height: 14px;
        left: -4px;
        top: -3px;
        border-radius: 50%;
        background-color: #fff;
    }
    #bar .bar_content .progress_bar .square .circle span:last-child{
        display: block;
        position: absolute;
        width: 10px;
        height: 10px;   
        left: -2px;
        top: -1px;
        background-color: #6639a6;
        border-radius: 50%;
    }
    #bar .bar_content .progress_bar .square .color{
        position: absolute;
        height: 6px;
        max-width: 600px;
        background-color: #cca8e9;
        border-radius: 5px;
    }
    #bar .bar_content .progress_bar .time{
        position: absolute;
        left: 720px;
        top: 30px;
        font-size: 10px;
        color: #ccc;
    }
    /* 音量调节控制 */
    #bar .bar_content .control{
        position: relative;
    } 
    #bar .bar_content .control .horn{
        display: block;
        position: relative;
        width: 25px;
        height: 25px;
        background: url('/img/playbar/playbar.png') no-repeat -2px -248px;
        z-index: 999;
        cursor: pointer;
    }
    #bar .bar_content .control .horn:hover{
        background: url('/img/playbar/playbar.png') no-repeat -31px -248px;
    }
    #bar .bar_content .control .square{
        position: absolute;
        width: 32px;
        height: 110px;
        left: -2px;
        top: -120px;
        background-color: #000;
    }
    #bar .bar_content .control .square .small_square{
        position: absolute;
        margin: 0px 10px;
        left: 4px;
        top: 10px;
        width: 4px;
        height: 93px;
        background-color: #666;
    }
    #bar .bar_content .control .square .small_square .color{
        position: absolute;
        left: 0px;
        bottom: 0px;
        width: 4px;
        height: 40px;
        background-color: #6639a6;
    }
    #bar .bar_content .control .square .small_square .circle{
        position: relative;
        left: 0px;
        bottom: 0px;
    }
    #bar .bar_content .control .square .small_square .circle span:first-child{
        display: block;
        position: absolute;
        width: 14px;
        height: 14px;
        left: -5px;
        top: 82px;
        border-radius: 50%;
        background-color: #fff;
    }
    #bar .bar_content .control .square .small_square .circle span:last-child{
        display: block;
        position: absolute;
        width: 10px;
        height: 10px;   
        left: -3px;
        top: 84px;
        background-color: #6639a6;
        border-radius: 50%;
    }
    #bar .bar_content .control .square .super-mask{
        position: absolute;
        left: 9px;
        top: 10px;
        width: 14px;
        height: 93px;
        background-color: transparent;
        cursor: pointer;
    }
    /* 播放顺序 */
    #bar .bar_content .playorder .order{
        display: block;
        width: 25px;
        height: 25px;
        cursor: pointer;
        margin: 0px 8px;
    }
    #bar .bar_content .playorder .order.list{
        background: url('/img/playbar/playbar.png') no-repeat -3px -344px;
    }
    #bar .bar_content .playorder .order.list:hover{
        background: url('/img/playbar/playbar.png') no-repeat -33px -344px;
    }
    #bar .bar_content .playorder .order.single{
        background: url('/img/playbar/playbar.png') no-repeat -66px -344px;
    }
    #bar .bar_content .playorder .order.single:hover{
        background: url('/img/playbar/playbar.png') no-repeat -93px -344px;
    }
    #bar .bar_content .playorder .order.random{
        background: url('/img/playbar/playbar.png') no-repeat -66px -248px;
    }
    #bar .bar_content .playorder .order.random:hover{
        background: url('/img/playbar/playbar.png') no-repeat -93px -248px;
    }
    /* 播放列表 */
    #bar .bar_content .playlist{
        position: relative;
    }
    #bar .bar_content .playlist .list_icon{
        display: block;
        cursor: pointer;
        width: 38px;
        height: 25px;
        font-size: 12px;
        line-height: 25px;
        padding-left: 21px;
        text-align: center;
        text-shadow: 0 1px 0 #080707;
        color: #999;
        background: url('/img/playbar/playbar.png') no-repeat -42px -68px;
    }
    #bar .bar_content .playlist .list_icon:hover{
        background: url('/img/playbar/playbar.png') no-repeat -42px -98px;
    }
    #bar .bar_content .playlist .list_content{
        position: absolute;
        box-sizing: border-box;
        width: 250px;
        height: 260px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        left: -192px;
        top: -273px;
        overflow: auto;
        background-color: rgba(0,0,0,.9);
        color: #aaa;
        z-index: 99;
    }
    #bar .bar_content .playlist .list_content .title{
        display: flex;
        box-sizing: border-box;
        justify-content: space-between;
        align-items: center;
        background-color: rgba(0,0,0,.95);
        width: 100%;
        height: 35px;
        padding: 0px 10px;
        border-bottom: 1px solid #333;
    }
    #bar .bar_content .playlist .list_content .title .f_l{
        height: 35px;
        line-height: 35px;
        color: #eee;
        font-size: 14px;
    }
    #bar .bar_content .playlist .list_content .title .del{
        display: flex;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
    }
    #bar .bar_content .playlist .list_content .title .del_icon{
        display: block;
        cursor: pointer;
        white-space: nowrap;
        width: 13px;
        height: 13px;
        line-height:13px;
        font-size: 12px;
        color: #aaa;
        margin-right: 40px;
        padding-left: 17px;
        background: url('/img/playbar/delete.png') no-repeat -51px 0px ;
    }
    #bar .bar_content .playlist .list_content .title .del_icon:hover{
        color: #eee;
        background: url('/img/playbar/delete.png') no-repeat -51px -20px ;
    }
    #bar .bar_content .playlist .list_content .list{
        width: 100%;
        height: 225px;
        font-size: 13px;
        box-sizing: border-box;
        color: #ccc;
        overflow-x: hidden;
        overflow-y: scroll;
    }
    #bar .bar_content .playlist .list_content .list::-webkit-scrollbar{
        display: none;
    }
    #bar .bar_content .playlist .list_content .list table{
        width: 250px;
    }
    #bar .bar_content .playlist .list_content .list tr:hover{
        cursor: pointer;
        background-color: rgba(0,0,0,.95);
    }
    #bar .bar_content .playlist .list_content .list tr.block{
        background-color: rgba(0,0,0,.95);
    }
    #bar .bar_content .playlist .list_content .list tr td:first-child{
        width: 170px;
        height: 32px;
        line-height: 32px;
        padding-left: 10px;
    }
    #bar .bar_content .playlist .list_content .list tr td .icons{
        display: flex;
        justify-content: space-around;
    }
    #bar .bar_content .playlist .list_content .list tr td .icon_s{
        display: block;
        cursor: pointer;
        width: 16px;
        height: 13px;
        background: url('/img/playbar/delete.png') no-repeat -25px 0px ;
    }
    #bar .bar_content .playlist .list_content .list tr td .icon_s:hover{
        background: url('/img/playbar/delete.png') no-repeat -25px -20px ;
    }
    #bar .bar_content .playlist .list_content .list tr td .icon_d{
        display: block;
        cursor: pointer;
        width: 13px;
        height: 13px;
        background: url('/img/playbar/delete.png') no-repeat -51px 0px ;
        padding-right: 10px;
    }
    #bar .bar_content .playlist .list_content .list tr td .icon_d:hover{
        background: url('/img/playbar/delete.png') no-repeat -51px -20px ;
    }

    /* 歌词显示 */
    #bar .bar_content .lyric{
        position: relative;
    }
    #bar .bar_content .lyric .lyric_btn{
        display: block;
        width: 25px;
        height: 25px;
        line-height: 25px;
        text-align: center;
        margin-left: 15px;
        border: 1px solid #666;
        border-radius: 5px;
        color: #999;
        font-size: 12px;
        font-weight: 600;
        cursor: pointer;
    }
    #bar .bar_content .lyric .lyric_btn:hover{
        color: #eee;
        border: 1px solid #eee;
    }
    #bar .bar_content .lyric .lyric_content{
        position: fixed;
        left: 0px;
        bottom: 50px;
        width: 100vw;
        height: 60px;
        overflow: hidden;
        background-color: rgba(102,57,166,.1);
    }
    #bar .bar_content .lyric .lyric_content .lyric_move{
        width: 100vw;
        font-size: 30px;
        font-weight: 600;
        color: #6639a6;
        text-align: center;
    }
    #bar .bar_content .lyric .lyric_content .lyric_move p{
        height: 60px;
        line-height: 60px;
        letter-spacing: 15px;
    }
    
</style>