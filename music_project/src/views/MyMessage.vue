<template>
    <div id="myset">
        <!-- 导航栏 -->
        <my-nav :light="1"></my-nav>
        <!-- 小导航栏 -->
        <my-littlenav :light="undefined" :light_top="1"></my-littlenav>
        <!-- 内容区域 -->
        <div id="content">
            <div class="square f_t">个人设置</div>
            <!-- 头像上传 -->
            <el-upload
                class="avatar-uploader"
                action="http://127.0.0.1:3000/api/avatar"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload"
                name="head"
                >
                <img :src="'http://127.0.0.1:3000/api/download/' + picture" class="avatar">
            </el-upload>
            <div class="set">
                <div class="left">
                    <div class="item f_c">
                        <span>昵称：</span>
                        <input class="into" type="text" v-model="nickname">
                    </div>
                    <div class="item f_c">
                        <span>电话：</span>
                        <input class="into" type="text" v-model="phone">
                    </div>
                    <div class="item f_c">
                        <span>性别：</span>
                        <label><input type="radio" name="sex" value="1" v-model="sex">男</label>
                        <label><input type="radio" name="sex" value="0" v-model="sex">女</label>
                        <label><input type="radio" name="sex" value="2" v-model="sex">保密</label>
                    </div>
                    <div class="item  f_c">
                        <button class="btn .f_w" @click="handle">保存</button>    
                    </div>  
                </div>
            </div>
            <!-- 提示 -->
            <div class="c_f" :style="{opacity: success ? '1' : '0'}">保存成功</div>
        </div>

    </div>
</template>
<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
<style scoped>
    #ceshi{
        width: 100px;
        height: 100px;
    }
    #ceshi>img{
        width: 100%;
    }
    #content{
        width: 980px;
        height: 580px;
        box-sizing: border-box;
        padding: 40px;
        background-color: #f9f7f7;
        border: 1px solid #c9d6df;
        border-bottom: none;
        border-top: none;
        margin: 0 auto;
        min-height: calc(100vh - 200px);
    }
    .square{
        width: 100%;
        height: 40px;
        border-bottom: 2px solid #878ecd;
        line-height: 40px;
    }
    .f_t{
        font-size: 24px;
        font-weight: 400;
        color: #6639a6;
        letter-spacing: 2px;
        margin-bottom: 20px;
    }
    .set{
        display: flex;
    }
    .left{
        width: 100%;
        height: 390px;
        margin-right: 30px;
    }
    .item{
        width: 100%;
        height: 40px;
        line-height: 40px;
        margin-bottom: 10px;
    }
    .f_c{
        font-size: 16px;
        color: #6639a6;
    }
    .into{
        width: 250px;
        height: 20px;
        border: 1px solid #c9d6df;
        border-radius: 5px 10px;
        outline: none;
        padding: 5px;
    }
    .btn{
        width: 80px;
        height: 30px;
        cursor: pointer;
        line-height: 30px;
        outline: none;
        border: 1px solid #6639a6;
        border-radius: 5px;
        text-align: center;
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
import MyNav from '../components/MyNav.vue'
import MyLittlenav from '../components/MyLittlenav.vue'
import storage from '../common/storage.js'
export default {
    components:{
        MyNav,
        MyLittlenav,
    },
    data(){
        return {
            sex: '',    
            imageUrl: '',
            nickname: '',
            phone:'',
            picture:'',
            success: false
        }
    },
    methods:{
        getSessionstorge:storage.getSessionstorge,
        getuserMessage:storage.getuserMessage,
        handleAvatarSuccess(res, file) {
            this.imageUrl = URL.createObjectURL(file.raw);
            this.picture = file.name;
        },
        beforeAvatarUpload(file) {
            const isJPG = file.type === 'image/jpeg';
            const isLt2M = file.size / 1024 / 1024 < 2;
            if (!isJPG) {
                this.$message.error('上传头像图片只能是 JPG 格式!');
            }
            if (!isLt2M) {
                this.$message.error('上传头像图片大小不能超过 2MB!');
            }
            return isJPG && isLt2M;
        },
        //发送请求重新更新user的数据
        updateUserMessage(){
            let id = this.$store.state.user.id;
            this.axios.get('/me/user?id=' + id + "&sex=" + this.sex + "&nickname=" + this.nickname +  "&phone=" + this.phone + "&picture=" + this.picture).then(res => {
                let message = res.data.result[0];
                this.$store.commit('adduserMessage',message);
                this.success = true;
                setTimeout(() => {
                    this.success = false;
                },2000)
            })
        },
        handle(){
            this.updateUserMessage();
        },
        //页面加载时，初始化
        load(){
            this.picture = this.$store.state.user.imgURL;
            this.nickname = this.$store.state.user.nickname;
            this.phone = this.$store.state.user.phone;
            this.sex = this.$store.state.user.userSex;
        }
    },
    mounted(){
        this.getSessionstorge();
        this.getuserMessage();
        this.load();
    },
    watch:{
        
    }
}
</script>