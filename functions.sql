CREATE OR REPLACE FUNCTION change_primary_weapon(oper_name varchar(40), weapon_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update operator set selected_primary = (select id from weapon where weapon.name = weapon_name) where operator.name = oper_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_secondary_weapon(oper_name varchar(40), weapon_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update operator set selected_secondary = (select id from weapon where weapon.name = weapon_name) where operator.name = oper_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_operator_skin(oper_name varchar(40), skin_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update operator set selected_skin = (select id from operator_skin where operator_skin.name = skin_name) where operator.name = oper_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_skin(weapon_name varchar(40), skin_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update weapon set selected_skin = (select id from weapon_skin where weapon_name.name = skin_name) where weapon.name = weapon_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_nozzle(weapon_name varchar(40), nozzle_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update weapon set selected_nozzle = (select id from weapon_nozzle where weapon_nozzle.name = nozzle_name) where weapon.name = weapon_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_sight(weapon_name varchar(40), sight_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update weapon set selected_sight = (select id from weapon_sight where weapon_sight.name = sight_name) where weapon.name = weapon_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_handle(weapon_name varchar(40), handle_name varchar(40))
RETURNS VOID AS $$
BEGIN
  update weapon set selected_nozzle = (select id from weapon_handle where weapon_handle.name = handle_name) where weapon.name = weapon_name;
END;
$$ LANGUAGE plpgsql;