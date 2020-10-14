<template>
    <div id="footer">
        <div id="content">
            <div class="left">
                <p class="link">
                    <span>服务条款</span>
                    <span>|</span>
                    <span>隐私政策</span>
                    <span>|</span>
                    <span>儿童隐私政策</span>
                    <span>|</span>
                    <span>版权投诉指引</span>
                    <span>|</span>
                    <span>意见反馈</span>
                    <span>|</span>
                </p>
                <p class="detail">麦吉公司版权所有©1997-2020杭州乐读科技有限公司运营：浙网文[2018]3506-263号</p>
                <p class="detail">违法和不良信息举报电话：0571-89853516 </p>
                <p class="detail">举报邮箱：ncm5990@163.com</p>
                <p class="detail">粤B2-20090191-18工业和信息化部备案管理系统网站  浙公网安备 33010902002564号</p>
            </div>
            <div class="right">
                <ul class="icons">
                    <li class="icon">
                        <span class="icon-item icon_1"></span>
                        <p>Amped Studio</p>
                    </li>
                    <li class="icon">
                        <span class="icon-item icon_2"></span>
                        <p>用户认证</p>
                    </li>
                    <li class="icon">
                        <span class="icon-item icon_3"></span>
                        <p>独立音乐人</p>
                    </li>
                    <li class="icon">
                        <span class="icon-item icon_4"></span>
                        <p>赞赏</p>
                    </li>
                    <li class="icon">
                        <span class="icon-item icon_5"></span>
                        <p>视频奖励</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
    #footer{
        width: 100%;
        height: 160px;
        border-top: 1px solid #c9d6df;
    }
    #footer #content{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 984px;
        height: 160px;
        margin: 0 auto;
    }
    #footer #content .left{
        box-sizing: border-box;
        width: 520px;
        height: 160px;
        padding-top: 20px;
    }
    #footer #content .left .link span{
        margin-right: 10px;
        color: #999999;
        font-size: 12px;
    }
    .detail{
        font-size: 12px;
        color: #666666;
        margin: 10px 0;

    }
    #footer #content .right{
        width: 464px;
        height: 100px;
    }
    .right .icons{
        display: flex;
        justify-content: space-between;
    }
    .right .icons .icon{
        list-style: none;
        width: 70px;
        text-align: center;
    }
    .icon-item{
        display: block;
        width: 50px;
        height: 45px;
        margin: 0 auto;
        background: url('/img/index/foot_enter_new.png') no-repeat;
        background-size: 110px 552px;
    }
    .icon_1{
        background-position: -63px -456.5px;
    }
    .icon_2{
        background-position: -63px -101px;
    }
    .icon_3{
        background-position: 0 0;
    }
    .icon_4{
        background-position: -60px -50px;
    }
    .icon_5{
        background-position: 0 -101px;
    }
    .icons p{
        font-size: 10px;
        color: #999;
        margin-top: 10px;
    }
</style>