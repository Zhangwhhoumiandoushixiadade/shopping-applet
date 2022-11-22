package com.xcx.controller.admin;

import com.xcx.entity.PageBean;
import com.xcx.entity.Product;
import com.xcx.entity.R;
import com.xcx.service.IProductService;
import com.xcx.util.DateUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("admin/product")
public class AdminProductController {

    @Autowired
    private IProductService productService;

    @Value("${productImagesFilePath}")
    private String productImagesFilePath;

    @Value("${swiperImagesFilePath}")
    private String swiperImagesFilePath;
    /**
     * 根据条件分页查询
     *
     * @param pageBean
     * @return
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean) {
        System.out.println(pageBean);
        Map<String, Object> map = new HashMap<>();
        map.put("name", pageBean.getQuery().trim());
        map.put("start", pageBean.getStart());
        map.put("pageSize", pageBean.getPageSize());
        List<Product> productList = productService.list(map);
        Long total = productService.getTotal(map);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("productList", productList);
        resultMap.put("total", total);
        return R.ok(resultMap);
    }

    /***
     * 更新热门状态
     * @param id
     * @param hot
     * @return
     */
    @RequestMapping("/updateHot/{id}/state/{hot}")
    public R updateHot(@PathVariable(value = "id") Integer id, @PathVariable(value = "hot") boolean hot) {
        Product product = productService.getById(id);
        product.setHot(hot);
        if (hot) {
            product.setHotDateTime(new Date());
        } else {
            product.setHotDateTime(null);
        }
        productService.saveOrUpdate(product);
        return R.ok();
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/updateSwiper/{id}/state/{swiper}")
    public R updateSwiper(@PathVariable(value = "id") Integer id, @PathVariable(value = "swiper") boolean swiper) {
        Product product = productService.getById(id);
        product.setSwiper(swiper);
        productService.saveOrUpdate(product);
        return R.ok();
    }

    @RequestMapping("/delete/{id}")
    public R delete(@PathVariable(value = "id") Integer id) {
        productService.removeById(id);
        return R.ok();
    }

    /**
     * 上传商品大类图片
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadImage")
    public Map<String, Object> uploadImage(MultipartFile file) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        if (!file.isEmpty()) {
            // 获取文件名
            String originalFilename = file.getOriginalFilename();
            String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = DateUtil.getCurrentDateStr() + suffixName;
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(productImagesFilePath + newFileName));
            resultMap.put("code", 0);
            resultMap.put("msg", "上传成功");
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("title", newFileName);
            dataMap.put("src", "/image/product/" + newFileName);
            resultMap.put("data", dataMap);
        }
        return resultMap;
    }


    /**
     * 上传swiper幻灯图片
     *
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadSwiperImage")
    public Map<String, Object> uploadSwiperImage(MultipartFile file) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        if (!file.isEmpty()) {
            // 获取文件名
            String originalFilename = file.getOriginalFilename();
            String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFileName = DateUtil.getCurrentDateStr() + suffixName;
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(swiperImagesFilePath + newFileName));
            resultMap.put("code", 0);
            resultMap.put("msg", "上传成功");
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("title", newFileName);
            dataMap.put("src", "/image/swiper/" + newFileName);
            resultMap.put("data", dataMap);
        }
        return resultMap;
    }

    /**
     * 添加或者修改
     *
     * @param product
     * @return
     */
    @RequestMapping("/save")
    public R save(@RequestBody Product product) {
        if (product.getId() == null || product.getId() == -1) {
            productService.add(product);
        } else {
            productService.update(product);
        }
        return R.ok();
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R findById(@PathVariable(value = "id")Integer id){
        Product product = productService.findById(id);
        Map<String,Object> map=new HashMap<>();
        map.put("product",product);
        return R.ok(map);
    }
}
