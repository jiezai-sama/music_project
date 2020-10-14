<template>
    <div id="search">
        <input type="text" placeholder="音乐/歌手/专辑" @input='search' v-model="value">
        <img class="image_1" src="/img/index/search.png">
        <div class="show_list">
            <router-link :to="`/song/${result[0][0] && result[0][0].songId}`" class="show-item" v-show="result[0][0] != undefined">
                <span class="font_1">{{result[0][0] && result[0][0].songName}}</span>
                <span class="font_2">歌曲搜索</span>
            </router-link>
            <router-link :to="`/singer/${result[1][0] && result[1][0].singerId}`" class="show-item" v-if="result[1][0] != undefined">
                <span class="font_1">{{result[1][0] && result[1][0].singerName}}</span>
                <span class="font_2">歌手搜索</span>
            </router-link>
            <router-link :to="`/album/${result[2][0] && result[2][0].CDId}`" class="show-item" v-if="result[2][0] != undefined">
                <span class="font_1">{{result[2][0] && result[2][0].CDName}}</span>
                <span class="font_2">专辑搜索</span>
            </router-link>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            value:'',            //双向绑定输入的值
            canSearch: true,     //是否能够查找，防抖节流
            result:[[],[],[]]            //获取到的数据
        }
    },
    methods:{
        // 输入时，去数据库查询
        search(){
            if (this.canSearch == true && this.value != ''){
                this.canSearch = false;
                this.axios.get('/mysearch?value=' + this.value ).then(res => {
                    this.result = res.data.result;
                    this.canSearch = true;
                })
            }
            if (this.value == ''){
                this.result = [[],[],[]];
            }
        }
    }
}
</script>
<style scoped>
    #search{
        position: relative;
    }
    #search>input{
        width: 155px;
        padding: 8px 15px;
        padding-left: 35px;
        border-radius: 15px;
        border: none;
        outline: none;
    }
    .image_1{
        position: absolute;
        left: 7px;
        top: 25px;
        cursor: pointer;
    }
    .show_list{
        position: absolute;
        left: 0px;
        top: 70px;
        width: 260px;
        border-radius: 5px;
        background-color: #eee;
        z-index: 999;
    }
    .show-item{
        display: flex;
        justify-content: space-between;
        width: 260px;
        height: 40px;
        line-height: 40px;
        text-decoration: none;
        padding: 0px 10px;
        box-sizing: border-box;
    }
    .font_1{
        font-size: 16px;
        color: #333;
    }
    .font_2{
        font-size: 14px;
        color: #6639A6;
        font-weight: 600;
    }
</style>
