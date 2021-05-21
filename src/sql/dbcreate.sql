CREATE SCHEMA `rental`;

CREATE TABLE `rental`.`roles` (
    `id`   INT         NOT NULL PRIMARY KEY,
    `role` VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO `rental`.`roles` VALUES (0, 'admin');
INSERT INTO `rental`.`roles` VALUES (1, 'manager');
INSERT INTO `rental`.`roles` VALUES (2, 'client');

CREATE TABLE `rental`.`users` (
    `id`       INT         NOT NULL AUTO_INCREMENT,
    `login`    VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `email`    VARCHAR(45) NOT NULL,
    `role_id`  INT         NOT NULL,
    `is_blocked` TINYINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    CONSTRAINT `role_id`
        FOREIGN KEY (`role_id`)
            REFERENCES `rental`.`roles` (`id`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
);

INSERT INTO `rental`.`users` (`login`, `password`, `email`, `role_id`, `is_blocked`) VALUES ('admin', 'admin', 'admin@gmail.com', 0, false);
INSERT INTO `rental`.`users` (`login`, `password`, `email`, `role_id`, `is_blocked`) VALUES ('test', '1', 'test@gmail.com', 0, false);

CREATE TABLE `rental`.`car_classes` (
    `id` INT NOT NULL PRIMARY KEY,
    `class` VARCHAR(45) NOT NULL UNIQUE
);

INSERT INTO `rental`.`car_classes` VALUES (0, 'entry');
INSERT INTO `rental`.`car_classes` VALUES (1, 'business');
INSERT INTO `rental`.`car_classes` VALUES (2, 'premium');

CREATE TABLE `rental`.`cars` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `brand` VARCHAR(45) NOT NULL,
    `model` VARCHAR(45) NOT NULL,
    `class` INT NOT NULL,
    `price` DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`class`)
        REFERENCES `rental`.`car_classes` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);

INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Mazda', '6', 1, 2500.00);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Toyota', 'Camry VX70', 1, 3700.00);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Porsche', 'Cayenne', 2, 9000.00);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Mercedes-Benz', 'S500', 2, 9100.00);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Ford', 'Fiesta VI', 0, 1000.00);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class`, `price`) VALUES ('Renault', 'Logan TDI', 0, 1300.00);