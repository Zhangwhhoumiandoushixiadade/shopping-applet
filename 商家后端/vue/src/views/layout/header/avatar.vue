<template>
  <el-dropdown>
   <span class="el-dropdown-link">
      <el-avatar shape="square" :size="40" :src="squareUrl"/>
    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item @click="logout">安全退出</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
</template>

<script setup>
import {ref} from "vue";
import {useStore} from 'vuex'

const squareUrl = ref("https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png")
const store = useStore()
const logout = () => {
  store.dispatch('logout')
}
</script>

<style scoped>

</style>