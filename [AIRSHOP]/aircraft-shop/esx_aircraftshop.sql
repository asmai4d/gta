USE `essentialmode`;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Aircraft License')
;

CREATE TABLE `aircraft_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `aircraft_categories` (name, label) VALUES
	('plane','Planes'),
	('heli','Helicopters')
;

CREATE TABLE `aircrafts` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	PRIMARY KEY (`model`)
);

INSERT INTO `aircrafts` (name, model, price, category) VALUES
	('a29b', 'a29b', 700000, 'plane'),
        ('e110', 'e110', 1200000, 'plane'),
        ('e111', 'e111', 1000000, 'plane'),
        ('e120', 'e120', 1420000, 'plane'),
        ('e312', 'e312', 860000, 'plane'),
	('Buzzard', 'buzzard2', 500000, 'heli'),
	('Frogger', 'frogger', 800000, 'heli'),
	('Havok', 'havok', 250000, 'heli'),
	('Maverick', 'maverick', 750000, 'heli'),
	('Sea Sparrow', 'seasparrow', 815000, 'heli'),
	('SuperVolito', 'supervolito', 1000000, 'heli'),
	('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
	('Swift', 'swift', 1000000, 'heli'),
	('Swift Deluxe', 'swift2', 1250000, 'heli'),
	('Volatus', 'volatus', 1250000, 'heli')
;
