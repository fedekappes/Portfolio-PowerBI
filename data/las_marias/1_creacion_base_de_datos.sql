USE las_marias;
CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(20)  NOT NULL ,
    `order_date` date  NOT NULL ,
    `order_time` time  NOT NULL ,
    `item_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean NULL,
    `add_id` int NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `customers` (
    `cust_id` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

CREATE TABLE `address` (
    `add_id` int  NOT NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_address` varchar(200)  NOT NULL ,
    `delivery_zipcode` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

CREATE TABLE `items` (
    `item_id` int  NOT NULL ,
    `sku` varchar(30)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(30)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `sku`
    )
);

CREATE TABLE `recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(30)  NOT NULL ,
    `ing_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `ingredient` (
    `ing_id` int  NOT NULL ,
    `ing_name` varchar(30)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_measure` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `inventory` (
    `ing_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `rota` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(20)  NOT NULL ,
    `date` date  NOT NULL ,
    `shift_id` int  NOT NULL ,
    `staff_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `shift` (
    `shift_id` int  NOT NULL ,
    `weekday` varchar(10)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

CREATE TABLE `staff` (
    `staff_id` int  NOT NULL ,
    `staff_firstname` varchar(50)  NOT NULL ,
    `staff_lastname` varchar(50)  NOT NULL ,
    `position` varchar(50)  NOT NULL ,
    `hourly_pay` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_item_id` FOREIGN KEY(`item_id`)
REFERENCES `items` (`item_id`);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `customers` (`cust_id`);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_add_id` FOREIGN KEY(`add_id`)
REFERENCES `address` (`add_id`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_sku` FOREIGN KEY(`recipe_id`)
REFERENCES `items` (`sku`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `ingredient` (`ing_id`);

ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `ingredient` (`ing_id`);
/*
ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_date` FOREIGN KEY(`date`)
REFERENCES `orders` (`order_date`);
*/
ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `shift` (`shift_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `staff` (`staff_id`);

