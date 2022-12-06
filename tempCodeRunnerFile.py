if request.method == 'POST'and 'searched' in request.form:
    #     searched = request.form['searched']
    #     cursor = mysql.connection.cursor()
    #     cursor.execute('SELECT product from product WHERE product_name LIKE %s OR author LIKE %s',(searched,searched))
    #     data = cursor.fetchall()
    #     if len(data) == 0: 
    #         cursor.execute("SELECT product_name from product")
    #         conn.commit()
    #         data = cursor.fetchall()
    #     return redirect(url_for('search'),serarched=searched)