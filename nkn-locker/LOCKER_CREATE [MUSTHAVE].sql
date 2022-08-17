-- Exportiere Struktur von Tabelle nknlocker
CREATE TABLE IF NOT EXISTS `nknlocker` (
  `name` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `stash` longtext DEFAULT NULL,
  `renttime` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;