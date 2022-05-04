-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 02:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_recipesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double NOT NULL COMMENT 'in $',
  `cust_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author_name`, `image`, `price`, `cust_email`) VALUES
(8, 'Art of Cooking', 'Michel Abi Daoud', 'add.png', 20, 'michossabidaoud@outlook.com'),
(9, 'art', 'Michel Abi Daoud', 'add.png', 20, 'michossabidaoud@outlook.com'),
(10, 'Cook Book', 'John Samaha', 'cookbook.jpg', 15, 'johnsama@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `username`, `password`, `country`) VALUES
(7, 'Michel ad', 'Abidaoud', 'michossabidaoud@outlook.com', '346233', 'drg', '0d1ef3908454fc02b339e3d2f04a7f56ff962d4c0f05b4c23195619164214149', 'brazil'),
(8, 'Michel', 'Abi daoud', 'michosabidaoud@outlook.com', '79178652', 'F4IL', '10b05c446ea776cdcae1ab10f5dcdbad5eeb9250a8b6f62752e6d4e755850fab', 'lebanon'),
(12, 'John', 'Samaha', 'johnsama@outlook.com', '3462335', 'k_Vixxion', 'bfbfe08edb20e274563cd69250f4e1be3c17bbb919a68082b7fb82802e10ffe0', 'lebanon');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `books_id`) VALUES
(1, 7, 8),
(4, 12, 8),
(5, 12, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `ammount_purchased` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `total_price` double NOT NULL COMMENT 'in $',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`ammount_purchased`, `orders_id`, `total_price`, `date`) VALUES
(1, 1, 20, '2022-05-04'),
(2, 3, 40, '2022-05-04'),
(3, 4, 60, '2022-05-04'),
(3, 5, 45, '2022-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `recipe_title` varchar(45) NOT NULL,
  `num_of_servings` int(11) NOT NULL,
  `directions` text NOT NULL,
  `preperation_time` int(11) NOT NULL COMMENT 'in minutes',
  `meal_type` varchar(45) NOT NULL COMMENT 'dinner, lunch, breakfast, snack, etc..',
  `diet` varchar(45) NOT NULL COMMENT 'vegan, healthy, vegetarian, low carb, etc..',
  `cust_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `image`, `ingredients`, `recipe_title`, `num_of_servings`, `directions`, `preperation_time`, `meal_type`, `diet`, `cust_email`) VALUES
(23, 'bg8.jpg', 'dada', 'hamburger', 23, 'adad', 12, 'adad', 'adad', 'michosabidaoud@outlook.com'),
(31, 'bg5.jpg', 'adad', 'hamburger', 1212, 'adad', 12, 'adad', 'adad', 'michossabidaoud@outlook.com'),
(32, 'bg6.jpg', 'aadad', 'ham', 12, 'adad', 12, '1ad', 'add', 'michossabidaoud@outlook.com'),
(33, 'cheese-fries.jpg', 'Potatoes\r\nVegetable Oil\r\nFryer\r\nCheddar Cheese\r\nMozzarella Cheese', 'Fries And Cheese', 2, 'Peel Potatoes\r\nRinse Potatoes In Water For 10 minutes\r\nLet Them Dry\r\nAdd Potatoes To Fryer\r\nAdd Vegetable Oil\r\nAdd Both Cheddar And Mozzarella', 15, 'Snack/Lunch', 'Fat', 'johnsama@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `recipes_in_book`
--

CREATE TABLE `recipes_in_book` (
  `id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  `recipes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipes_in_book`
--

INSERT INTO `recipes_in_book` (`id`, `books_id`, `recipes_id`) VALUES
(32, 8, 22),
(33, 8, 31),
(35, 9, 31),
(36, 9, 32),
(37, 10, 33),
(38, 10, 34);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_creator`
--

CREATE TABLE `recipe_creator` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `recipes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipe_creator`
--

INSERT INTO `recipe_creator` (`id`, `customers_id`, `recipes_id`) VALUES
(26, 8, 23),
(34, 7, 31),
(35, 7, 32),
(36, 12, 33);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes_in_book`
--
ALTER TABLE `recipes_in_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_creator`
--
ALTER TABLE `recipe_creator`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `recipes_in_book`
--
ALTER TABLE `recipes_in_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `recipe_creator`
--
ALTER TABLE `recipe_creator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
