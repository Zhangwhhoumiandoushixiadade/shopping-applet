//导入requestUtil request请求工具类
import { getBaseUrl, requestUtil } from '../../utils/requestUtil';
import regeneratorRuntime from '../../lib/runtime/runtime'

Page({

  /**
   * 页面的初始数据
   */
  data: {
    orders: [],
    tabs: [
      {
        id: 0,
        value: "全部订单",
        isActive: true
      },
      {
        id: 1,
        value: "待付款",
        isActive: false
      },
      {
        id: 2,
        value: "待收货",
        isActive: false
      },
      {
        id: 3,
        value: "退款/退货",
        isActive: false
      },
    ]
  },
  //接口参数 的封装(不是双向绑定的数据，不需要放在页面中，所以不需要写在data中)
  QueryParams: {
    type: 0,
    page: 1, //第几页
    pageSize: 10 //每页记录数
  },

  //总页数
  totalPage: 1,

  //根据标题索引激活选择的标签
  changeTitleByIndex(index) {
    //切换标题
    let { tabs } = this.data;
    tabs.forEach((v, i) => i == index ? v.isActive = true : v.isActive = false);
    this.setData({
      tabs
    })
  },

  //tab点击事件，切换tab
  handleTabsItemChange(e) {
    // const { index } = e.currentTarget.dataset;
    const { index } = e.detail;
    console.log(index);
    //切换标题
    this.changeTitleByIndex(index)
    //获取订单列表
    this.QueryParams.type = index;
    this.QueryParams.page = 1;
    this.setData({
      orders: []
    })
    this.getOrders();

  },

  //获取订单
  async getOrders() {
    const res = await requestUtil({
      url: "/my/order/list",
      data: this.QueryParams
    });
    this.totalPage = res.totalPage;
    console.log(res);
    this.setData({
      //将数据进行动态的拼接
      orders: [...this.data.orders, ...res.orderList]
    })
  },

  /**
   * 监视用户下拉操作
   */
  onPullDownRefresh: function () {
    this.QueryParams.page = 1;
    this.setData({
      orders: []
    })
    this.getOrders();
    //手动关闭等待效果
    wx.stopPullDownRefresh();
  },



  /**
   * 生命周期函数：页面上拉触底事件的处理函数
   */
  onReachBottom() {
    if (this.QueryParams.page >= this.totalPage) {
      //没有下一页数据
      wx.showToast({
        title: '没有下一页数据了',
      })
    } else {
      //有下一页数据
      this.QueryParams.page++;
      this.getOrders();
    }
  },


  /**
   * 生命周期函数： 监听页面显示
   */
  onShow: function () {
    let pages = getCurrentPages();
    let currentPage = pages[pages.length - 1];
    const { type } = currentPage.options;
    this.changeTitleByIndex(type);
    this.QueryParams.type = type;
    this.QueryParams.page = 1;
    this.setData({
      orders: []
    })
    this.getOrders();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})