from flask import Flask,render_template, request
from flask_mysqldb import MySQL
 
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = 'sql6.freesqldatabase.com'
app.config['MYSQL_USER'] = 'sql6580129'
app.config['MYSQL_PASSWORD'] = 'prYRa4VKzn'
app.config['MYSQL_DB'] = 'sql6580129'
 
mysql = MySQL(app)

@app.route('/')
def index():
	cursor = mysql.connection.cursor()
	
# 	cursor.execute(""" CREATE TABLE IF NOT EXISTS tasks (
#     task_id INT AUTO_INCREMENT,
#     title VARCHAR(255) NOT NULL,
#     start_date DATE,
#     due_date DATE,
#     priority TINYINT NOT NULL DEFAULT 3,
#     description TEXT,
#     PRIMARY KEY (task_id)
# );
	rawsqls = "INSERT INTO `product` ( `sku`, `product_name`, `description`, `image`, `quantity`, `discounted_price`, `regular_price`, `product_rating`, `product_review`) VALUES ( '5009', 'husky dog', 'dog ', 'dog.jpeg', 7, 100.0, 100.0, 0.0, NULL);INSERT INTO `product` ( `sku`, `product_name`, `description`, `image`, `quantity`, `discounted_price`, `regular_price`, `product_rating`, `product_review`) VALUES ( '1111', 'nuclear bomb', 'nuclear bomb', 'bomb.jpeg', 19, 3000.0, 3000.0, 0.0, NULL);INSERT INTO `product` ( `sku`, `product_name`, `description`, `image`, `quantity`, `discounted_price`, `regular_price`, `product_rating`, `product_review`) VALUES ( '8889', 'jelly', 'jelly', 'jelly.jpeg', 13, 1.0, 1.0, 0.0, NULL);"

	
	for result in cursor.execute(rawsqls, multi=True):
		mysql.connection.commit()
	#sing views here
	
	
	return "Hello World"





app.run(host='localhost', port=5000,debug=True)