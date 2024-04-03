package vn.devpro.testBookstore.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.testBookstore.dto.SearchModel;
import vn.devpro.testBookstore.dto.prjConstant;
import vn.devpro.testBookstore.model.Product;
import vn.devpro.testBookstore.model.ProductImage;

@Service
public class ProductService extends BaseService<Product> implements prjConstant {

	@Override
	public Class<Product> clazz() {
		return Product.class;
	}

	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_book WHERE status=1");
	}
	
	public List<Product> findHotProduct() {
		return super.executeNativeSql("SELECT * FROM tbl_book WHERE is_hot=1");
	}
	
	public List<Product> findByCategoryId(int categoryId){
		return super.executeNativeSql("SELECT * FROM tbl_book WHERE category_id=" + categoryId);
	}
	
	public List<Product> findByPublisherId(int publisherId){
		return super.executeNativeSql("SELECT * FROM tbl_book WHERE publish_by=" + publisherId);
	}
	
	public List<Product> findByKeyword(String keyword){
		String sql = "SELECT * FROM tbl_book AS p WHERE (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
				+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		return super.executeNativeSql(sql);
	}
	
	public List<Product> findByPrice(BigDecimal minPrice, BigDecimal maxPrice){
		String sql = "SELECT * FROM tbl_book WHERE sale_price>=" + minPrice + " AND sale_price<=" + maxPrice;
		return super.executeNativeSql(sql);
	}

	// ------------------ Search product ------------------------
	public List<Product> searchProduct(SearchModel productSearch) {
		// tao cau lenh sql
		String sql = "SELECT * FROM tbl_book p WHERE 1=1";

		// tim kiem voi tieu chi status
		if (productSearch.getStatus() != 2) {
			// co chon active/inactive
			sql += " AND p.status=" + productSearch.getStatus();
		}

		// tim kiem voi tieu chi categoryId
		if (productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();
		}
		
		// tim kiem voi tieu chi publisherId
		if (productSearch.getPublisherId() != 0) {
			sql += " AND p.publish_by=" + productSearch.getPublisherId();
		}

		// tim kiem bang keyword
		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}

		// tim kiem voi ngay thang
		if (!StringUtils.isEmpty(productSearch.getBeginDate())
				&& !StringUtils.isEmpty(productSearch.getEndDate())) {

			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();
			
			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}

		return super.executeNativeSql(sql);

	}

// 		------------------ Save Add product ------------------------
//	@Transactional
//	public Product saveAddProduct(Product product) {
//		return super.saveOrUpdate(product);
//	}
	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles)
			throws IOException {

		// luu avatar file
		if (isUploadFile(avatarFile)) {
			// cp upload avatarfile
			// luu file vao thu muc Product/Avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			// luu duong dan vao bang tbl_book
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		// luu image Files
		if (isUploadFiles(imageFiles)) {
			// co upload danh sach anh
			// duyet danh sach images
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {
					// co file upload
					// luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);

					// luu duong dan vao tbl_book_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());

					// luu duong dan sang bang tbl_book_image
					product.addRelationalProductImage(productImage);

				}
			}
		}
		return super.saveOrUpdate(product);
	}

	// ------------ Save edit product -------------
	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles)
			throws IOException {

		// lya product trong DB
		Product dbProduct = super.getById(product.getId());

		// luu avatar file moi neu nguoi dung co upload avatar
		if (isUploadFile(avatarFile)) {

			// xoa avata cu
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();

			// luu file avata moi vao
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			// lu duong dan cua avatar vao bang tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		} else { // nguoi dung khong upload file
			// giu nguyen avatar cu
			product.setAvatar(dbProduct.getAvatar());
		}
		// luu imageFile
		if (isUploadFiles(imageFiles)) {
			// co upload anh --> duyet danh sach image
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) {
					// co file upload
					// luu file vao thu muc Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);

					// luu duong dan vao tbl_product_image
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setUpdateDate(new Date());

					// luu duong dan sang bang tbl_product_image
					product.addRelationalProductImage(productImage);

				}
			}
		}

		return super.saveOrUpdate(product);
	}

//	--------------- phuong thuc kiem tra 1 file co duoc upload khong
	private boolean isUploadFile(MultipartFile file) {
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false; // khong upload
		}

		return true;
	}

//	-------------- phuong thuc kiem tra danh sach files co duoc upload khong -------------------
	public boolean isUploadFiles(MultipartFile[] files) {
		if (files == null || files.length == 0) {
			return false;
		}
		return true;
	}
}
