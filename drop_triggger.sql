DROP TRIGGER update_kd_trigger on user_stats cascade;
DROP TRIGGER new_map_added on maps cascade;
DROP TRIGGER new_user_added on users cascade;
DROP TRIGGER new_user_added_stats on users cascade;

DROP FUNCTION calculate_kd() cascade;
DROP FUNCTION calculate_winrate() cascade;
DROP FUNCTION add_map_to_map_stats() cascade;
DROP FUNCTION add_stats_to_map_stats() cascade;
DROP FUNCTION add_stats_to_user_stats() cascade;