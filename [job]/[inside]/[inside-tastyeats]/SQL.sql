INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(573, 'tastyeats', 0, 'worker', 'Food Provider', 150, '{}', '{}'),

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('tastyeats', 'Tasty Eats', 0),

CREATE TABLE `inside_jobs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET latin1 NOT NULL,
  `experience` int(11) NOT NULL,
  `job` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `inside_jobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `inside_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;