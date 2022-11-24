from flask import Flask,render_template, request,redirect,url_for
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
    cursor.execute('SELECT * FROM userproduct')
    data = cursor.fetchall()
    return render_template('shop.html',data=data)

@app.route('/login', methods =["GET","POST"])
def login():
    cursor = mysql.connection.cursor()
    if request.method == "POST":
        username = request.form.get('username')
        password = request.form.get('password')
        print(username,password)
        cursor.execute('SELECT userid, password FROM user')
        data = cursor.fetchall()
        print(data)
        # return "Your name is" + email + "Your password is " +password
        for i in range(0,1):
            for j in range(0,15):
                if(data[i][j]==username and data[i][j]==password):
                    return redirect(url_for('/'))
                
        # return redirect(url_for('login'))
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



