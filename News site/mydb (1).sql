-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2021 at 04:19 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `Id` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `News_title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`Id`, `Username`, `News_title`, `Body`, `Created_at`, `Updated_at`) VALUES
(8, 'savke98', 'Lorem Ipsum 1', 'jos radi', '2021-10-19 20:52:18', '0000-00-00 00:00:00'),
(9, 'savke98', 'Lorem Ipsum 2', 'hello 2', '2021-10-19 20:53:56', '0000-00-00 00:00:00'),
(10, 'savke98', 'Lorem Ipsum 3', 'hello 3', '2021-10-19 20:54:05', '0000-00-00 00:00:00'),
(12, 'marecar95', 'Lorem Ipsum 1', 'komentari', '2021-10-20 16:58:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `News`
--

CREATE TABLE `News` (
  `News_id` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Picture` varchar(255) NOT NULL,
  `TextBody` longtext NOT NULL,
  `shorttext` text DEFAULT NULL,
  `Category` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `News`
--

INSERT INTO `News` (`News_id`, `Title`, `Picture`, `TextBody`, `shorttext`, `Category`) VALUES
(1, 'Lorem Ipsum 1', 'https://i2-prod.walesonline.co.uk/incoming/article14534044.ece/ALTERNATES/s615/1_Facebook-CEO-Mark-Zuckerberg-Testifies-At-House-Hearing.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis. Cras suscipit vitae enim sed laoreet. Aliquam at tortor commodo, imperdiet mi eget, pharetra urna. Suspendisse mollis at nibh sit amet vulputate. Phasellus ac ornare ligula, quis ultricies neque. Vivamus mauris lectus, sodales eget urna in, cursus ullamcorper orci. Nam a est id purus cursus semper. Phasellus lacus enim, tristique sit amet facilisis ut, gravida at eros. Vivamus aliquet porttitor est, finibus consectetur tellus volutpat nec. Donec maximus tempor luctus. Cras vel purus a purus maximus vehicula eget et turpis.\r\n\r\nAliquam enim augue, tincidunt in congue quis, volutpat vitae ex. Nunc risus dolor, consectetur vitae posuere et, posuere ac nulla. Suspendisse vitae posuere sem. Mauris laoreet pellentesque nisl, et faucibus nulla suscipit nec. Nam laoreet aliquet augue, eu accumsan nulla feugiat at. Morbi dolor sem, tincidunt sed placerat vitae, cursus in nulla. Praesent imperdiet, velit faucibus imperdiet tristique, purus turpis dictum tellus, sit amet posuere tellus arcu eget velit. Aenean lacinia est non mi vulputate scelerisque. Morbi sed metus eros. Nunc venenatis efficitur diam, pretium lobortis orci imperdiet eu.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque egestas velit erat. Morbi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis. Cras suscipit vitae enim sed laoreet. Aliquam at tortor commodo, imperdiet mi eget, pharetra urna. Suspendisse mollis at nibh sit amet vulputate. Phasellus ac ornare ligula, quis ultricies neque. Vivamus mauris lectus, sodales eget urna in, cursus ullamcorper orci. Nam a est id purus cursus semper. Phasellus lacus enim, tristique sit amet facilisis ut, gravida at eros. Vivamus aliquet porttitor est, finibus consectetur tellus volutpat nec. Donec maximus tempor luctus. Cras vel purus a purus maximus vehicula eget et turpis.\r\n\r\nAliquam enim augue, tincidunt in congue quis, volutpat vitae ex. Nunc risus dolor, consectetur vitae posuere et, posuere ac nulla. Suspendisse vitae posuere sem. Mauris laoreet pellentesque nisl, et faucibus nulla suscipit nec. Nam laoreet aliquet augue, eu accumsan nulla feugiat at. Morbi dolor sem, tincidunt sed placerat vitae, cursus in nulla. Praesent imperdiet, velit faucibus imperdiet tristique, purus turpis dictum tellus, sit amet posuere tellus arcu eget velit. Aenean lacinia est non mi vulputate scelerisque. Morbi sed metus eros. Nunc venenatis efficitur diam, pretium lobortis orci imperdiet eu.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque egestas velit erat. Morbi et risus pellentesque, gravida tortor a, vestibulum nibh. Quisque fringilla tempor massa vel eleifend. Maecenas sit amet vehicula leo. Sed mattis consequat fringilla. Nulla id tincidunt risus. Mauris tincidunt augue vel nisl scelerisque, id laoreet mi placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ac nisi ultricies lorem convallis laoreet in sit amet nisi. Vestibulum vitae dignissim lacus. Nam auctor neque metus, ut eleifend felis facilisis vitae.\r\n\r\nUt ac arcu vitae justo malesuada aliquam. Donec maximus, sapien nec fringilla laoreet, eros purus cursus quam, vel bibendum neque risus ut augue. Pellentesque vitae condimentum lorem, vel vehicula massa. Proin nibh massa, sodales vitae eleifend at, lobortis quis quam. Sed rutrum ex in velit vestibulum malesuada. Duis tristique sem eu massa dictum ullamcorper. Donec efficitur massa quis malesuada tincidunt. Mauris volutpat mollis ipsum, eu pulvinar ex blandit eget. Vestibulum ac pulvinar mauris. Maecenas aliquam, leo tempus mattis posuere, neque turpis tempor elit, non varius dolor velit at urna. Nam lacinia, libero in euismod placerat, urna diam ullamcorper nisl, feugiat finibus risus nunc non dui.\r\n\r\nEtiam elementum odio lectus, molestie mattis ex bibendum non. Curabitur non dui in leo auctor pulvinar. Nunc nec iaculis est. Fusce sed nisi ipsum. Nullam malesuada eros nec felis molestie, eu laoreet lorem efficitur. Cras lobortis libero id mauris egestas ultricies. Duis vitae mollis ipsum, vitae pulvinar velit.\r\n\r\net risus pellentesque, gravida tortor a, vestibulum nibh. Quisque fringilla tempor massa vel eleifend. Maecenas sit amet vehicula leo. Sed mattis consequat fringilla. Nulla id tincidunt risus. Mauris tincidunt augue vel nisl scelerisque, id laoreet mi placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ac nisi ultricies lorem convallis laoreet in sit amet nisi. Vestibulum vitae dignissim lacus. Nam auctor neque metus, ut eleifend felis facilisis vitae.\r\n\r\nUt ac arcu vitae justo malesuada aliquam. Donec maximus, sapien nec fringilla laoreet, eros purus cursus quam, vel bibendum neque risus ut augue. Pellentesque vitae condimentum lorem, vel vehicula massa. Proin nibh massa, sodales vitae eleifend at, lobortis quis quam. Sed rutrum ex in velit vestibulum malesuada. Duis tristique sem eu massa dictum ullamcorper. Donec efficitur massa quis malesuada tincidunt. Mauris volutpat mollis ipsum, eu pulvinar ex blandit eget. Vestibulum ac pulvinar mauris. Maecenas aliquam, leo tempus mattis posuere, neque turpis tempor elit, non varius dolor velit at urna. Nam lacinia, libero in euismod placerat, urna diam ullamcorper nisl, feugiat finibus risus nunc non dui.\r\n\r\nEtiam elementum odio lectus, molestie mattis ex bibendum non. Curabitur non dui in leo auctor pulvinar. Nunc nec iaculis est. Fusce sed nisi ipsum. Nullam malesuada eros nec felis molestie, eu laoreet lorem efficitur. Cras lobortis libero id mauris egestas ultricies. Duis vitae mollis ipsum, vitae pulvinar velit.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis.', 'Tech'),
(2, 'Lorem Ipsum 2', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/2118/production/_119527480_gettyimages-1229892614.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis. Cras suscipit vitae enim sed laoreet. Aliquam at tortor commodo, imperdiet mi eget, pharetra urna. Suspendisse mollis at nibh sit amet vulputate. Phasellus ac ornare ligula, quis ultricies neque. Vivamus mauris lectus, sodales eget urna in, cursus ullamcorper orci. Nam a est id purus cursus semper. Phasellus lacus enim, tristique sit amet facilisis ut, gravida at eros. Vivamus aliquet porttitor est, finibus consectetur tellus volutpat nec. Donec maximus tempor luctus. Cras vel purus a purus maximus vehicula eget et turpis.\r\n\r\nAliquam enim augue, tincidunt in congue quis, volutpat vitae ex. Nunc risus dolor, consectetur vitae posuere et, posuere ac nulla. Suspendisse vitae posuere sem. Mauris laoreet pellentesque nisl, et faucibus nulla suscipit nec. Nam laoreet aliquet augue, eu accumsan nulla feugiat at. Morbi dolor sem, tincidunt sed placerat vitae, cursus in nulla. Praesent imperdiet, velit faucibus imperdiet tristique, purus turpis dictum tellus, sit amet posuere tellus arcu eget velit. Aenean lacinia est non mi vulputate scelerisque. Morbi sed metus eros. Nunc venenatis efficitur diam, pretium lobortis orci imperdiet eu.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque egestas velit erat. Morbi et risus pellentesque, gravida tortor a, vestibulum nibh. Quisque fringilla tempor massa vel eleifend. Maecenas sit amet vehicula leo. Sed mattis consequat fringilla. Nulla id tincidunt risus. Mauris tincidunt augue vel nisl scelerisque, id laoreet mi placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ac nisi ultricies lorem convallis laoreet in sit amet nisi. Vestibulum vitae dignissim lacus. Nam auctor neque metus, ut eleifend felis facilisis vitae.\r\n\r\nUt ac arcu vitae justo malesuada aliquam. Donec maximus, sapien nec fringilla laoreet, eros purus cursus quam, vel bibendum neque risus ut augue. Pellentesque vitae condimentum lorem, vel vehicula massa. Proin nibh massa, sodales vitae eleifend at, lobortis quis quam. Sed rutrum ex in velit vestibulum malesuada. Duis tristique sem eu massa dictum ullamcorper. Donec efficitur massa quis malesuada tincidunt. Mauris volutpat mollis ipsum, eu pulvinar ex blandit eget. Vestibulum ac pulvinar mauris. Maecenas aliquam, leo tempus mattis posuere, neque turpis tempor elit, non varius dolor velit at urna. Nam lacinia, libero in euismod placerat, urna diam ullamcorper nisl, feugiat finibus risus nunc non dui.\r\n\r\nEtiam elementum odio lectus, molestie mattis ex bibendum non. Curabitur non dui in leo auctor pulvinar. Nunc nec iaculis est. Fusce sed nisi ipsum. Nullam malesuada eros nec felis molestie, eu laoreet lorem efficitur. Cras lobortis libero id mauris egestas ultricies. Duis vitae mollis ipsum, vitae pulvinar velit.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis.', 'Recepies'),
(3, 'Lorem Ipsum 3', 'https://s3-eu-central-1.amazonaws.com/roinvesting-fo-content/Content/Images/Pages/roinvesting-how-to-trade-bitcoin.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis. Cras suscipit vitae enim sed laoreet. Aliquam at tortor commodo, imperdiet mi eget, pharetra urna. Suspendisse mollis at nibh sit amet vulputate. Phasellus ac ornare ligula, quis ultricies neque. Vivamus mauris lectus, sodales eget urna in, cursus ullamcorper orci. Nam a est id purus cursus semper. Phasellus lacus enim, tristique sit amet facilisis ut, gravida at eros. Vivamus aliquet porttitor est, finibus consectetur tellus volutpat nec. Donec maximus tempor luctus. Cras vel purus a purus maximus vehicula eget et turpis.\r\n\r\nAliquam enim augue, tincidunt in congue quis, volutpat vitae ex. Nunc risus dolor, consectetur vitae posuere et, posuere ac nulla. Suspendisse vitae posuere sem. Mauris laoreet pellentesque nisl, et faucibus nulla suscipit nec. Nam laoreet aliquet augue, eu accumsan nulla feugiat at. Morbi dolor sem, tincidunt sed placerat vitae, cursus in nulla. Praesent imperdiet, velit faucibus imperdiet tristique, purus turpis dictum tellus, sit amet posuere tellus arcu eget velit. Aenean lacinia est non mi vulputate scelerisque. Morbi sed metus eros. Nunc venenatis efficitur diam, pretium lobortis orci imperdiet eu.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque egestas velit erat. Morbi et risus pellentesque, gravida tortor a, vestibulum nibh. Quisque fringilla tempor massa vel eleifend. Maecenas sit amet vehicula leo. Sed mattis consequat fringilla. Nulla id tincidunt risus. Mauris tincidunt augue vel nisl scelerisque, id laoreet mi placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis ac nisi ultricies lorem convallis laoreet in sit amet nisi. Vestibulum vitae dignissim lacus. Nam auctor neque metus, ut eleifend felis facilisis vitae.\r\n\r\nUt ac arcu vitae justo malesuada aliquam. Donec maximus, sapien nec fringilla laoreet, eros purus cursus quam, vel bibendum neque risus ut augue. Pellentesque vitae condimentum lorem, vel vehicula massa. Proin nibh massa, sodales vitae eleifend at, lobortis quis quam. Sed rutrum ex in velit vestibulum malesuada. Duis tristique sem eu massa dictum ullamcorper. Donec efficitur massa quis malesuada tincidunt. Mauris volutpat mollis ipsum, eu pulvinar ex blandit eget. Vestibulum ac pulvinar mauris. Maecenas aliquam, leo tempus mattis posuere, neque turpis tempor elit, non varius dolor velit at urna. Nam lacinia, libero in euismod placerat, urna diam ullamcorper nisl, feugiat finibus risus nunc non dui.\r\n\r\nEtiam elementum odio lectus, molestie mattis ex bibendum non. Curabitur non dui in leo auctor pulvinar. Nunc nec iaculis est. Fusce sed nisi ipsum. Nullam malesuada eros nec felis molestie, eu laoreet lorem efficitur. Cras lobortis libero id mauris egestas ultricies. Duis vitae mollis ipsum, vitae pulvinar velit.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam accumsan diam, non lobortis arcu luctus eget. Quisque faucibus aliquam imperdiet. Nunc ut faucibus erat, quis aliquam felis.', 'Tech'),
(26, 'POP smoke', 'https://imagez.tmz.com/image/72/4by3/2020/02/19/724de2994aaa45848243f45c900b8e4e_xl.jpg', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP', 'Recepies');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `idUser` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Pass` varchar(45) NOT NULL,
  `BIO` varchar(255) DEFAULT NULL,
  `Photo` varchar(45) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`idUser`, `Name`, `LastName`, `email`, `Username`, `Pass`, `BIO`, `Photo`, `admin`) VALUES
(1, 'Marko', 'Nikolic', 'marecar@gmail.com', 'marecar95', 'mare', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id mauris lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed venenatis ultricies odio. Duis porttitor ex sit amet dignissim dapibus nam.', NULL, 0),
(2, 'Jovan', 'Savic', 'Savke98@gmail.com', 'Savke98', 'savke', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id mauris lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed venenatis ultricies odio. Duis porttitor ex sit amet dignissim dapibus nam.', NULL, 0),
(3, 'Milos', 'Cekic', 'MilosCekic59@gmail.com', 'cekic1337', 'ceka', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id mauris lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed venenatis ultricies odio. Duis porttitor ex sit amet dignissim dapibus nam.', NULL, 0),
(7, NULL, NULL, 'caocao@mail.com', 'cao', '123', NULL, NULL, 0),
(8, NULL, NULL, 'aaa', 'aaa', 'aaa', NULL, NULL, 0),
(9, NULL, NULL, 'ki', 'kiki', 'ki', NULL, NULL, 0),
(10, NULL, NULL, 'brankosp', 'brankojankovic48@gmail.com', 'password', NULL, NULL, 0),
(11, NULL, NULL, 'milutin', 'milutinmilutin@gmail.com', 'milutin', NULL, NULL, 0),
(12, NULL, NULL, 'hanna', 'hanna@gmail.com', 'hanna1', NULL, NULL, 0),
(13, NULL, NULL, 'hello1234@gmail.com', 'hello', 'hello123', NULL, NULL, 0),
(14, 'Admin', 'Admin', 'admin@adminmail.com', 'Admin', 'admin', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`News_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `Username` (`Username`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`);
ALTER TABLE `User` ADD FULLTEXT KEY `BIO` (`BIO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `News_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
