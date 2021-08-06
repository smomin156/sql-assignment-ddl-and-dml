CREATE TABLE CUSTOMER(
CUSTOMERID NUMERIC(3)NOT NULL PRIMARY KEY,
CUSTOMERNAME VARCHAR(20)NOT NULL
)

CREATE TABLE CATEGORY(
CATEGORYID NUMERIC(3)NOT NULL PRIMARY KEY,
CATEGORYNAME VARCHAR(20)NOT NULL UNIQUE,
DESCRIPTION VARCHAR(20)
)

CREATE TABLE PRODUCT(
PRODUCTID NUMERIC(3)NOT NULL PRIMARY KEY,
PRODUCTNAME VARCHAR(20)NOT NULL,
CATEGORYID NUMERIC(3) NULL REFERENCES CATEGORY(CATEGORYID),
PRICE NUMERIC(10,2) CHECK(PRICE>50),
QUANTITY NUMERIC(3)CHECK(QUANTITY>0)
)

CREATE TABLE ORDERS(
ORDERYEAR NUMERIC(3)NOT NULL,
ORDERMONTH VARCHAR(20)NOT NULL,
ORDERID VARCHAR(20)NOT NULL,
ORDERDATE DATETIME DEFAULT GETDATE(),
PRODUCTID NUMERIC(3)NULL REFERENCES PRODUCT(PRODUCTID),
CUSTOMERID NUMERIC(3)NULL REFERENCES CUSTOMER(CUSTOMERID),
ORDQTY NUMERIC(3) CHECK(ORDQTY>0),
PRIMARY KEY(ORDERYEAR,ORDERMONTH,ORDERID)
)

ALTER TABLE CUSTOMER ADD ADDRESS VARCHAR(20) CHECK(ADDRESS IN('MUMBAI','PUNE','DELHI'))

ALTER TABLE ORDERS DROP CONSTRAINT [PK__ORDERS__29A2FC0FDC6FAF06]
ALTER TABLE ORDERS ALTER COLUMN ORDERYEAR VARCHAR(4) NOT NULL
ALTER TABLE ORDERS ADD CONSTRAINT PK__ORDERS PRIMARY KEY(ORDERYEAR,ORDERMONTH,ORDERID)

ALTER TABLE ORDERS DROP CONSTRAINT PK__ORDERS
ALTER TABLE ORDERS ALTER COLUMN ORDERMONTH NUMERIC(3) NOT NULL
ALTER TABLE ORDERS ADD CONSTRAINT PK__ORDERS PRIMARY KEY(ORDERYEAR,ORDERMONTH,ORDERID)

ALTER TABLE CATEGORY DROP COLUMN DESCRIPTION

INSERT INTO CUSTOMER VALUES(1,'AJAY','MUMBAI')
INSERT INTO CUSTOMER VALUES(2,'CHIRAG','DELHI')
INSERT INTO CUSTOMER VALUES(3,'AMIT','PUNE')

INSERT INTO CATEGORY VALUES(1,'FOOD')
INSERT INTO CATEGORY VALUES(2,'ELECTRONICS')
INSERT INTO CATEGORY VALUES(3,'STATIONARY')

INSERT INTO PRODUCT VALUES(101,'TEA',1,60,100)
INSERT INTO PRODUCT VALUES(102,'PEN',3,80,50)
INSERT INTO PRODUCT VALUES(103,'NOTEBOOK',3,125,200)
INSERT INTO PRODUCT VALUES(104,'COFFEE',1,80,100)
INSERT INTO PRODUCT VALUES(105,'TV',2,15000,5)
INSERT INTO PRODUCT VALUES(106,'WASHINGMACHINE',2,12000,3)

INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2010,1,1,101,2,10) 
INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2010,1,2,104,1,2)
INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2010,2,1,105,3,1)
INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2010,2,2,101,1,5)
INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2010,2,3,106,2,1)
INSERT INTO ORDERS(ORDERYEAR,ORDERMONTH,ORDERID,PRODUCTID,CUSTOMERID,ORDQTY) VALUES(2011,1,1,104,1,2)


SELECT * FROM CUSTOMER
SELECT * FROM CATEGORY
SELECT * FROM PRODUCT
SELECT * FROM ORDERS