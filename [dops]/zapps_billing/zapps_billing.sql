USE `essentialmode`;

CREATE TABLE `zapps_billing` (
  `id` int(11) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `interest` int(11) NOT NULL,
  `interestcount` int(11) NOT NULL DEFAULT 0 COMMENT 'This is the amount of time interest has been added',
  `status` int(11) NOT NULL COMMENT '1 - received, 2 - paid, 3 - delayed, 4 - autopaid, 5 - cancelled',
  `date_added` varchar(255) NOT NULL,
  `date_paid` varchar(255) DEFAULT NULL,
  `lastPayDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `zapps_billing`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `zapps_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;
