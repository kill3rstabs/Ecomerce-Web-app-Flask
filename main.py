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
	# cursor.execute("SELECT * FROM userproducts") #using views here
	cursor.execute("CREATE TABLE Persons (PersonID int,LastName varchar(255),FirstName varchar(255),Address varchar(255),City varchar(255))") #using views here
	data = cursor.fetchall()
	# cursor.execute("SELECT * FROM CARTITEMS") #cart items to show
	# cart = cursor.fetchall()
	return "Hello World"

@app.route('/shop')
def shop():
	
	return render_template('shop.html')



app.run(host='localhost', port=5000,debug=True)
