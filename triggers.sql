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
    -- Calculate the winrate
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