from flask import Flask,render_template, request,redirect,url_for,session,flash
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = 'sql6.freesqldatabase.com'
app.config['MYSQL_USER'] = 'sql6580129'
app.config['MYSQL_PASSWORD'] = 'prYRa4VKzn'
app.config['MYSQL_DB'] = 'sql6580129'
 
mysql = MySQL(app)

def cartbox(userid):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT userid FROM cart WHERE userid= %s',[userid])
    userid = cursor.fetchone()
    if userid:
        cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
        cartdata = cursor.fetchall()
        #cursor.execute('SELECT quantity FROM cart WHERE (userid= %s AND productid= %s)',(userid,productid))
        totals = []
        for row in cartdata:
            totals.append(row[1]*row[3])
        amount = sum(totals)
        return cartdata,amount

@app.route('/homepage/<string:userid>',methods =["GET","POST"])
def index(userid):
    # cartdata,amount= cartbox(userid)
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT userid FROM cart WHERE userid= %s',[userid])
    id = cursor.fetchone()
    if id:
        cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
        cartdata = cursor.fetchall()
        #cursor.execute('SELECT quantity FROM cart WHERE (userid= %s AND productid= %s)',(userid,productid))
        totals = []
        for row in cartdata:
            totals.append(row[1]*row[3])
        amount = sum(totals)
    else:
        cartdata= []
        amount =0
    cursor.execute("SELECT * FROM userproduct") #using views here
	# cursor.execute("SELECT * FROM CARTITEMS") #cart items to show
    data = cursor.fetchall()
    return render_template('index.html',cartdata=cartdata,data=data,userid=userid,amount=amount)

@app.route('/shop/<string:userid>')
def shop(userid):
    # cartdata= cartbox()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT userid FROM cart WHERE userid= %s',[userid])
    id = cursor.fetchone()
    if id:
        cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
        cartdata = cursor.fetchall()
        #cursor.execute('SELECT quantity FROM cart WHERE (userid= %s AND productid= %s)',(userid,productid))
        totals = []
        for row in cartdata:
            totals.append(row[1]*row[3])
        amount = sum(totals)
    else:
        cartdata= []
        amount =0
    
    cursor.execute('SELECT * FROM userproduct')
    data = cursor.fetchall()
    
    
    return render_template('shop.html',cartdata=cartdata,data=data,userid=userid,amount=amount)



@app.route('/', methods =["GET","POST"])
def login():
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        userid = str(request.form['username'])
        password = request.form['password']
        # Check if account exists using MySQL
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE userid = %s AND password = %s', (userid, password))
        # Fetch one record and return result
        account = cursor.fetchone()
                # If account exists in accounts table in out database
        print(account)
        if account:
            return redirect(url_for('index',userid=userid))
        else:
            flash("Incorrect username/password!", "danger")
    return render_template('login.html')

@app.route('/signin',methods = ["GET","POST"])
def signin():
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        fname = request.form['fname']
        lname = request.form['lname']
        userid = request.form['username']
        email = request.form['email']
        password = request.form['password']
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO user(userid,fname, lname,password,email) VALUES (%s, %s,%s,%s,%s)", (userid,fname, lname,password,email))
        mysql.connection.commit()
        return redirect(url_for('index',userid=userid))
    return render_template('signin.html')


@app.route('/forgetPassword',methods = ["GET","POST"])
def forgetPassword():
    return render_template('forget-password.html')


@app.route('/productSingle/<string:name>/<string:userid>',methods = ["GET","POST"])
def productSingle(name,userid):
    # cartdata= cartbox()
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT userid FROM cart WHERE userid= %s',[userid])
    id = cursor.fetchone()
    if id:
        cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
        cartdata = cursor.fetchall()
        #cursor.execute('SELECT quantity FROM cart WHERE (userid= %s AND productid= %s)',(userid,productid))
        totals = []
        for row in cartdata:
            totals.append(row[1]*row[3])
        amount = sum(totals)
    else:
        cartdata= []
        amount =0
    cursor.execute('SELECT image FROM product WHERE product_name = %s', [name])
    image = cursor.fetchone()

    cursor.execute('SELECT discounted_price FROM product WHERE product_name = %s', [name])
    price = cursor.fetchone()

    cursor.execute('SELECT description FROM product WHERE product_name = %s', [name])
    desc = cursor.fetchone()
    if request.method == 'POST':
        quantity = request.form['quantity']
        
        
        return redirect(url_for('addtocart',name=name,quantity=quantity,userid=userid))
    
    return render_template('product-single.html',cartdata=cartdata,amount=amount,name=name,image=image,price=price,desc=desc,userid=userid)


@app.route('/addtocart/<string:name>/<int:quantity>/<string:userid>',methods=["GET","POST"])
def addtocart(name,quantity,userid):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT productid from product where product_name = %s',[name])
    productid = cursor.fetchone()
    print(productid)
    cursor.execute('INSERT INTO cart(userid, productid,quantity) VALUES (%s,%s,%s) ',(userid,productid,quantity))
    mysql.connection.commit()
    cursor.execute('UPDATE product SET quantity = quantity- %s where (productid =%s and quantity>0)',(quantity,productid))
    mysql.connection.commit()
    productid= int(productid[0])
    # cursor.execute("INSERT INTO cart(productid, quantity) VALUES (%s, %s)", (userid,quantity))
    # mysql.connection.commit()
    return redirect(url_for('cart',userid=userid))


@app.route('/cart/<string:userid>')
def cart(userid):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
    cartdata = cursor.fetchall()
    #cursor.execute('SELECT quantity FROM cart WHERE (userid= %s AND productid= %s)',(userid,productid))
    totals = []
    for row in cartdata:
        totals.append(row[1]*row[3])
    amount = sum(totals)
    cursor.execute("INSERT INTO checkout(userid, amount) VALUES (%s, %s)", (userid,amount))
    mysql.connection.commit()
    
    print(amount)
    
    return render_template('cart.html',cartdata=cartdata,userid=userid,amount=amount)


@app.route('/remove/<string:userid>/<string:name>')
def remove(userid,name):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT productid FROM product WHERE product_name= %s',[name])
    productid = cursor.fetchone()
    cursor.execute('UPDATE cart SET quantity = quantity-1 WHERE (productid = %s AND quantity>0)',[productid])
    mysql.connection.commit()

    cursor.execute('UPDATE product SET quantity = quantity+1 WHERE (productid = %s)',[productid])
    mysql.connection.commit()
    cursor.execute('DELETE FROM cart WHERE quantity=0;')
    mysql.connection.commit()
    
    
    return redirect(url_for('cart',userid=userid))
@app.route('/checkout/<string:userid>',methods=["GET","POST"])
def checkout(userid):
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT product.product_name,product.regular_price,product.image,cart.quantity FROM product,cart WHERE product.productid = cart.productid AND cart.userid = %s',[userid])
    cartdata = cursor.fetchall()
    cursor.execute('SELECT MAX(transactionid) FROM checkout')
    transactionid = cursor.fetchone()
    cursor.execute("SELECT amount FROM checkout WHERE transactionid = %s", [transactionid])
    amount = cursor.fetchone()
    if request.method == 'POST':
        fname = request.form['fname']
        address = request.form['address']
        zipcode = request.form['zipcode']
        city = request.form['city']
        country = request.form['country']
        print(fname)
        cardnumber = request.form['cardnumber']
        expiry = request.form['expiry']
        cvc = request.form['cvc']
        
        cursor = mysql.connection.cursor()
        cursor.execute("UPDATE user set address=%s, zipcode=%s, city= %s, country=%s WHERE userid= %s", (address,zipcode,city,country,userid))
        mysql.connection.commit()
    
        cursor.execute("INSERT INTO payment_details(userid, card_number,expiry,cvc) VALUES (%s, %s,%s,%s)", (userid, cardnumber,expiry,cvc))
        mysql.connection.commit()

        return redirect(url_for('confirmation',userid=userid))
        
        
    return render_template('checkout.html',cartdata=cartdata,amount=amount,userid=userid)

@app.route('/confirmation/<string:userid>')
def confirmation(userid):
    #remove all records from payment details
    cursor = mysql.connection.cursor()
    cursor.execute("TRUNCATE TABLE payment_details")
    mysql.connection.commit()

    cursor.execute("DELETE FROM cart WHERE userid= %s;",[userid])
    mysql.connection.commit()
    return render_template('confirmation.html',userid=userid)
if __name__ == '__main__':
    
    app.run(host='localhost', port=5000,debug=True)



