create table fact_table(
	id_fact SERIAL PRIMARY KEY,
	id_date int,
	id_sucursal int,
	id_cliente int,
	id_producto int,
	precio_producto numeric
);

create table dim_dates(
	id_date SERIAL PRIMARY KEY,
	year int,
	month int,
	day int,
	hour int
);

create table dim_sucursales(
	id_sucursal SERIAL PRIMARY KEY,
	nombre text
);

create table dim_clientes(
	id_cliente SERIAL PRIMARY KEY,
	nombre text,
	apellidos text,
	ci text
);

create table dim_productos(
	id_producto SERIAL PRIMARY KEY,
	nombre text
);

alter table fact_table add foreign key (id_date) references dim_dates(id_date);
alter table fact_table add foreign key (id_sucursal) references dim_sucursales(id_sucursal);
alter table fact_table add foreign key (id_cliente) references dim_clientes(id_cliente);
alter table fact_table add foreign key (id_producto) references dim_productos(id_producto);