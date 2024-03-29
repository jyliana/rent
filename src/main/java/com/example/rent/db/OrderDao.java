package com.example.rent.db;

import com.example.rent.model.Order;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class OrderDao {
    private static final Logger LOGGER = Logger.getLogger(OrderDao.class);

    public static boolean createOrder(Order order) {
        String sql = "INSERT INTO client_order(car_id, user_id, pass_details, has_driver, start_date, end_date, days, total_sum, status_id) VALUES(?,?,?,?,?,?,?,?,?)";

        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, order.getCarId());
            preparedStatement.setInt(2, order.getUserId());
            preparedStatement.setString(3, order.getPassDetails());
            preparedStatement.setBoolean(4, order.isHasDriver());
            preparedStatement.setDate(5, order.getStartDate());
            preparedStatement.setDate(6, order.getEndDate());
            preparedStatement.setInt(7, order.getDays());
            preparedStatement.setBigDecimal(8, order.getTotalSum());
            preparedStatement.setInt(9, order.getStatusId());
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order.setId(generatedKeys.getInt(1));
                }
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return false;
        }
    }

    public static List<Order> findAllUserOrders(String name) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT client_order.id, car_id, user_id, pass_details, has_driver, start_date, end_date, days, total_sum, status_id " +
                "FROM client_order LEFT JOIN user ON client_order.user_id=user.id WHERE user.login= ?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, name);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setCarId(resultSet.getInt(2));
                    order.setUserId(resultSet.getInt(3));
                    order.setPassDetails(resultSet.getString(4));
                    order.setHasDriver(resultSet.getBoolean(5));
                    order.setStartDate(resultSet.getDate(6));
                    order.setEndDate(resultSet.getDate(7));
                    order.setDays(resultSet.getInt(8));
                    order.setTotalSum(resultSet.getBigDecimal(9));
                    order.setStatusId(resultSet.getInt(10));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return orders;
    }

    public static List<Order> findAllUserOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT client_order.id, car_id, user_id, pass_details, has_driver, start_date, end_date, days, total_sum, status_id " +
                "FROM client_order LEFT JOIN user ON client_order.user_id=user.id";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = new Order();
                    order.setId(resultSet.getInt(1));
                    order.setCarId(resultSet.getInt(2));
                    order.setUserId(resultSet.getInt(3));
                    order.setPassDetails(resultSet.getString(4));
                    order.setHasDriver(resultSet.getBoolean(5));
                    order.setStartDate(resultSet.getDate(6));
                    order.setEndDate(resultSet.getDate(7));
                    order.setDays(resultSet.getInt(8));
                    order.setTotalSum(resultSet.getBigDecimal(9));
                    order.setStatusId(resultSet.getInt(10));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return orders;
    }

    public static boolean updateOrder(Order order) {
        String sql = "UPDATE client_order SET status_id=?, comment=? where id=?";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, order.getStatusId());
            preparedStatement.setString(2, order.getComment());
            preparedStatement.setInt(3, order.getId());
            if (preparedStatement.executeUpdate() > 0) {
                return true;
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return false;
    }

//    public static int returnAmountOfBookedDays(Order order) {
//        String sql = "SELECT start_date, end_date FROM client_order where id=?";
//        int amount = 0;
//        try (Connection conn = DBManager.getInstance().getConnection();
//             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
//            preparedStatement.setInt(1, order.getId());
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                while (resultSet.next()) {
//                    Date startDate = resultSet.getDate(1);
//                    Date endDate = resultSet.getDate(2);
//                    amount = Period.between(startDate.toLocalDate(), endDate.toLocalDate()).getDays();
//                }
//            }
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, e.getMessage());
//        }
//        return amount;
//    }

//    public static Order findOrderById(int orderId) {
//        String sql = "SELECT * FROM client_order where id=?";
//        Order order = new Order();
//        try (Connection conn = DBManager.getInstance().getConnection();
//             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
//            preparedStatement.setInt(1, orderId);
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                if (resultSet.next()) {
//                    order.setId(resultSet.getInt("1"));
//                    order.setId(resultSet.getInt("1"));
//                    order.setId(resultSet.getInt("1"));
//                    order.setId(resultSet.getInt("1"));
//                    order.setId(resultSet.getInt("1"));
//                    order.setId(resultSet.getInt("1"));
//                }
//            }
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, e.getMessage());
//        }
//        return order;
//    }
}
