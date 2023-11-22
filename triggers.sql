CREATE OR REPLACE FUNCTION calculate_winrate()
RETURNS TRIGGER AS $$
BEGIN
    -- Calculate the winrate
    IF NEW.loses != 0 THEN
        NEW.win_rate = NEW.wins / NEW.loses;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_winrate_trigger
BEFORE INSERT OR UPDATE OF wins, loses
ON user_stats
FOR EACH ROW
EXECUTE FUNCTION calculate_winrate();


CREATE OR REPLACE FUNCTION calculate_kd()
RETURNS TRIGGER AS $$
BEGIN
    -- Calculate the kd
    IF NEW.deaths != 0 THEN
        NEW.kd_ratio = NEW.kills / NEW.deaths;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_kd_trigger
BEFORE INSERT OR UPDATE OF kills, deaths
ON user_stats
FOR EACH ROW
EXECUTE FUNCTION calculate_kd();

-- MAP_STATS ---------------------------------
CREATE OR REPLACE FUNCTION add_map_to_map_stats()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO map_stats (user_id, map_id, rounds_played)
  SELECT id, NEW.id, 0 FROM users;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER new_map_added
AFTER INSERT ON maps
FOR EACH ROW
EXECUTE FUNCTION add_map_to_map_stats();


CREATE OR REPLACE FUNCTION add_stats_to_map_stats()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO map_stats (user_id, map_id, rounds_played)
  SELECT NEW.id, id, 0 FROM maps;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER new_user_added
AFTER INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION add_stats_to_map_stats();
-------------------------------------------------------

CREATE OR REPLACE FUNCTION add_stats_to_user_stats()
RETURNS TRIGGER AS $$
DECLARE
    ret INTEGER;
BEGIN

  INSERT INTO user_stats(win_rate, wins, loses, kd_ratio, kills, deaths)
  VALUES (0, 0, 0, 0, 0, 0) RETURNING id INTO ret;

  UPDATE users SET stats = ret
  WHERE id = NEW.id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER new_user_added_stats
AFTER INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION add_stats_to_user_stats();
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION add_iron_sight_to_weapon_sight()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO weapon_sight(weapon_id, sight_id)
  SELECT NEW.id, sight.id from sight where sight.name = 'Iron sight';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER new_weapon_added
AFTER INSERT ON weapon
FOR EACH ROW
EXECUTE FUNCTION add_iron_sight_to_weapon_sight();


--sight.id from sight where sight.name = 'Iron sight'


CREATE OR REPLACE FUNCTION add_iron_sight_to_weapon()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE weapon SET selected_sight = (SELECT id FROM sight WHERE sight.name = 'Iron sight') where id = NEW.id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER new_weapon_added_sight
AFTER INSERT ON weapon
FOR EACH ROW
EXECUTE FUNCTION add_iron_sight_to_weapon();