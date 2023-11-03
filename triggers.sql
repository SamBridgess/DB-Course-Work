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

CREATE TRIGGER update_winrate_trigger
BEFORE INSERT OR UPDATE OF wins, loses
ON user_stats
FOR EACH ROW
EXECUTE FUNCTION calculate_winrate();