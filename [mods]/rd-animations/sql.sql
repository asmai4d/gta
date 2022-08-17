ALTER TABLE `users` ADD COLUMN `animacje` longtext COLLATE utf8mb4_bin;
ALTER TABLE `users` ADD COLUMN `stylchodzenia` longtext COLLATE utf8mb4_bin;
ALTER TABLE `users` ADD COLUMN `wyraztwarzy` longtext COLLATE utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `ulubioneanimacje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `nazwaanimacji` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
