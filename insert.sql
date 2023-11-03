INSERT INTO user_stats(id, win_rate, wins, loses, kd_ratio, kills, deaths)
VALUES
    (1, 1.1, 110, 100, 1.1, 110, 100),
    (2, 0.9, 90, 100, 0.8, 80, 100),
    (3, 1.5, 150, 100, 1.6, 160, 100);


INSERT INTO users(name, level, rank, currency, stats)
VALUES
    ('SamBridges.-', 260, 'Platinum 3', 10000, 1),
    ('AshMainNoBrain', 110, 'Copper 5', 123433, 2),
    ('VG-Rahkwal', 355, 'Emerald 2', 982475, 3);

INSERT INTO maps(name, is_ranked, difficulty)
VALUES
    ('Nighthaven lab', true, 9),
    ('Stadium', true, 7),
    ('Emerald Palace', true, 7),
    ('Bank', true, 5),
    ('Border', true, 5),
    ('Chalet', true, 6),
    ('Clubhouse', true, 6),
    ('Coastline', true, 5),
    ('Consulate', true, 7),
    ('Hereford base', false, 8),
    ('House', false, 4),
    ('Cafe Dostoevsky', true, 7),
    ('Kanal', true, 7),
    ('Oregon', true, 7),
    ('Outback', true, 7),
    ('Plane', false, 4),
    ('Skyscraper', true, 7),
    ('Theme park', true, 8),
    ('Tower', false, 8),
    ('Villa', true, 8),
    ('Yacht', true, 5);

INSERT INTO map_stats(user_id, map_id, rounds_played, win_rate)
VALUES
    (1, 1, 100, 1.3),
    (1, 2, 100, 1.1),
    (1, 3, 100, 0.9);

INSERT INTO operator(name, speed, armor, team, ability, price, win_rate, rounds_played, difficulty, owner)
VALUES
    ('Sledge', 2, 2, true, 'Tactical Breaching Hammer', 1000, 1.1, 110, 3, 1),
    ('Thatcher', 2, 2, true, 'EMP Grenade', 1000, 1.1, 110, 6, 1),
    ('Ash', 3, 1, true, 'Breaching Rounds', 1000, 1.1, 110, 3, 1),
    ('Thermite', 2, 2, true, 'Exothermic Charge', 1000, 1.1, 110, 6, 1),
    ('Twitch', 2, 2, true, 'Shock Drone', 1000, 1.1, 110, 5, 1),
    ('Montagne', 1, 3, true, 'Extendable Shield', 1000, 1.1, 110, 8, 1),
    ('Glaz', 3, 1, true, 'Flip Sight', 1000, 1.1, 110, 5, 1),
    ('Fuze', 1, 3, true, 'Cluster Charge', 1000, 1.1, 110, 7, 1),
    ('Blitz', 2, 2, true, 'G52-Tactical Shield', 1000, 1.1, 110, 8, 1),
    ('IQ', 3, 1, true, 'Electronics Detector', 1000, 1.1, 110, 9, 1),

    ('Smoke', 2, 2, false, 'Remote Gas Grenade', 1000, 1.1, 110, 8, 1),
    ('Mute', 2, 2, false, 'Signal Disruptor', 1000, 1.1, 110, 6, 1),
    ('Castle', 2, 2, false, 'Armor Panel', 1000, 1.1, 110, 8, 1),
    ('Pulse', 2, 2, false, 'Heartbeat Sensor', 1000, 1.1, 110, 10, 1),
    ('Doc', 1, 3, false, 'Stim Pistol', 1000, 1.1, 110, 4, 1),
    ('Rook', 1, 3, false, 'Armor Pack', 1000, 1.1, 110, 1, 1),
    ('Kapkan', 2, 2, false, 'Entry Denial Device', 1000, 1.1, 110, 4, 1),
    ('Tachanka', 2, 2, false, 'Grenade Launcher', 1000, 1.1, 110, 7, 1),
    ('Jager', 2, 2, false, 'Active Defense System', 1000, 1.1, 110, 6, 1),
    ('Bandit', 3, 1, false, 'Shock Wire', 1000, 1.1, 110, 8, 1);


INSERT INTO secondary_gadget(name, team)
VALUES
    ('Observation Blocker', false),
    ('C4', false),
    ('Impact Grenade', false),
    ('Barbed Wire', false),
    ('Bulletproof Camera', false),
    ('Proximity Alarm', false),
    ('Deployable Shield', false),
    ('Hard Breach Charge', true),
    ('Breach Charge', true),
    ('Frag Grenade', true),
    ('Claymore', true),
    ('Stun Grenade', true),
    ('Smoke Grenade', true),
    ('Impact EMP Grenade', true);

INSERT INTO operator_gadget(operator_id, gadget_id)
VALUES
    (1, 10), (1, 12), (1, 14),
    (2, 11), (2, 9),
    (3, 9), (3, 11),
    (4, 12), (4, 13),
    (5, 13), (5, 11),
    (6, 8), (6, 13), (6, 14),
    (7, 13), (7, 10), (7, 11),
    (8, 9), (8, 10), (8, 13),
    (9, 13), (9, 9),
    (10, 9), (10, 11),
    (11, 4), (11, 6),
    (12, 2), (12, 5),
    (13, 4), (13, 6),
    (14, 2), (14, 7), (14, 1),
    (15, 4), (15, 5),
    (16, 6), (16, 3), (16, 1),
    (17, 3), (17, 2),
    (18, 4), (18, 7),
    (19, 5), (19, 1),
    (20, 4), (20, 2);

INSERT INTO operator_skin(name, price, operator)
VALUES
    ('Six invitational 2019', 20000, 3),
    ('G2 Esports 2019', 30000, 19),
    ('Wind Bastion', 15000, 1);



