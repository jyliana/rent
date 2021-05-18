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
    PRIMARY KEY (`id`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    CONSTRAINT `role_id`
        FOREIGN KEY (`role_id`)
            REFERENCES `rental`.`roles` (`id`)
            ON DELETE CASCADE
            ON UPDATE RESTRICT
);

INSERT INTO `rental`.`users` (`login`, `password`, `email`, `role_id`)
VALUES ('admin', 'admin', 'admin@gmail.com', 0);