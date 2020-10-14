import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    playList:[],     //播放列表
    playContent:{},  //当前歌曲播放信息
    user:{},          //当前登录信息
    userList:[],      //用户收藏的歌单
    isloaded: false   //是否登录
  },
  mutations: {
    //从缓存中读取playList的数据
    sessionPlaylist(state,message){
      state.playList = message;
    },
    //从列表中设置歌曲信息到当前播放
    setContent(state,message){
      state.playContent = message;
      sessionStorage.setItem("key2",JSON.stringify(state.playContent));
    },
    //添加歌曲到播放列表，并播放当前歌曲,不能重复添加
    addSongPlay(state,message){
      state.playContent = message;
      if (state.playList[0] != undefined){
        let res = state.playList.some(item => {
          return item.songId == message.songId;
        });
        if (!res) {
          state.playList.push(message);
        }
      }else{
        state.playList.push(message);
      }
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
      sessionStorage.setItem("key2",JSON.stringify(state.playContent));
    },
    //添加歌曲到播放列表
    addSong(state,message){
      if (state.playList[0] != undefined){
        let res = state.playList.some(item => {
          return item.songId == message.songId;
        });
        if (!res) {
          state.playList.push(message);
        }
      }else{
        state.playList.push(message);
      }
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
    },
    //添加歌曲列表到播放列表,并播放
    addAllSongsPlay(state,message){
      switch (state.playList.length){
        case 0:
          message.forEach(el => {
            state.playList.push(el);
          });
          break;
        default:
          message.forEach(el => {
            let res = state.playList.some(item => {
              return item.songId == el.songId;
            });
            if (!res) {
              state.playList.push(el);
            }
          });
      }
      state.playContent = message[0];
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
      sessionStorage.setItem("key2",JSON.stringify(state.playContent));
    },
    //添加歌曲列表到播放列表
    addAllSongs(state,message){
      switch (state.playList.length){
        case 0:
          message.forEach(el => {
            state.playList.push(el);
          });
          break;
        default:
          message.forEach(el => {
            let res = state.playList.some(item => {
              return item.songId == el.songId;
            });
            if (!res) {
              state.playList.push(el);
            }
          });
      }
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
      sessionStorage.setItem("key2",JSON.stringify(state.playContent));
    },
    //移除歌曲，从播放列表
    removeSong(state,message){
      let index = state.playList.indexOf(message);
      state.playList.splice(index,1);
      if (state.playList.length == 0){
        state.playContent = {};
      }
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
    },
    //移除列表所有歌曲
    removeAllSongs(state){
      state.playList = [];
      state.playContent = {};
      sessionStorage.setItem("key1",JSON.stringify(state.playList));
      sessionStorage.setItem("key2",JSON.stringify(state.playContent));
    },
    //向user中插入登录信息
    adduserMessage(state,message){
      state.user = message;
      state.isloaded = true;
      sessionStorage.setItem('user',JSON.stringify(message));
    },
    //删除登录信息
    removeUserMessage(state){
      state.user = {};
      state.isloaded = false;
      sessionStorage.removeItem('user');
    },
    //向userList插入歌单
    addUserList(state,message){
      state.userList.push(message);
      sessionStorage.setItem('list',JSON.stringify(state.userList));
    },
    //获取缓存中歌单
    getUserList(state,message){
      message.forEach(el => {
        state.userList.push(el);
      })
      sessionStorage.setItem('list',JSON.stringify(state.userList));
    },
    //删除歌单
    removeUserList(state,index){
      state.userList.splice(index,1);
      sessionStorage.setItem('list',JSON.stringify(state.userList));
    },
    //修改歌单
    updateList(state,message){
      state.userList[message.index].userListName = message.name;
      sessionStorage.setItem('list',JSON.stringify(state.userList));
    },
    //用户退出登录，移除所有歌单
    removeAllList(state){
      state.userList = [];
      sessionStorage.removeItem('list');
    }
  },
  actions: {
  },
  modules: {
  }
})
