create index username_index on users using hash(name);
create index operator_name_index on operator using hash(name);
create index weapon_name_index on weapon using hash(name);
create index map_name_index on maps using hash(name);

create index operator_difficulty_index on operator using btree(difficulty);
create index weapon_difficulty_index on weapon using btree(difficulty);
create index maps_rount_played_index on map_stats using btree(rounds_played);