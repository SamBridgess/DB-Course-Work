CREATE OR REPLACE FUNCTION change_primary_weapon(oper_id integer, weapon_id integer)
    RETURNS VOID AS $$
BEGIN
    update operator set selected_primary = weapon_id where operator.id = oper_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_secondary_weapon(oper_id integer, weapon_id integer)
    RETURNS VOID AS $$
BEGIN
    update operator set selected_secondary = weapon_id where operator.id = oper_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_operator_skin(oper_id integer, skin_id integer)
    RETURNS VOID AS $$
BEGIN
    update operator set selected_skin = skin_id where operator.id = oper_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_skin(weapon_id integer, skin_id integer)
    RETURNS VOID AS $$
BEGIN
    update weapon set selected_skin = skin_id where weapon.id = weapon_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_nozzle(weapon_id integer, nozzle_id integer)
    RETURNS VOID AS $$
BEGIN
    update weapon set selected_nozzle = nozzle_id where weapon.id = weapon_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_sight(weapon_id integer, sight_id integer)
    RETURNS VOID AS $$
BEGIN
    update weapon set selected_sight = sight_id where weapon.id = weapon_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_weapon_handle(weapon_id integer, handle_id integer)
    RETURNS VOID AS $$
BEGIN
    update weapon set selected_nozzle = handle_id where weapon.id = weapon_id;
END;
$$ LANGUAGE plpgsql;