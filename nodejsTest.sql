-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 01 月 14 日 03:06
-- 伺服器版本： 10.4.27-MariaDB
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `nodejsTest`
--

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL COMMENT '使用者id',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `usermail` varchar(30) NOT NULL COMMENT '郵件',
  `userpwd` varchar(30) NOT NULL COMMENT '密碼',
  `profilePicture` text DEFAULT NULL COMMENT '大頭照',
  `coverPicture` text DEFAULT NULL COMMENT '封面底圖',
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '管理者嗎'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='使用者資料表';

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `username`, `usermail`, `userpwd`, `profilePicture`, `coverPicture`, `isAdmin`) VALUES
(1, 'Christopher Banks', 'a12345@test.com', 'a12345', 'https://randomuser.me/api/portraits/men/61.jpg', 'https://images.pexels.com/photos/743986/pexels-photo-743986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 0),
(2, 'Clarence Romero', 'b12345@test.com', 'b12345', 'https://randomuser.me/api/portraits/men/9.jpg', 'https://images.pexels.com/photos/1023953/pexels-photo-1023953.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '使用者id', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
