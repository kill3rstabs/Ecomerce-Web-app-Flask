use project;
DROP TABLE potlala;
select * from product;
CREATE VIEW userproducts AS
    SELECT 
        product_name,
        description,
        regular_price,
        discounted_price,
        product_review,
        image,
        quantity
    FROM
        product;
select * from userproducts;
update product set image = 'iphone-10.jpeg' where productid = 2;