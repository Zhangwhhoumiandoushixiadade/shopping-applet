const { defineConfig } = require('@vue/cli-service')
const {resolve} = require("@babel/core/lib/vendor/import-meta-resolve");
module.exports = defineConfig({
  transpileDependencies: true,
  // 关闭eslint校验
  lintOnSave: false,
  devServer: {
    port: 8081 // 此处修改你想要的端口号
  },
})



