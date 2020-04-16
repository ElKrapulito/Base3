CREATE TABLE dim_cliente(
    id_cliente SERIAL PRIMARY KEY,
    ip TEXT
);

CREATE TABLE dim_protocolo(
    id_protocolo SERIAL PRIMARY KEY,
    desc_protocolo TEXT
);

CREATE TABLE dim_referente(
    id_referente SERIAL PRIMARY KEY,
    desc_referente TEXT
);

CREATE TABLE dim_navegador(
    id_browser SERIAL PRIMARY KEY,
    desc_navegador TEXT,
    version_navegador TEXT
);

CREATE TABLE dim_recurso(
    id_recurso SERIAL PRIMARY KEY,
    desc_recurso TEXT
);

CREATE TABLE dim_fecha(
    id_fecha SERIAL PRIMARY KEY,
    anio INT,
    mes INT,
    desc_mes TEXT,
    semana_anio INT,
    dia INT,
    desc_dia TEXT,
    hora INT,
    minuto INT,
    segundo INT
);

CREATE TABLE dim_resultado(
    id_resultado SERIAL PRIMARY KEY,
    num_resultado INT,
    desc_resultado INT
);

CREATE TABLE dim_so(
    id_so SERIAL PRIMARY KEY,
    desc_so TEXT,
    version_so TEXT
);

CREATE TABLE fact_table(
    id_visita SERIAL PRIMARY KEY,
    id_fecha INT,
    id_recurso INT,
    id_cliente  INT,
    id_resultado INT,
    id_protocolo INT,
    id_referente INT,
    id_browser INT,
    id_so INT,
    numero_visitas INT,
    FOREIGN KEY (id_fecha) REFERENCES dim_fecha(id_fecha),
    FOREIGN KEY (id_recurso) REFERENCES dim_recurso(id_recurso),
    FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (id_resultado) REFERENCES dim_resultado(id_resultado),
    FOREIGN KEY (id_protocolo) REFERENCES dim_protocolo(id_protocolo),
    FOREIGN KEY (id_referente) REFERENCES dim_referente(id_referente),
    FOREIGN KEY (id_browser) REFERENCES dim_navegador(id_browser),
    FOREIGN KEY (id_so) REFERENCES dim_so(id_so)
);