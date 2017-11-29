DROP DATABASE IF EXISTS `aspire_db`;
CREATE DATABASE IF NOT EXISTS `aspire_db`;
USE `aspire_db`;

--
-- Table structure for table `aspire_user`
--
DROP TABLE IF EXISTS `aspire_users`;
CREATE TABLE `aspire_users` (
  `id`            BIGINT   AUTO_INCREMENT,
  `email`         VARCHAR(30) NULL,
  `password`      VARCHAR(30) NULL,
  `referral_code` VARCHAR(30) NULL,
  `referred_by`   VARCHAR(30) NULL,
  `created_on`    DATETIME DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_users_id` (`id`)
  #   CONSTRAINT `aspire_user_referred_by` FOREIGN KEY (`referred_by`) REFERENCES `aspire_users` (`referral_code`)
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
  CONSTRAINT `aspire_business_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_users` (`id`)
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
  CONSTRAINT `aspire_personal_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_users` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

DROP TABLE IF EXISTS `aspire_applications`;
CREATE TABLE `aspire_applications` (
  `id`             BIGINT AUTO_INCREMENT,
  `amount`         DECIMAL(9, 2) NULL,
  `monthly_fee`    VARCHAR(30)   NULL,
  `interest_rate`  VARCHAR(30)   NULL,
  `payment_method` VARCHAR(30)   NULL,
  `created_on`     DATE          NULL,
  `user_id`        BIGINT        NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_applications` (`id`),
  CONSTRAINT `aspire_applications_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_users` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;


DROP TABLE IF EXISTS `aspire_payments`;
CREATE TABLE `aspire_payments` (
  `id`               BIGINT AUTO_INCREMENT,
  `amount`           DECIMAL(9, 2) NULL,
  `monthly_fee`      DECIMAL(9, 2) NULL,
  `interest_rate`    DECIMAL(4, 2) NULL,
  `payment_method`   VARCHAR(30)   NULL,
  `fine`             DECIMAL(9, 2) NULL,
  `fine_description` VARCHAR(30)   NULL,
  `created_on`       DATE          NULL,
  `application_id`   BIGINT        NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_payments` (`id`),
  CONSTRAINT `aspire_payments_application_id` FOREIGN KEY (`application_id`) REFERENCES `aspire_applications` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;

DROP TABLE IF EXISTS `aspire_credit_scores`;
CREATE TABLE `aspire_credit_scores` (
  `id`          BIGINT  AUTO_INCREMENT,
  `name`        DECIMAL(9, 2) NULL,
  `description` VARCHAR(30)   NULL,
  `score`       TINYINT DEFAULT 1,
  `created_on`  DATE          NULL,
  `updated_on`  DATE          NULL,
  `user_id`     BIGINT        NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aspire_credit_scores` (`id`),
  CONSTRAINT `aspire_credit_scores_user_id` FOREIGN KEY (`user_id`) REFERENCES `aspire_users` (`id`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = UTF8;