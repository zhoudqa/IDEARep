package com.zhoudq.dao.impl;

import com.zhoudq.dao.UserDao;
import com.zhoudq.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

/**
 * Created by kinthon on 17-6-23.
 */

@Transactional(rollbackFor = Exception.class)
//出现Exception异常回滚
@Repository("userDao") //进行注入
public class UserDaoImpl implements UserDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void add(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public boolean login(User user) {


        Session s=sessionFactory.openSession();
        s.beginTransaction();
        String hsql="FROM User u ";

        Query query = s.createQuery(hsql);
        //query.setString(0, user.getUsername());
        //query.setString(1, user.getPassword());
        System.out.println(user.getUsername());
        List<User> gets=query.list();
        for(User user1:gets){
            System.out.println("username:"+user1.getUsername()+" email:"+user1.getEmail()+" password:"+user1.getPassword());
        }
        s.getTransaction().commit();
        s.close();
        sessionFactory.close();
        if(gets.size()>0) {
            System.out.println("true");
            return true;
        } else {
            System.out.println("false");
            return false;
        }
    }

    @Override
    public List getUser() {
        return sessionFactory.getCurrentSession().createQuery("FROM User").list();
    }

    @Override
    public User getUser(int id) {
        return (User)sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public void delete(int id) {
        sessionFactory.getCurrentSession().delete(
                sessionFactory.getCurrentSession().get(User.class, id)
        );
    }
}