package vn.devpro.testBookstore.service;

import org.springframework.stereotype.Service;

import vn.devpro.testBookstore.model.User;

@Service
public class UserService extends BaseService<User> {
	
	@Override
	public Class<User> clazz(){
		return User.class;
	}
	
}
