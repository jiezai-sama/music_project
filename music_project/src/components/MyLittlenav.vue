<template>
    <div id="square" :style="{height:height + 'px'}">
        <div class="container">
            <div class="triangle" :style="{left:left + 'px'}"></div>
            <ul class="nav_3" v-if="light_top == 0">
                <li class="nav-item" v-for="(item,index) of littleNavList" :key="index" :class="lightHeight == index ? active : '' ">
                    <router-link to="/">{{item}}</router-link>
                </li>
            </ul>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        'light':{
            type:[String,Number],
            require:true
        },
        'light_top':{
            type:[String,Number],
            require:true
        }
    },
    data(){
        return {
            littleNavList:['推荐'],
            lightHeight:0,
            lightHeight_top:0,
            active:'active',
            left:250,
            height:35
        }
    },
    methods:{
        //改变高亮显示和小三角形位置及小navbar的高度
        lights(){
            this.lightHeight = this.light;
            this.left = 250 + 95 * this.light_top;
            this.light_top == 0 ? this.height = 35 : this.height = 10;
        }
    },
    mounted(){
        this.lights();
    }
}
</script>
<style scoped>
    #square{
        width: 100%;
        background-color: #6639a6;
    }
    #square .container{
        position: relative;
        width: 1100px;
        height: 35px;
        margin: 0 auto;
    }
    #square .container .nav_3{
        display: flex;
        justify-content: start;
        align-items: center;
        width: 680px;
        height: 35px;
        margin: 0 auto;
    }
    #square .nav_3 .nav-item{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 95px;
        height: 35px;
    }
    #square .nav_3 .nav-item a{
        text-decoration: none;
        color: #fff;
        font-size: 14px;
    }
    #square .nav_3 .nav-item.active a{
        display: block;
        padding: 4px 0px;
        text-align: center;
        width: 60px;
        height: 16px;
        border-radius: 16px;
        background-color: rgba(00,00,00,.3);
    }
    #square .nav_3 .nav-item a:hover{
        display: block;
        padding: 4px 0px;
        text-align: center;
        width: 60px;
        height: 16px;
        border-radius: 16px;
        background-color: rgba(00,00,00,.3);
    }
    .triangle{
        position: absolute;
        border-bottom: 8px solid #6639a6;
        border-top: none;
        border-left: 8px solid transparent;
        border-right: 8px solid transparent;
        top: -8px;
    }
</style>