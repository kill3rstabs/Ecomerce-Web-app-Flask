    CREATE TABLE Cart
    (
        Cart_id VARCHAR(7) NOT NULL,
        PRIMARY KEY(Cart_id)
    );

    CREATE TABLE Customer
    (
        Customer_id VARCHAR(6) NOT NULL,
        c_pass VARCHAR(10) NOT NULL,
        Name VARCHAR(20) NOT NULL,
        Address VARCHAR(20) NOT NULL,
        Pincode NUMBER(6) NOT NULL,
        Phone_number_s number(10) NOT NULL,
        PRIMARY KEY (Customer_id),
        Cart_id VARCHAR(7) NOT NULL,
        FOREIGN KEY(Cart_id) REFERENCES cart(Cart_id)
    );

    CREATE TABLE Seller
    (
        Seller_id VARCHAR(6) NOT NULL,
        s_pass VARCHAR(10) NOT NULL,
        Name VARCHAR(20) NOT NULL,
        Address VARCHAR(10) NOT NULL,
        PRIMARY KEY (Seller_id)
    );

    CREATE TABLE Seller_Phone_num
    (
        Phone_num NUMBER(10) NOT NULL,
        Seller_id VARCHAR(6) NOT NULL,
        PRIMARY KEY (Phone_num, Seller_id),
        FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
        ON DELETE CASCADE
    );

    CREATE TABLE Payment
    (
        payment_id VARCHAR(7) NOT NULL,
        payment_date DATE NOT NULL,
        Payment_type VARCHAR(10) NOT NULL,
        Customer_id VARCHAR(6) NOT NULL,
        Cart_id VARCHAR(7) NOT NULL,
        PRIMARY KEY (payment_id),
        FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
        FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
        total_amount numeric(6)
    );

    CREATE TABLE Product
    (
        Product_id VARCHAR(7) NOT NULL,
        Type VARCHAR(7) NOT NULL,
        Color VARCHAR(15) NOT NULL,
        P_Size VARCHAR(2) NOT NULL,
        Gender CHAR(1) NOT NULL,
        Commission NUMBER(2) NOT NULL,
        Cost NUMBER(5) NOT NULL,
        Quantity NUMBER(2) NOT NULL,
        Seller_id VARCHAR(6),
        Image varchar(20),
        PRIMARY KEY (Product_id),
        FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
        ON DELETE SET NULL
    );

    CREATE TABLE Cart_item
    (
        Quantity_wished NUMBER(1) NOT NULL,
        Date_Added DATE NOT NULL,
        Cart_id VARCHAR(7) NOT NULL,
        Product_id VARCHAR(7) NOT NULL,
        FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
        FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
        Primary key(Cart_id,Product_id)
    );

    alter table Cart_item add purchased varchar(3) default 'NO';
    
    
        insert into Cart values('crt1011');

    insert into Customer values('cid100','ABCM1235','rajat','G-453','632014',9893135876, 'crt1011');

    insert into Seller values('sid100','12345','aman','delhi cmc');
    insert into Seller values('sid101','12346','Aqeel','lahore');
    insert into Seller values('sid102','12347','Noman','karachigu');
    insert into Seller values('sid103','12348','Aslam','Karachisob');

    insert into Product values('pid1001','jeans','red','32','M',10,10005,20,'sid100','SamsungS8.jpeg');
    insert into Product values('pid100','Electro','white','32','U',20,1000,20,'sid103','iphone-10.jpeg');
    insert into Product values('pid1003','Electro','black','32','U',30,1000,20,'sid101','SamsungUHD.jpg');
    insert into Product values('pid1004','Cloth','Gray','32','F',40,2000,20,'sid102','product-2.jpg');
    

    insert into Seller_Phone_num values('9943336206','sid100');

    insert into Cart_item values(3,to_date('10-OCT-1999','dd-mon-yyyy'),'crt1011','pid1001','Y');

    insert into Payment values('pmt1001',to_date('10-OCT-1999','dd-mon-yyyy'),'online','cid100','crt1011',NULL);
    
    SELECT * FROM PRODUCT;
    select * from seller;
    CREATE VIEW USERPRODUCT AS SELECT NAME,COST,QUANTITY,IMAGE FROM PRODUCT;
    
     ALTER TABLE PRODUCT
     RENAME COLUMN TYPE to NAME;
    SELECT * FROM PRODUCT;
    delete product where product_id = 'pid1005';
    UPDATE PRODUCT SET NAME = 'Iphone' WHERE PRODUCT_ID = 'pid1001';
    
    insert into Product values('pid1005','Cloth','blue','32','F',40,2000,20,'sid102','product-3.jpg');
    commit;
    DELETE product where product_id = 'pid1001';