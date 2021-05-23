package com.example.rent.db;

import com.example.rent.commands.RegistrationUserCommand;
import com.example.rent.model.Car;
import com.example.rent.model.User;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

public class CarDao {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    public static boolean registerCar(Car car) {
        String sql = "INSERT INTO cars (brand, model, class, price, is_booked, image) VALUES (?, ?, ?, ?, ?,?)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getClassId());
            preparedStatement.setBigDecimal(4, car.getPriceForDay());
            preparedStatement.setBoolean(5, car.getIsBooked());
            preparedStatement.setBlob(6, car.getPhoto());
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    car.setId(generatedKeys.getInt(1));
                }
            }
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            return false;
        }
    }

    public static List<Car> findAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM cars ORDER BY id";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Car car = new Car();
                    car.setId(resultSet.getInt(1));
                    car.setBrand(resultSet.getString(2));
                    car.setModel(resultSet.getString(3));
                    car.setClassId(resultSet.getInt(4));
                    car.setPriceForDay(resultSet.getBigDecimal(5));
                    car.setIsBooked(resultSet.getBoolean(6));
                    car.setPhoto(resultSet.getBinaryStream(7));
                    cars.add(car);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return cars;
    }
}
