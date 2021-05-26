package com.example.rent.commands;

import com.example.rent.db.CarDao;
import com.example.rent.model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Blob;

public class AddCarCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int carClass = Integer.parseInt(request.getParameter("carclass"));
        BigDecimal price = BigDecimal.valueOf(Double.valueOf(request.getParameter("price")));
        InputStream photo = null;
        try {
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                photo = filePart.getInputStream();
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Car car = Car.createCar(brand, model, carClass, price);
        car.setPhoto(photo);
        if (CarDao.registerCar(car)) {
            return "result.jsp";
        } else {
            return "error.jsp";
        }
    }
}
