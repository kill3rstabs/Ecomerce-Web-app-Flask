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
	
	cursor.execute("") #using views here
	
	
	return "Hello World"





app.run(host='localhost', port=5000,debug=True)