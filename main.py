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
	cursor.execute("SELECT * FROM userproduct") #using views here
	# cursor.execute("SELECT * FROM CARTITEMS") #cart items to show
	data = cursor.fetchall()
	return render_template('index.html',data=data)

@app.route('/shop')
def shop():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM USERPRODUCT')
    data = cursor.fetchall()
    return render_template('shop.html',data=data)

@app.route('/login', methods =["GET","POST"])
def login():
    # cursor = conn.cursor()
    if request.method == "POST":
        email = request.form.get('email')
        password = request.form.get('password')
        # cursor.execute('SELECT Customer_id, c_pass FROM Customer')
        # data = cursor.fetchall()
        # return "Your name is" + email + "Your password is " +password
        # for row in data:
        #     if(row[0]==email and row[1]==password):
        #         return redirect(url_for('/'))
        #     else:
        #         return redirect(url_for('shop'))
    return render_template('login.html')
@app.route('/signin',methods = ["GET","POST"])
def signin():

    return render_template('signin.html')
@app.route('/forgetPassword',methods = ["GET","POST"])
def forgetPassword():
    return render_template('forget-password.html')
@app.route('/productSingle',methods = ["GET","POST"])
def productSingle():

    return render_template('product-single.html')
@app.route('/cart')
def cart(): 
    return render_template('cart.html')
@app.route('/checkout')
def checkout():
    return render_template('checkout.html')
app.run(host='localhost', port=5000,debug=True)



app.run(host='localhost', port=8080,debug=True)
