// 定义请求根路径解决，部署到服务器上改变域名的问题
const baseUrl = "http://localhost:8080";
//同时并发请求的次数
let ajaxTime = 0;
/**
 * 返回请求根路径baseUrl
 */
export const getBaseUrl = () => {
  return baseUrl;
}

/*
wxlogin封装
 */
export const getWxLogin = () => {
  return new Promise((resolve, reject) => {
    wx.login({
      timeout: 5000,
      success: (res) => {
        resolve(res)
      },
      fail: (err) => {
        reject(err)
      }
    })
  });
}

/*
getUserProfile封装
 */
export const getUserProfile = () => {
  return new Promise((resolve, reject) => {
    wx.getUserProfile({
      desc: '获取用户信息',
      success: (res) => {
        resolve(res)
      },
      fail: (err) => {
        reject(err)
      }
    })
  });
}

/**
 * 后端请求工具类
 * @param {*} params 
 */
export const requestUtil = (params) => {
  //判断url是否带有 /my/ 请求的是私有路径 带上header token
  let header = { ...params.header };
  if (params.url.includes("/my/")) {
    //拼接header带上token
    header["token"] = wx.getStorageSync('token')
  }

  ajaxTime++;

  wx.showLoading({
    title: '加载中....',
    mask: true
  })

  return new Promise((resolve, reject) => {
    wx.request({
      ...params,
      header,
      url: baseUrl + params.url,
      success: (result) => {
        resolve(result.data)
      },
      fail: (error) => {
        reject(error)
      },
      complete: () => {
        ajaxTime--;
        if (ajaxTime == 0) {
          wx.hideLoading(); //关闭加载图标
        }
      }
    })
  });
}

/**
 * promise形式的微信小程序封装
*/
export const requestPay = (pay) => {
  return new Promise((resolve, reject) => {
    wx.requestPayment({
      ...pay,
      success: (res) => {
        resolve(res)
      },
      fail: (err) => {
        reject(err)
      }
    })
  });
}