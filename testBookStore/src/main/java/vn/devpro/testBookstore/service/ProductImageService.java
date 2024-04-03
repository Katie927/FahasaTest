package vn.devpro.testBookstore.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.testBookstore.model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage> {
	
	public Class<ProductImage> clazz(){
		return ProductImage.class;
	}
	
	public List<ProductImage> getProductImageById(int productId){
		String sql = "SELECT * FROM tbl_product_image WHERE product_id =" + productId;
		return super.executeNativeSql(sql);
	}
	
}
