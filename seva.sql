INSERT INTO Weapon(name, damage, vertical_recoil, horizontal_recoil, mag_capacity, fire_rate, is_primary, difficulty)
VALUES ('Ballistic shield', 0, 0, 0, 0, 0, true, 7),
       ('Le rock shield', 0, 0, 0, 0, 0, true, 5),
       ('Ballistic shield B52', 0, 0, 0, 0, 0, true, 7),
       ('SMG-11', 33, 0.8, 0.5, 16, 1100, false, 6),
       ('P226 Mk 25', 50, 0.5, 0.3, 15, 450, false, 7),
       ('M45 MEUSOC', 58, 0.5, 0.3, 7, 450, false, 6),
       ('5.7 USG', 42, 0.5, 0.3, 20, 450, false, 7),
       ('P9', 45, 0.5, 0.3, 16, 450, false, 7),
       ('LFP586', 78, 0.7, 0.4, 6, 450, false, 8),
       ('GSH-18', 44, 0.5, 0.3, 18, 450, false, 7),
       ('PMM', 63, 0.6, 0.3, 8, 450, false, 7),
       ('P12', 44, 0.5, 0.3, 15, 450, false, 7),
       ('6P41', 46, 0.4, 0.2, 100, 680, true, 4),
       ('G8A1', 37, 0.4, 0.2, 50, 850, false, 4),
       ('HK 417', 69, 0.4, 0.1, 20, 450, true, 6),
       ('OTs-03', 71, 0.6, 0.3, 10, 380, true, 4),
       ('M590A1', 48, 0.7, 0.4, 6, 85, true, 6),
       ('M1014', 32, 0.6, 0.4, 7, 200, true, 6),
       ('SG-CQB', 53, 0.8, 0.4, 6, 85, true, 7),
       ('SASG-12', 49, 0.7, 0.4, 10, 330, true, 7),
       ('M810', 60, 0.9, 0.4, 6, 100, true, 8),
       ('FMG-9', 30, 0.5, 0.3, 30, 800, true, 4),
       ('MP5K', 30, 0.5, 0.3, 30, 800, true, 4),
       ('UMP45', 38, 0.4, 0.2, 25, 600, true, 5),
       ('MP5', 27, 0.5, 0.2, 30, 800, true, 5),
       ('P90', 22, 0.6, 0.3, 50, 970, true, 3),
       ('9x19VSN', 34, 0.6, 0.3, 30, 750, true, 4),
       ('MP7', 30, 0.6, 0.2, 30, 900, true, 5),
       ('L85A2', 47, 0.5, 0.2, 30, 670, true, 3),
       ('AR33', 41, 0.6, 0.2, 25, 749, true, 3),
       ('G36C', 38, 0.5, 0.3, 30, 780, true, 2),
       ('R4-C', 39, 0.6, 0.3, 30, 860, true, 2),
       ('556xi', 47, 0.5, 0.3, 30, 690, true, 3),
       ('F2', 37, 0.6, 0.2, 25, 980, true, 4),
       ('AK-12', 45, 0.5, 0.1, 30, 850, true, 2),
       ('AUG A2', 42, 0.5, 0.4, 30, 720, true, 3),
       ('552 Commando', 48, 0.6, 0.3, 30, 690, true, 3),
       ('416-C Carbine', 38, 0.4, 0.2, 25, 740, true, 3);

INSERT INTO Nozzle(name, horizontal_recoil_reduction, vertical_recoil_reduction)
VALUES ('Silencer', 0, 0),
       ('Muzzle brake', 0.3, 0.3),
       ('Compensator', 0.4, 0.2),
       ('Flash hider', 0.2, 0.4);

INSERT INTO Sight(name, zoom)
VALUES ('Flip Up iron sight', 1),
       ('Diamond Flip Up iron sight', 1),
       ('Heckler Koch iron sight', 1),
       ('Vector foldable iron sight', 1),
       ('MP7 type foldable iron sight', 1),
       ('OTs-03 iron sight', 1),
       ('Russian iron sight', 1),
       ('AR-15 Carry handle iron sight', 1),
       ('Ghost Ring iron sight', 1),
       ('G36 Stock iron sight', 1),
       ('ACOG', 2.5),
       ('.44 Mag Semi-Auto', 3),
       ('Red Dot', 1),
       ('Holographic', 1),
       ('Reflex', 1),
       ('RG15', 1);

INSERT INTO Handle(name, recoil_reduction, ads_speed_boost)
VALUES ('Vertical grip', 0.2, 0),
       ('Angled grip', 0, 0.2),
       ('Laser sight', 0, 0);