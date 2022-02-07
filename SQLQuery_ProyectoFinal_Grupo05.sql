-- Tabla Pais
CREATE TABLE tb_pais
(
Country_ID					int not null CONSTRAINT pk_tb_pais PRIMARY KEY (Country_ID),
Country      				varchar(50) null
)
Go

-- Tabla Producto
CREATE TABLE tb_producto
(
Product_ID					int not null CONSTRAINT pk_tb_producto PRIMARY KEY (Product_ID),
Product 					varchar(50) null
)
Go

-- Tabla Segmento
CREATE TABLE tb_segmento
(
Segment_ID				int not null CONSTRAINT pk_tb_segmento PRIMARY KEY (Segment_ID),
Segment					varchar(50) null
)
Go

-- Tabla Vendedor
CREATE TABLE tb_vendedor
(
Seller_ID					int not null CONSTRAINT pk_tb_vendedor PRIMARY KEY (Seller_ID),
Seller				    varchar(50) null
)
Go

-- Tabla Ventas
CREATE TABLE tb_ventas
(
Order_ID	    int not null CONSTRAINT pk_tb_ventas PRIMARY KEY (Order_ID),
Seller_ID       int not null CONSTRAINT fk_tb_vendedor FOREIGN KEY (Seller_ID) REFERENCES tb_vendedor(Seller_ID),
Country_ID      int not null CONSTRAINT fk_tb_pais FOREIGN KEY (Country_ID) REFERENCES tb_pais(Country_ID),
Segment_ID      int not null CONSTRAINT fk_tb_segmento FOREIGN KEY (Segment_ID) REFERENCES tb_segmento(Segment_ID),
Product_ID      int not null CONSTRAINT fk_tb_producto FOREIGN KEY (Product_ID) REFERENCES tb_producto(Product_ID),
Discount        varchar(20) null,
Units_Sold      decimal(8,2) null,
Manufacturing_Price decimal (6,2) null,
Sale_Price      decimal (6,2) null,
Gross_Sales     decimal(10,2) null,
Discounts       decimal(8,2) null,
Sales           decimal(10,2) null,
COGS            decimal(10,2) null,
Profit          decimal(10,2) null,
Date            Date null,
Month_Number    tinyint null,
Month_Name      varchar(15) null,
Year            char(4) null
)
go


-- Añadir Constraints a la tabla ventas
ALTER TABLE dbo.tb_ventas ADD CONSTRAINT fk_tb_segmento FOREIGN KEY (Segment_ID) REFERENCES tb_segmento(Segment_ID)
ALTER TABLE dbo.tb_ventas ADD CONSTRAINT fk_tb_pais FOREIGN KEY (Country_ID) REFERENCES tb_pais(Country_ID)
ALTER TABLE dbo.tb_ventas ADD CONSTRAINT fk_tb_producto FOREIGN KEY (Product_ID) REFERENCES tb_producto(Product_ID)
ALTER TABLE dbo.tb_ventas ADD CONSTRAINT fk_tb_vendedor FOREIGN KEY (Seller_ID) REFERENCES tb_vendedor(Seller_ID)
go