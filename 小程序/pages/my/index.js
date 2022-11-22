import { getBaseUrl, getWxLogin, getUserProfile, requestPay, requestUtil } from '../../utils/requestUtil'
import regeneratorRuntime from "../../lib/runtime/runtime"
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    const token = wx.getStorageSync('token');
    if (!token) {
      wx.showModal({
        title: '友情提示',
        content: '微信授权登录后才可进入个人中心',
        success: (res) => {
          Promise.all([getWxLogin(), getUserProfile()]).then((res) => {
            let loginParam = {
              code: res[0].code,
              nickName: res[1].userInfo.nickName,
              avatarUrl: res[1].userInfo.avatarUrl
            }
            wx.setStorageSync('userInfo', res[1].userInfo);
            this.wxlogin(loginParam);
            this.setData({
              userInfo: res[1].userInfo
            })
          })
        }
      })
    } else {
      //设置信息
      const userInfo = wx.getStorageSync('userInfo');
      this.setData({
        userInfo
      })
    }
  },
  //请求获取用户后端token
  async wxlogin(loginParam) {
    const result = await requestUtil({
      url: "/user/wxlogin",
      data: loginParam,
      method: "post"
    });
    const token = result.token;
    if (result.code === 0) {
      //存储token到缓存
      wx.setStorageSync('token', token);
    }
  },

  //收货地址管理
  handleEditAddress() {
    wx.chooseAddress({
      success: (result) => { },
    });
  },


  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})