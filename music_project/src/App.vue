<template>
  <div id="app">
    <router-view/>
    <my-audio />
  </div>
</template>
<script>
import MyAudio from './components/MyAudio.vue'
export default {
    components:{
      MyAudio
    }
}
</script>

<style>

</style>
