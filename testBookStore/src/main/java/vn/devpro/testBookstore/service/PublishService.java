package vn.devpro.testBookstore.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.testBookstore.dto.prjConstant;
import vn.devpro.testBookstore.model.Publisher;

@Service
public class PublishService extends BaseService<Publisher> implements prjConstant {
	
	@Override
	public Class<Publisher> clazz() {
		return Publisher.class;
	}
	
	public List<Publisher> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_publish WHERE status = 1");
	}
	
	@Transactional
	public void deletePublisherById(int id) {
		
		super.deleteById(id);
	}
	
	@Transactional
	public void inactivePublisher(Publisher publisher) {
		super.saveOrUpdate(publisher);
	}
	
}
