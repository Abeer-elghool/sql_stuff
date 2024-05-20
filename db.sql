--
-- Table structure for table `userTypes`
--

CREATE TABLE IF NOT EXISTS `userTypes` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(50) NOT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `userTypes` (`type`) VALUES 
('admin'),
('manager');

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NULL,
    `email` VARCHAR(255) NOT NULL,
    `userTypeId` BIGINT NULL,
    FOREIGN KEY (`userTypeId`) REFERENCES userTypes(id)
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `userTypeId`) VALUES
('sam smith', 'sam_smith@gmail.com', 1),
('hamo beka', 'hamo_beka@gmail.com', null);