CREATE SCHEMA `rental`;

CREATE TABLE `rental`.`roles`
(
    `id`   INT         NOT NULL PRIMARY KEY,
    `role` VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO `rental`.`roles`
VALUES (0, 'admin');
INSERT INTO `rental`.`roles`
VALUES (1, 'manager');
INSERT INTO `rental`.`roles`
VALUES (2, 'client');

CREATE TABLE `rental`.`users`
(
    `id`         INT         NOT NULL AUTO_INCREMENT,
    `login`      VARCHAR(45) NOT NULL,
    `password`   VARCHAR(45) NOT NULL,
    `email`      VARCHAR(45) NOT NULL,
    `role_id`    INT         NOT NULL,
    `is_blocked` TINYINT     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    CONSTRAINT `role_id`
        FOREIGN KEY (`role_id`)
            REFERENCES `rental`.`roles` (`id`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
);

INSERT INTO `rental`.`users` (`login`, `password`, `email`, `role_id`, `is_blocked`)
VALUES ('admin', 'admin', 'admin@gmail.com', 0, false);
INSERT INTO `rental`.`users` (`login`, `password`, `email`, `role_id`, `is_blocked`)
VALUES ('test', '1', 'test@gmail.com', 0, false);

CREATE TABLE `rental`.`car_classes`
(
    `id`    INT         NOT NULL PRIMARY KEY,
    `class` VARCHAR(45) NOT NULL UNIQUE
);

INSERT INTO `rental`.`car_classes`
VALUES (0, 'entry');
INSERT INTO `rental`.`car_classes`
VALUES (1, 'business');
INSERT INTO `rental`.`car_classes`
VALUES (2, 'premium');

CREATE TABLE `rental`.`cars`
(
    `id`        INT           NOT NULL AUTO_INCREMENT,
    `brand`     VARCHAR(45)   NOT NULL,
    `model`     VARCHAR(45)   NOT NULL,
    `class_id`     INT           NOT NULL,
    `price`     DECIMAL(6, 2) NOT NULL,
    `is_booked` TINYINT       NOT NULL,
    `image`     MEDIUMBLOB    NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`class_id`)
        REFERENCES `rental`.`car_classes` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Mazda', '6', 1, 2500.00, false);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Toyota', 'Camry VX70', 1, 3700.00, false);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Porsche', 'Cayenne', 2, 9000.00, false);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Mercedes-Benz', 'S500', 2, 9100.00, false);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Ford', 'Fiesta VI', 0, 1000.00, false);
INSERT INTO `rental`.`cars` (`brand`, `model`, `class_id`, `price`, `is_booked`)
VALUES ('Renault', 'Logan TDI', 0, 1300.00, false);

CREATE TABLE `rental`.`order_statuses`
(
    `id`     INT         NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `rental`.`orders`
(
    `id`           INT         NOT NULL AUTO_INCREMENT,
    `car_id`       INT         NOT NULL,
    `user_id`      INT         NOT NULL,
    `pass_details` VARCHAR(85) NOT NULL,
    `has_driver`   TINYINT     NOT NULL,
    `start_date`   DATETIME    NOT NULL,
    `end_date`     DATETIME    NOT NULL,
    `status_id`    INT         NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `car_id`
        FOREIGN KEY (`car_id`)
            REFERENCES `rental`.`cars` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `user_id`
        FOREIGN KEY (`user_id`)
            REFERENCES `rental`.`users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `status_id`
        FOREIGN KEY (`status_id`)
            REFERENCES `rental`.`order_statuses` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

use rental;
insert into order_statuses (`status`)
values ('New');
insert into order_statuses (`status`)
values ('Approved');
insert into order_statuses (`status`)
values ('Rejected');

CREATE TABLE `rental`.`bill_types`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
);

insert into bill_types (`type`)
values ('rent');
insert into bill_types (`type`)
values ('damage');

CREATE TABLE `rental`.`bills`
(
    `id`           INT     NOT NULL AUTO_INCREMENT,
    `order_id`     INT     NOT NULL,
    `bill_type_id` INT     NOT NULL,
    `is_payed`     TINYINT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `order_id`
        FOREIGN KEY (`order_id`)
            REFERENCES `rental`.`orders` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `bill_type_id`
        FOREIGN KEY (`bill_type_id`)
            REFERENCES `rental`.`bill_types` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);