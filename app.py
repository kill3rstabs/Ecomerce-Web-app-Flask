# importing module
import cx_Oracle
from flask import Flask,render_template, request,redirect, url_for
# Create a table in Oracle database

app = Flask(__name__)
conn = cx_Oracle.connect('project/project@localhost:1521/xe')

@app.route('/')
def index():
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM USERPRODUCT')
    data = cursor.fetchall()
    return render_template('index.html',data=data)
@app.route('/shop')
def shop():
    cursor = conn.cursor()
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