from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
import MySQLdb.cursors
from passlib.hash import sha256_crypt
import re
import os

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'scc'
app.config['UPLOAD_FOLDER'] = 'C:\\Users\\rv201\\PycharmProjects\\SCC\\static\\profilePic'
app.config['MAX_CONTENT_LENGTH'] = 16*1024*1024
app.config['SECRET_KEY'] = 'secret_key'


@app.route('/', methods=['GET', 'POST'])
def homepage():
    return render_template("index.html")


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    return render_template("contact.html")


@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'email' in session:
        return redirect("/dashboard")
    else:
        return render_template("login.html")


@app.route('/about', methods=['GET', 'POST'])
def about():
    return render_template("about.html")


@app.route('/courses', methods=['GET', 'POST'])
def courses():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM all_courses")
    results = cursor.fetchall()

    # for row in results:
    #     print("Testing: ", row['Course'])

    return render_template("courses.html", results=results)


# Student Registration and Login Page code
mysql = MySQL(app)


@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''

    if request.method == 'POST' and 'Name' in request.form and 'Email' in request.form:
        Rollno = 'NULL'
        Name = request.form['Name']
        Age = request.form['Age']
        Gender = request.form['Gender']
        Email = request.form['Email']
        Mobile = request.form['Mobile']
        Address = request.form['Address']
        Password = request.form['Password']
        enc_pwd = sha256_crypt.encrypt(Password)
        file = request.files['Photo']
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file.filename)))
        Photo = request.files['Photo'].filename

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM studentreg WHERE Email = % s', (Email,))
        account = cursor.fetchone()
        if account:
            msg = 'Account already exists !'
        elif not re.match(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$', Email):
            msg = 'Invalid email address !'
        elif not re.match(r'^(0|91)?[6-9][0-9]{9}', Mobile):
            msg = 'Invalid Mobile number !'
        elif not re.match(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$', Password):
            msg = 'Invalid Password !'
        else:
            cursor.execute('INSERT INTO studentreg VALUES (% s, % s, % s, % s, % s, % s, % s, % s, % s)', (Rollno, Name, Age, Gender, Email, Mobile, Address, Photo, enc_pwd,))
            mysql.connection.commit()
            return redirect(url_for('login'))
    elif request.method == 'POST':
        msg = 'Please fill out the form !'
    return render_template("register.html", msg=msg)


# Student Login and logout
@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    msg = ''
    results = None
    if 'email' in session:
        return render_template('dashboard.html', msg=msg)
    if request.method == 'POST' and 'Email' in request.form and 'Password' in request.form:
        Email = request.form['Email']
        Password = request.form['Password']

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM studentreg WHERE Email = % s', (Email,))
        pwd = cursor.fetchone()
        db_pwd = pwd['Password']
        profilepic = pwd['Photo']

        # fetch data from db for all_courses table
        cursor.execute("SELECT * FROM all_courses")
        results = cursor.fetchall()

        # fetch data from db for upcoming courses table
        cursor.execute("SELECT * FROM upcoming_courses")
        uc = cursor.fetchall()

        # --------------------
        # if db_pwd and sha256_crypt.verify(Password, db_pwd):
        #     print("Login Successful")
        # --------------------

        if db_pwd and sha256_crypt.verify(Password, db_pwd):
            if sha256_crypt.verify(Password, db_pwd):
                session['loggedin'] = True
                session['roll'] = pwd['Rollno']
                session['name'] = pwd["Name"]
                session['age'] = pwd["Age"]
                session['gender'] = pwd["Gender"]
                session['email'] = pwd["Email"]
                session['contact'] = pwd["Contact"]
                session['address'] = pwd["Address"]

                session['profilepic'] = profilepic

                # fetch data from db for upcoming courses
                Rollno = pwd['Rollno']
                cursor.execute("SELECT * FROM registered_courses WHERE Rollno = %s", (Rollno,))
                reg = cursor.fetchall()

                return render_template('dashboard.html', msg=msg, results=results, uc=uc, reg=reg)
        else:
            msg = 'Please enter correct email / password !'
    return render_template('login.html', msg=msg)


@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('courses'))


if __name__ == "__main__":
    app.run(debug=True)
