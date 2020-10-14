const music = {
    //添加到播放列表，并开始播放
    addSongPlay(message){
        this.$store.commit('addSongPlay',message);
    },
    //添加到播放列表，不播放
    addSong(message){
        this.$store.commit('addSong',message);
    },
    //添加所有的歌曲进入播放列表，并播放第一首歌
    addAllSongsPlay(message){
        this.$store.commit('addAllSongsPlay',message);
    },
    //添加所有的歌曲进入播放列表
    addAllSongs(message){
        this.$store.commit('addAllSongs',message);
    },
    //创建歌单
    addUserList(message){
        this.$store.commit('addUserList',message);
    },
    // 移除歌单
    removeUserList(message){
        this.$store.commit('removeUserList',message);
    }

}
export default music