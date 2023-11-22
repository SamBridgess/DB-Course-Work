CREATE TABLE IF NOT EXISTS User_stats
(
    id       SERIAL PRIMARY KEY,
    win_rate NUMERIC NOT NULL DEFAULT (0.0) CHECK (win_rate >= 0.0),
    wins     INTEGER NOT NULL DEFAULT (0) CHECK (wins >= 0),
    loses    INTEGER NOT NULL DEFAULT (0) CHECK (loses >= 0),

    kd_ratio NUMERIC NOT NULL DEFAULT (0) CHECK (kd_ratio >= 0.0),
    kills    INTEGER NOT NULL DEFAULT (0) CHECK (kills >= 0),
    deaths   INTEGER NOT NULL DEFAULT (0) CHECK (deaths >= 0)
);

CREATE TABLE IF NOT EXISTS Users
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(40) NOT NULL UNIQUE,
    level    INTEGER     NOT NULL DEFAULT (1) CHECK (level >= 1),
    rank     VARCHAR(40) NOT NULL DEFAULT ('Copper 5'),
    currency INTEGER     NOt NULL DEFAULT (0) CHECK (currency >= 0),
    stats    INTEGER REFERENCES User_stats (id)
);
CREATE TABLE IF NOT EXISTS Maps
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(40) NOT NULL,
    is_ranked  BOOLEAN     NOT NULL,
    difficulty INTEGER     NOT NULL CHECK (difficulty >= 1 AND difficulty <= 10)
);
CREATE TABLE IF NOT EXISTS Map_stats
(
    user_id       INTEGER REFERENCES Users (id),
    map_id        INTEGER REFERENCES Maps (id),
    rounds_played INTEGER NOT NULL DEFAULT (0) CHECK (rounds_played >= 0)
    --win_rate      NUMERIC NOT NULL DEFAULT (0.0) CHECK (win_rate >= 0.0)
);


CREATE TABLE IF NOT EXISTS Nozzle
(
    id                          SERIAL PRIMARY KEY,
    name                        VARCHAR(40) NOT NULL UNIQUE,
    horizontal_recoil_reduction NUMERIC     NOT NULL DEFAULT 0,
    vertical_recoil_reduction   NUMERIC     NOT NULL DEFAULT 0,
    CONSTRAINT valid_hor_rec_red
        CHECK ( horizontal_recoil_reduction >= 0 AND horizontal_recoil_reduction < 1 ),
    CONSTRAINT valid_ver_rec_red
        CHECK ( vertical_recoil_reduction >= 0 AND vertical_recoil_reduction < 1 )
);

CREATE TABLE IF NOT EXISTS Sight
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    zoom NUMERIC     NOT NULL DEFAULT (1.0) CHECK (zoom >= 1.0 AND zoom <= 3.0)
);
CREATE TABLE IF NOT EXISTS Handle
(
    id               SERIAL PRIMARY KEY,
    name             VARCHAR(40) NOT NULL UNIQUE,
    recoil_reduction NUMERIC     NOT NULL DEFAULT 0,
    ads_speed_boost  NUMERIC     NOT NULL DEFAULT 0
        CONSTRAINT valid_rec_red
            CHECK ( recoil_reduction >= 0 AND recoil_reduction < 1 )
);

CREATE TABLE IF NOT EXISTS Weapon_skin
(
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(40) NOT NULL UNIQUE,
    price  INTEGER     NOT NULL DEFAULT 0
    --weapon INTEGER REFERENCES Weapon (id),
    CONSTRAINT valid_price
        CHECK ( price >= 0 )
);
CREATE TABLE IF NOT EXISTS Weapon
(
    id                SERIAL PRIMARY KEY,
    name              VARCHAR(40) NOT NULL UNIQUE,
    damage            INTEGER     NOT NULL,
    vertical_recoil   NUMERIC     NOT NULL DEFAULT 0,
    horizontal_recoil NUMERIC     NOT NULL DEFAULT 0,
    mag_capacity      NUMERIC     NOT NULL,
    fire_rate         INTEGER     NOT NULL,
    is_primary        BOOLEAN     NOT NULL DEFAULT false,
    difficulty        INTEGER     NOT NULL,
    selected_nozzle   INTEGER references nozzle (id),
    selected_sight    INTEGER references sight (id),
    selected_handle   INTEGER references handle (id),
    selected_skin     INTEGER references Weapon_skin (id)

        CONSTRAINT valid_difficulty
            CHECK ( difficulty <= 10 AND difficulty > 0 ),
    CONSTRAINT valid_hor_rec
        CHECK ( horizontal_recoil < 1 AND horizontal_recoil >= 0 ),
    CONSTRAINT valid_ver_rec
        CHECK ( vertical_recoil < 1 AND vertical_recoil >= 0),
    CONSTRAINT valid_mag_cap
        CHECK ( mag_capacity >= 0 AND mag_capacity <= 150 ),
    CONSTRAINT valid_fire_rate
        CHECK ( fire_rate >= 0 AND fire_rate <= 1200 )
);

ALTER TABLE Weapon_skin ADD COLUMN
    weapon INTEGER REFERENCES Weapon (id);

CREATE TABLE IF NOT EXISTS secondary_gadget
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(40),
    team BOOLEAN
);

CREATE TABLE IF NOT EXISTS Operator_skin
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(40) NOT NULL,
    price    INTEGER     NOT NULL CHECK (price >= 0)
    --operator INTEGER REFERENCES Operator (id)
);
CREATE TABLE IF NOT EXISTS Operator
(
    id                 SERIAL PRIMARY KEY,
    name               VARCHAR(40) NOT NULL,
    speed              INTEGER     NOT NULL CHECK (speed >= 1 AND speed <= 3),
    armor              INTEGER     NOT NULL CHECK (armor >= 1 AND armor <= 3),
    team               BOOLEAN     NOT NULL,
    ability            TEXT        NOT NULL,
    price              INTEGER     NOT NULL CHECK (price >= 0),
    win_rate           NUMERIC     NOT NULL DEFAULT (0.0) CHECK (win_rate >= 0.0),
    rounds_played      INTEGER     NOT NULL DEFAULT (0) CHECK (rounds_played >= 0),
    difficulty         INTEGER     NOT NULL CHECK (difficulty >= 1 AND difficulty <= 10),
    owner              INTEGER REFERENCES Users (id),
    selected_primary   INTEGER references weapon (id),
    selected_secondary INTEGER references weapon (id),
    selected_gadget    INTEGER references secondary_gadget (id),
    selected_skin      INTEGER references operator_skin (id)
);

ALTER TABLE Operator_skin ADD COLUMN
    operator INTEGER REFERENCES Operator(id);



CREATE TABLE IF NOT EXISTS operator_gadget
(
    operator_id INTEGER REFERENCES operator (id),
    gadget_id   INTEGER REFERENCES secondary_gadget (id)
);



CREATE TABLE IF NOT EXISTS weapon_nozzle
(
    weapon_id INTEGER REFERENCES Weapon (id),
    nozzle_id INTEGER REFERENCES Nozzle (id)
);
CREATE TABLE IF NOT EXISTS weapon_sight
(
    weapon_id INTEGER REFERENCES Weapon (id),
    sight_id  INTEGER REFERENCES Sight (id)
);
CREATE TABLE IF NOT EXISTS weapon_handle
(
    weapon_id INTEGER REFERENCES Weapon (id),
    handle_id INTEGER REFERENCES Handle (id)
);


CREATE TABLE IF NOT EXISTS operator_weapon
(
    weapon_id   INTEGER REFERENCES Weapon (id),
    operator_id INTEGER REFERENCES Operator (id)
);