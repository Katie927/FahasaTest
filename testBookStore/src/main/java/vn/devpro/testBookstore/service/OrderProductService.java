package vn.devpro.testBookstore.service;

import vn.devpro.testBookstore.model.SaleOrderProduct;

public class OrderProductService extends BaseService<SaleOrderProduct> {
	
	@Override
	public Class<SaleOrderProduct> clazz(){
		return SaleOrderProduct.class;
	}
	
}
