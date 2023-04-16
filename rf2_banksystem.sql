-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 09:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create database rf2_banksystem;
use rf2_banksystem;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rf2_banksystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_number` varchar(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `date_created` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `status` varchar(45) NOT NULL,
  `accounttype` varchar(45) NOT NULL,
  `customers_CIF` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_number`, `balance`, `date_created`, `status`, `accounttype`, `customers_CIF`) VALUES
('AC101', '4000.00', '2023-04-07 15:12:32.098044', 'Active', 'Saving', '12345678901'),
('AC102', '2200.00', '2023-04-07 15:17:09.811762', 'Active', 'Chequing', '23456789012'),
('AC103', '2400.00', '2023-04-07 15:22:41.585089', 'Active', 'Saving', '34567890125'),
('AC104', '14950.56', '2023-04-07 15:22:41.603423', 'Active', 'Chequing', '45678912346'),
('AC105', '49969.00', '2023-04-07 15:22:41.634059', 'Active', 'Saving', '56789123456'),
('AC106', '47028.03', '2023-04-07 15:22:41.653749', 'Active', 'Chequing', '67894561231');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `street number` int(11) NOT NULL,
  `unit_number` varchar(45) DEFAULT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `pin_code` char(6) NOT NULL,
  `address_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`street number`, `unit_number`, `street_name`, `city`, `province`, `Country`, `pin_code`, `address_id`) VALUES
(153, NULL, 'Huber Street', 'Kitchener', 'ON', 'Canada', 'N2A1S2', 'A1'),
(176, '2', 'King Street North', 'Waterloo', 'ON', 'Canada', 'N2J2Y5', 'A2'),
(155, '5', 'Victoria Street', 'KItchener', 'ON', 'Canada', 'N2K4JT', 'A3'),
(457, '7', 'Florida Drive', 'Waterloo', 'NS', 'Canada', 'K3S7KY', 'A4'),
(580, '6', 'Culpepper Drive', 'Downtown', 'Alberta', 'Canada', 'Y3E9UT', 'A5'),
(214, '', 'Maria Street', 'Kitchener', 'ON', 'Canada', 'W2X8O7', 'A6');

-- --------------------------------------------------------

--
-- Table structure for table `cellnumbers`
--

CREATE TABLE `cellnumbers` (
  `cellnumber` varchar(10) NOT NULL,
  `cell_type` varchar(45) NOT NULL,
  `country_code` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cellnumbers`
--

INSERT INTO `cellnumbers` (`cellnumber`, `cell_type`, `country_code`) VALUES
('2262268587', 'Mobile', '+1'),
('3365468974', 'Home', '+1'),
('4567897541', 'Home', '+1'),
('7897895642', 'Office', '+1'),
('7899925647', 'Mobile', '+1'),
('8975684658', 'Office', '+1');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CIF` varchar(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `cellnumbers_cellnumber` varchar(10) NOT NULL,
  `address_address_id` varchar(45) NOT NULL,
  `email_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CIF`, `first_name`, `last_name`, `password`, `cellnumbers_cellnumber`, `address_address_id`, `email_address`) VALUES
('12345678901', 'Foram', 'Patel', 'FP@123', '2262268587', 'A1', 'foram@gmail.com'),
('23456789012', 'Riya', 'Shah', 'RS@456', '3365468974', 'A2', 'riya@gmail.com'),
('34567890125', 'Rohan', 'Patel', 'RP@789', '4567897541', 'A3', 'rohan@gmail.com'),
('45678912346', 'Jiya', 'Joshi', 'JJ@159', '7897895642', 'A4', 'jiya@gmail.com'),
('56789123456', 'Tiya', 'Patel', 'TP@753', '7899925647', 'A5', 'tiya@gmail.com'),
('67894561231', 'Rishi', 'William', 'RW@852', '8975684658', 'A6', 'rishi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `depositID` varchar(45) NOT NULL,
  `deposittime` timestamp(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `accounts_account_number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`depositID`, `deposittime`, `amount`, `accounts_account_number`) VALUES
('D101', '2025-01-19 08:14:07.000000', '2500.00', 'AC101'),
('D102', '2025-01-19 08:14:07.000000', '500.00', 'AC101'),
('D103', '2023-01-17 08:14:07.000000', '1000.00', 'AC103'),
('D104', '2023-01-16 08:14:07.000000', '5000.00', 'AC104'),
('D105', '2023-01-15 08:14:07.000000', '1500.00', 'AC105'),
('D106', '2023-01-14 08:14:07.000000', '1500.00', 'AC106');

--
-- Triggers `deposits`
--
DELIMITER $$
CREATE TRIGGER `updt_after_deposits` AFTER INSERT ON `deposits` FOR EACH ROW update accounts set balance = balance + new.amount where accounts.account_number = new.accounts_account_number
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `withdrawlID` varchar(45) NOT NULL,
  `withdrawltime` timestamp(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `accounts_account_number` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`withdrawlID`, `withdrawltime`, `amount`, `accounts_account_number`) VALUES
('W101', '2025-01-19 08:14:07.000000', '1500.00', 'AC101'),
('W102', '2023-01-18 08:14:07.000000', '200.00', 'AC102'),
('W103', '2023-01-17 08:14:07.000000', '100.00', 'AC103'),
('W104', '2023-01-16 08:14:07.000000', '50.00', 'AC104'),
('W105', '2023-01-15 08:14:07.000000', '100.00', 'AC105'),
('W106', '2023-01-14 08:14:07.000000', '150.00', 'AC106');

--
-- Triggers `withdraw`
--
DELIMITER $$
CREATE TRIGGER `balance_check` BEFORE INSERT ON `withdraw` FOR EACH ROW IF (select balance from  accounts where account_number = NEW.accounts_account_number) < NEW.amount  THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'INSUFFICIENT BALANCE.';
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updt_after_withdrawl` AFTER INSERT ON `withdraw` FOR EACH ROW update accounts set balance = balance - new.amount where accounts.account_number = new.accounts_account_number
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `fk_accounts_customers1_idx` (`customers_CIF`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `cellnumbers`
--
ALTER TABLE `cellnumbers`
  ADD PRIMARY KEY (`cellnumber`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CIF`),
  ADD KEY `fk_customers_cellnumbers1_idx` (`cellnumbers_cellnumber`),
  ADD KEY `fk_customers_address1_idx` (`address_address_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`depositID`),
  ADD KEY `fk_deposits_accounts1_idx` (`accounts_account_number`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`withdrawlID`),
  ADD KEY `fk_withdraw_accounts1_idx` (`accounts_account_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `fk_accounts_customers1` FOREIGN KEY (`customers_CIF`) REFERENCES `customers` (`CIF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `fk_customers_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customers_cellnumbers1` FOREIGN KEY (`cellnumbers_cellnumber`) REFERENCES `cellnumbers` (`cellnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `fk_deposits_accounts1` FOREIGN KEY (`accounts_account_number`) REFERENCES `accounts` (`account_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD CONSTRAINT `fk_withdraw_accounts1` FOREIGN KEY (`accounts_account_number`) REFERENCES `accounts` (`account_number`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
