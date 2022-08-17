USE `essentialmode`;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('boating', 'Boating License')
;

CREATE TABLE `boat_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `boat_categories` (name, label) VALUES
	('boat','Boats')
;

CREATE TABLE `boats` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	PRIMARY KEY (`model`)
);

INSERT INTO `boats` (name, model, price, category) VALUES
	('Yamaha_JetSki', 'fxho', 15000, 'boat'),
        ('gfboat', 'gfboat', 40000, 'boat'),
        ('RapidBoat', 'rboat', 70000, 'boat'),
        ('sr510', 'sr510', 130000, 'boat'),
        ('frauscher16', 'toro2', 47000, 'boat')
;
