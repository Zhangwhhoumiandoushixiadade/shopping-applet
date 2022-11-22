//导入requestUtil request请求工具类
import { getBaseUrl, requestUtil } from '../../utils/requestUtil';
import regeneratorRuntime from '../../lib/runtime/runtime'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    //轮播图数组
    swiperList: [],
    baseUrl: '',
    bigTypeList: [], //主页分页栏
    bigTypeList_row1: [], //主页分类栏上
    bigTypeList_row2: [], //主页分类栏下
    hotProductList: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl
    })
    //发送异步请求，获取后端数据
    // wx.request({
    // url: 'http://localhost:8080/product/findSwiper',
    // method: 'GET',
    // success: (result) => {
    // console.log(result)
    // this.setData({
    // swiperList: result.data.message
    // })
    // }
    // })
    //获取轮播图
    this.getSwiperList();
    //获取首页分类
    this.getBigTypeList();
    //热门推荐
    this.getHotProductList();
  },

  //大类点击事件,跳转商品分类页面
  handleTypeJump(e) {
    const { index } = e.currentTarget.dataset;
    const app = getApp();
    app.globalData.index = index;

    wx.switchTab({
      url: '/pages/category/index'
    })
  },

  //获取轮播图
  async getSwiperList() {
    // requestUtil({ url: '/product/findSwiper', method: "GET" }).then(result => {
    //   const baseUrl = getBaseUrl();
    //   this.setData({
    //     swiperList: result.message,
    //     baseUrl
    //   })
    // })

    const result = await requestUtil({
      url: '/product/findSwiper',
      method: "GET"
    });
    this.setData({
      swiperList: result.message,
    })
  },

  //获取首页分类
  async getBigTypeList() {
    const result = await requestUtil({
      url: '/bigType/findAll',
      method: "GET"
    });
    const bigTypeList = result.message;
    const bigTypeList_row1 = bigTypeList.filter((item, index) => {
      return index < 5;
    })
    const bigTypeList_row2 = bigTypeList.filter((item, index) => {
      return index >= 5;
    })
    this.setData({
      bigTypeList,
      bigTypeList_row1,
      bigTypeList_row2,
    })
  },

  //爆款推荐
  async getHotProductList() {
    const result = await requestUtil({
      url: '/product/findHot',
      method: "GET"
    });
    this.setData({
      hotProductList: result.message,
    })
  },

})