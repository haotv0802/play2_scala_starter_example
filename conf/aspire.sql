DROP DATABASE IF EXISTS `aspire_db`;
CREATE DATABASE IF NOT EXISTS `aspire_db`;
USE `aspire_db`;

--
-- Table structure for table `aspire_user`
--
DROP TABLE IF EXISTS `aspire_user`;
CREATE TABLE `aspire_user` (
  `id`            BIGINT   AUTO_INCREMENT,
  `email`         VARCHAR(30) NULL,
  `password`      VARCHAR(30) NULL,
  `referral_code` VARCHAR(30) NULL,
  `referred_by`   VARCHAR(30) NULL,
  `created_on`    DATETIME DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_user_id` (`id`)
#   CONSTRAINT `aspire_user_referred_by` FOREIGN KEY (`referred_by`) REFERENCES `aspire_user` (`referral_code`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

--
-- Table structure for table `aspire_business_info`
--
DROP TABLE IF EXISTS `aspire_business_info`;
CREATE TABLE `aspire_business_info` (
  `id`               BIGINT AUTO_INCREMENT,
  `acra_number`      VARCHAR(100) NULL,
  `business_name`    VARCHAR(30)  NULL,
  `business_address` VARCHAR(30)  NULL,
  `city`             VARCHAR(30)  NULL,
  `cap`              VARCHAR(30)  NULL,
  `busines_phone`    VARCHAR(30)  NULL,
  `data_established` VARCHAR(30)  NULL,
  `type_of_entity`   VARCHAR(30)  NULL,
  `user_id`          BIGINT       NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_business_info_id` (`id`),
  CONSTRAINT `aspire_business_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_user` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

--
-- Table structure for table `aspire_personal_info`
--
DROP TABLE IF EXISTS `aspire_personal_info`;
CREATE TABLE `aspire_personal_info` (
  `id`            BIGINT AUTO_INCREMENT,
  `fin_number`    VARCHAR(100) NULL,
  `first_name`    VARCHAR(30)  NULL,
  `second_name`   VARCHAR(30)  NULL,
  `address`       VARCHAR(30)  NULL,
  `city`          VARCHAR(30)  NULL,
  `cap`           VARCHAR(30)  NULL,
  `phone`         VARCHAR(30)  NULL,
  `date_of_birth` DATE         NULL,
  `user_id`       BIGINT       NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_personal_info_id` (`id`),
  CONSTRAINT `aspire_personal_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_user` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

DROP TABLE IF EXISTS `aspire_application`;
CREATE TABLE `aspire_application` (
  `id`             BIGINT AUTO_INCREMENT,
  `amount`         DECIMAL(9, 2) NULL,
  `monthly_fee`    VARCHAR(30)   NULL,
  `interest_rate`  VARCHAR(30)   NULL,
  `payment_method` VARCHAR(30)   NULL,
  `created_on`     DATE          NULL,
  `user_id`        BIGINT        NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_application` (`id`),
  CONSTRAINT `aspire_application_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_user` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;