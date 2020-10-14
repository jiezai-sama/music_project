const storage = {
    //获取缓存的播放列表和正在播放的歌曲
    getSessionstorge(){
        if (this.$store.state.playList[0] == undefined){
            if(sessionStorage.getItem('key1') != null){
                let message_1 = JSON.parse(sessionStorage.getItem('key1'));
                this.$store.commit('sessionPlaylist',message_1);
            }
            if(sessionStorage.getItem('key2') != null){
                let message_2 = JSON.parse(sessionStorage.getItem('key2'));
                this.$store.commit('setContent',message_2);
            }
        }
    },
    //获取缓存的用户信息及歌单信息
    getuserMessage(){
        if (JSON.stringify(this.$store.state.user) == '{}'){
            if (sessionStorage.getItem('user') != null){
                let message1 = JSON.parse(sessionStorage.getItem('user'));
                let message2 = JSON.parse(sessionStorage.getItem('list'));
                this.$store.commit('adduserMessage',message1);
                this.$store.commit('getUserList',message2);
            }
        }
    },
    
}
export default storage;