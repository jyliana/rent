package com.example.rent.db;

import com.example.rent.commands.RegistrationUserCommand;
import com.example.rent.model.Car;
import com.sun.istack.internal.logging.Logger;

import java.sql.*;
import java.util.logging.Level;

public class CarDao {
    private static final Logger LOGGER = Logger.getLogger(RegistrationUserCommand.class);

    public static boolean registerCar(Car car) {
        String sql = "INSERT INTO cars (brand, model, class, price, is_booked) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBManager.getInstance().getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getClassId());
            preparedStatement.setBigDecimal(4, car.getPriceForDay());
            preparedStatement.setBoolean(5, car.getIsBooked());
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
}
