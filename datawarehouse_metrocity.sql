
CREATE TABLE dim_network(
    id_net SERIAL PRIMARY KEY,
    status_code TEXT,
    navegador TEXT,
    metodo TEXT,
    direccion_url TEXT,
    protocolo TEXT
);

CREATE TABLE dim_time(
    id_time SERIAL PRIMARY KEY,
    dia INT,
    mes INT,
    anio INT,
    hora INT,
    minuto INT,
    segundo INT
);

CREATE TABLE dim_usuario(
    id_usuario SERIAL PRIMARY KEY,
    ip TEXT,
    sistema_operativo TEXT,
    dispositivos TEXT
);

CREATE TABLE fact_table(
    id_usuario INT,
    id_time INT,
    id_net INT,
    visita INT,
    FOREIGN KEY (id_usuario) REFERENCES dim_usuario(id_usuario),
    FOREIGN KEY (id_time) REFERENCES dim_time(id_time),
    FOREIGN KEY (id_net) REFERENCES dim_network(id_net)
);