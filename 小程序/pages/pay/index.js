//导入requestUtil request请求工具类
import { getBaseUrl, requestUtil, getWxLogin, getUserProfile, requestPay } from '../../utils/requestUtil';
import regeneratorRuntime from '../../lib/runtime/runtime'
Page({

  /**
   * 页面的初始数据
   */
  data: {
    address: {},
    cart: [],
    baseUrl: '',
    totalPrice: 0,
    totalNum: 0
  },


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl
    })
  },


  //处理订单支付
  async handleOrderPay() {
    // let res = await getWxLogin();

    // let res2 = await getUserProfile();
    // console.log(res2)

    const token = wx.getStorageSync('token');
    if (!token) {
      Promise.all([getWxLogin(), getUserProfile()]).then((res) => {
        let loginParam = {
          code: res[0].code,
          nickName: res[1].userInfo.nickName,
          avatarUrl: res[1].userInfo.avatarUrl
        }
        wx.setStorageSync('userInfo', res[1].userInfo);
        this.wxlogin(loginParam);
      })
    } else {
      //以下是支付
      this.creatOrder();
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
      //以下是支付
      this.creatOrder();
    }
  },

  //创建订单
  async creatOrder() {
    try {
      const totalPrice = this.data.totalPrice;
      const address = this.data.address.provinceName + this.data.address.cityName + this.data.address.countyName + this.data.address.detailInfo;
      const consignee = this.data.address.userName;
      const telNumber = this.data.address.telNumber;
      let goods = [];
      this.data.cart.forEach(v => goods.push({
        goodsId: v.id,
        goodsNumber: v.num,
        goodsPrice: v.price,
        goodsName: v.name,
        goodsPic: v.proPic
      }))
      const orderParam = {
        totalPrice, address, consignee, telNumber, goods
      }
      const res = await requestUtil({
        url: "/my/order/create",
        method: "POST",
        data: orderParam
      });
      //调用统一下单，预支付
      let orderNo = res.orderNo
      const perparePayRes = await requestUtil({
        url: "/my/order/preparePay",
        method: "POST",
        data: orderNo
      });

      // 调用微信支付接口，没有商户认证，无法实现
      // let payRes = await requestPay(perparePayRes);
      wx.showToast({
        title: '支付成功',
      })

      //删除缓存中，已经支付的商品
      let newCart = wx.getStorageSync('cart');
      newCart = newCart.filter(v => !v.checked);
      wx.setStorageSync('cart', newCart);

      wx.navigateTo({
        url: '/pages/order/index?type=0'
      })
    } catch (error) {
      console.log(error);
      wx.showToast({
        title: '支付失败，请稍后重试',
        icon: 'none'
      })
    }
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    const address = wx.getStorageSync('address');
    let cart = wx.getStorageSync('cart') || [];
    cart = cart.filter(v => v.checked);
    let totalPrice = 0;
    let totalNum = 0;
    cart.forEach(v => {
      totalPrice += v.price * v.num;
      totalNum += v.num;
    })
    this.setData({
      cart, totalNum, totalPrice, address
    })
  },
})