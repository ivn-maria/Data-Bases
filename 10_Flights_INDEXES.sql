-- can't be executed at once

-- 8

CREATE NONCLUSTERED INDEX idx_maker_product
ON Product(maker);

CREATE NONCLUSTERED INDEX idx_type_product
ON Product(type);

-- 9

CREATE UNIQUE CLUSTERED INDEX idx_class_classes
ON Classes(class);

CREATE NONCLUSTERED INDEX idx_country_classes
ON Classes(country);

CREATE CLUSTERED INDEX idx_name_ships
ON Ships(name);

CREATE NONCLUSTERED INDEX idx_class_ships
ON Ships(class);

CREATE UNIQUE CLUSTERED INDEX idx_name_battles
ON Battles(name);

CREATE NONCLUSTERED INDEX idx_ship_outcomes
ON Outcomes(ship);

CREATE NONCLUSTERED INDEX idx_battle_outcomes
ON Outcomes(battle);

-- 10

DROP INDEX idx_maker_product ON Product;

DROP INDEX idx_type_product ON Product;

DROP INDEX idx_class_classes ON Classes;

DROP INDEX idx_country_classes ON Classes;

DROP INDEX idx_name_ships ON Ships;

DROP INDEX idx_class_ships ON Ships;

DROP INDEX idx_name_battles ON Battles;

DROP INDEX idx_ship_outcomes ON Outcomes;

DROP INDEX idx_battle_outcomes ON Outcomes;