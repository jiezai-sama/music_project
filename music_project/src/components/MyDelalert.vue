<template>
    <div>
        <div id="del" :style="{display:isShow ? 'block' : 'none'}">
            <div class="close" @click="close">
                <img src="/img/me/err_white.png" alt="">
            </div>
            <div class="s_1 f_t">提示</div>
            <div class="s_2">
                <p class="f_2">确定删除吗？</p>
                <button class="mybtn" @click="del">确定</button>
            </div>
        </div>
    </div>
</template>
<style scoped>
    #del{
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
    .mybtn{
        display: block;
        width: 80px;
        height: 30px;
        text-align: center;
        color: #6639A6;
    }

</style>
<script>
export default {
    props:{
        show:{
            type:[Number],
            require: true
        },
       
        list:{
            type:[Array,Object],
            require:true
        },
        light:{
            type:[Number],
            require:true
        },
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
        //删除我的歌单，及歌单中的歌曲
        del(){
            if (this.list instanceof Array){
                let listId = this.list[this.light].uListId;
                this.axios.get('/me/delList?id=' + listId).then(res => {
                    let code = res.data.code;
                    if (code == 1){
                        this.isShow = false;
                        this.$store.commit('removeUserList',this.light);
                    }
                })
            }else{
                let id = this.list.uSong;
                this.axios.get('/me/delSong?id=' + id).then(res => {
                    let code = res.data.code;
                    if (code == 1){
                        this.isShow =false;
                        this.$emit('updateS');
                    }
                })
            }
        }
    },
    watch:{
        show(){
            this.isShow = true;
        }
    }
}
</script>