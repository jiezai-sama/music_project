<template>
    <div id="banner" @mouseover="stop" @mouseout="start">
        <!-- 左边的按钮 -->
        <div class="btn-left" @click="move(-1)">
            <img src="/img/index/arrow_left.png">
        </div>
        <!-- 右边的按钮 -->
        <div class="btn-right" @click="move(1)">
            <img src="/img/index/arrow_right.png">
        </div>
        <!-- 轮播图片 -->
        <div>
            <ul class="images" :style="{marginLeft:-banner_page * 730 + 'px'}" :class="isActive" >
                <li v-for="(image,index) of carousel" :key="index">
                    <router-link to="/">
                        <img :src="image.img">
                    </router-link>
                </li>
            </ul>
        </div>
        <!-- 圆形的点 -->
        <ul class="circle">
            <li class="circle-item" v-for="(c,i) of (carousel.length && (carousel.length - 1))" :key="i" :class="banner_page == i ? 'active' : ''" @click="moveTo(i)"></li>
        </ul>
    </div>
</template>
<script>
export default {
    props:{
        'carousel':{
            type:[Array],
            require:true
        }
    },
    data(){
        return {
            isActive:'active',
            banner_page:0,
            timer:null,
            canClick:true,
            playState:false,
        }
    },
    methods:{
        //向左移动或者向右移动一个图片
        move(i){
            if (i == 1 && this.canClick == true){
                this.canClick = false;
                if (this.banner_page < this.carousel.length - 1){
                    this.isActive = 'active';
                    this.banner_page++;
                }
                if (this.banner_page == this.carousel.length - 1){
                    setTimeout(() => {
                        this.isActive = '';
                        this.banner_page = 0;
                    },500)
                }
                setTimeout(() => {
                    this.canClick = true;
                },500)
            }
            if (i == -1 && this.canClick == true){
                this.canClick = false;
                if (this.banner_page > 0){
                    this.isActive = 'active';
                    this.banner_page--;
                }else{
                    this.isActive = '';
                    this.banner_page = this.carousel.length - 1;
                    setTimeout(() => {
                        this.isActive = 'active';
                        this.banner_page--;
                    },100)
                }
                setTimeout(() => {
                    this.canClick = true;
                },500)
            }
        },
        //移动到第n张图片
        moveTo(i){
            if (this.canClick == true){
                this.canClick = false;
                this.banner_page = i;
                setTimeout(() => {
                    this.canClick = true;
                },500)
            }
        },
        //鼠标悬停停止轮播
        stop(){
            clearInterval(this.timer);
        },
        //开始轮播
        start(){
            this.timer = setInterval( () => {
                this.move(1);
            },4000);
        },
    },
    mounted(){
        this.start();
    },
    watch:{
        // 监听banner_page的变化，变化后向父组件传出banner_page
        banner_page(){
            this.$emit('say',this.banner_page)
        }
    }
}
</script>
<style scoped>
    #banner{
        width: 730px;
        height: 285px;
        overflow: hidden;
    }
    #banner .btn-left,#carousel .container #banner .btn-right{
        position: absolute;
        width: 37px;
        height: 63px;
        cursor: pointer;
    }
    #banner .btn-left{
        left: -60px;
        top: 111px;
    }
    #banner .btn-right{
        right: -60px;
        top: 111px;
    }
    #banner .btn-left:hover{
        background-color: rgba(0,0,0,.3);
    }
    #banner .btn-right:hover{
        background-color: rgba(0,0,0,.3);
    }

    #banner .images{
        display: flex;
        justify-content: start;
        list-style: none;
    }
    #banner .images.active{
        transition: .5s linear;
    }
    #banner .images li a{
        display: block;
        width: 730px;
        height: 285px;
    }
    #banner .circle{
        display: flex;
        justify-content: space-around;
        align-items: center;
        position: absolute;
        left: 250px;
        bottom: 0px;
        width: 250px;
        height: 30px;
    }
    #banner .circle .circle-item{
        list-style: none;
        width: 9px;
        height: 9px;
        border-radius: 50%;
        background-color: #eee;
    }
    #banner .circle .circle-item.active{
        background-color: #aa96da;
    }
</style>