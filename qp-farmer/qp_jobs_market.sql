
CREATE TABLE IF NOT EXISTS `qp_jobs_market` (
  `id` varchar(30) NOT NULL,
  `type` varchar(15) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `buyPrice` int NOT NULL,
  `sellPrice` int NOT NULL,
  PRIMARY KEY (`id`,`type`) USING BTREE
);

INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('apple', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('cheese', 'farmer', 0, 100, 50);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('chicken_egg', 'farmer', 0, 100, 50);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('corn_kernel', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('lettuce', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('mango', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('mushroom', 'farmer', 0, 90, 40);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('orange', 'farmer', 0, 100, 40);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('peach', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('pineapple', 'farmer', 0, 100, 40);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('potato', 'farmer', 0, 80, 30);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('pumpkin', 'farmer', 0, 60, 20);
INSERT INTO `qp_jobs_market` (`id`, `type`, `quantity`, `buyPrice`, `sellPrice`) VALUES ('tomate', 'farmer', 0, 80, 30);
