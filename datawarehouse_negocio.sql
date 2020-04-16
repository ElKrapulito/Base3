CREATE TABLE dim_time(
    id_time SERIAL PRIMARY KEY,
    dia INT,
    mes INT,
    anio INT,
    hora INT,
    minuto INT,
    segundo INT
);

CREATE TABLE dim_person(
    id_person SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    active BOOLEAN,
    create_date TIMESTAMP,
    last_update TIMESTAMP
);

CREATE TABLE dim_store(
    id_store SERIAL PRIMARY KEY,
    store_city TEXT,
    store_distriict TEXT,
    store_postal TEXT,
    last_update TIMESTAMP
);

CREATE TABLE dim_film(
    id_film SERIAL PRIMARY KEY,
    title TEXT,
    release_year INT,
    film_languge TEXT,
    rental_duration INT,
    rental_rate DECIMAL(4,2),
    length_film INT,
    replacement_cost DECIMAL(5,2),
    rating INT,
    last_update TIMESTAMP
);

CREATE TABLE dim_address(
    id_address SERIAL PRIMARY KEY,
    address1 TEXT,
    address2 TEXT,
    distric TEXT,
    city TEXT,
    postal_code TEXT,
    phone TEXT,
    last_update TIMESTAMP
);

CREATE TABLE fact_table(
    id_rental SERIAL PRIMARY KEY,
    id_time INT,
    id_client INT,
    id_staff INT,
    id_address INT,
    id_film INT,
    id_store INT,
    id_return_date INT,
    amount DECIMAL(5,2),
    rental INT,
    returns_film INT,
    FOREIGN KEY (id_time) REFERENCES dim_time(id_time),
    FOREIGN KEY (id_client) REFERENCES dim_person(id_person),
    FOREIGN KEY (id_staff) REFERENCES dim_person(id_person),
    FOREIGN KEY (id_address) REFERENCES dim_address(id_address),
    FOREIGN KEY (id_film) REFERENCES dim_film(id_film),
    FOREIGN KEY (id_store) REFERENCES dim_store(id_store),
    FOREIGN KEY (id_return_date) REFERENCES dim_time(id_time)
);

-- otro fact table puede ser cuando se relice la paga de una renta.