package tygri.pujcovna.dao;

import org.hibernate.sql.Select;
import org.springframework.stereotype.Repository;
import tygri.pujcovna.model.Car;
import tygri.pujcovna.model.Carorder;
import tygri.pujcovna.model.User;

import java.sql.Timestamp;
import java.time.DateTimeException;
import java.util.List;
import java.util.Date;

@Repository
public class CarorderDao extends BaseDao {

    public CarorderDao() {
        super(Carorder.class);
    }

    public List<Carorder> getAllCarorders() {
        return super.getAll();
    }

    public boolean createCarorder(User customer, Timestamp begin,Timestamp end,Car car,double price,boolean paid ){
        try{
            Carorder order = new Carorder(car,begin,end,new Timestamp(System.currentTimeMillis()),price,paid);
            persist(order);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<Carorder> getUserOrderHistory(User u) {
        try {
            return em.createQuery("SELECT e FROM Carorder e where e.account=:user and e.paid = true").setParameter("user", u).getResultList();
        } catch (Exception e){
            return null;
        }
    }

    public List<Carorder> getCarOrderHistory(Car c) {
        try {
            return em.createQuery("SELECT e FROM Carorder e where e.car=:car and e.paid=true").setParameter("car", c).getResultList();
        } catch (Exception e){
            return null;
        }
    }

    public List<Carorder> getUserCurrentReservations(User u) {
        try {
            return em.createQuery("SELECT e FROM Carorder e where e.account=:user and e.enddate>:date").setParameter("date",new Timestamp(System.currentTimeMillis())).setParameter("user", u).getResultList();
        } catch (Exception e){
            return null;
        }
    }

    public List<Carorder> getCarCurrentReservations(Car c) {
        try {
            return em.createQuery("SELECT e FROM Carorder e where e.car=:car and e.enddate>:date").setParameter("date",new Timestamp(System.currentTimeMillis())).setParameter("car", c).getResultList();
        } catch (Exception e){
            return null;
        }
    }



}