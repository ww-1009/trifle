from flask import Flask, request, redirect, url_for, flash
from flask import render_template
from flask_bootstrap import Bootstrap
import MySQLdb

app = Flask(__name__)
bootstrap = Bootstrap(app)


@app.route('/updateBook/<bid>', methods=['GET', 'POST'])
def update_book(bid):
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = 'select * from book where Bid = {}'.format(bid)
    cursor.execute(sql)
    answer = cursor.fetchall()
    bookInf = answer[0]
    return render_template('updateBook.html', bookInf=bookInf)


@app.route('/updateBookProcess', methods=['GET', 'POST'])
def update_Book_Process():
    bid = request.form.get('bid')
    bname = request.form.get('bname')
    bpub = request.form.get('bpub')
    sno = request.form.get('sno')
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = 'UPDATE book SET Bname="{}",Bpub="{}",Sno="{}" where Bid="{}"'.format(bname, bpub, int(sno), int(bid))
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("更新失败")
        return redirect(url_for("bookList"))
    return redirect(url_for("bookList"))


@app.route('/addBook')
def add_book():
    return render_template('addBook.html')


@app.route('/addBookProcess', methods=['GET', 'POST'])
def add_book_Process():
    data = []
    bid = request.form.get('bid')
    bname = request.form.get('bname')
    bpub = request.form.get('bpub')
    sno = request.form.get('sno')
    data.append(bid)
    data.append(bname)
    data.append(bpub)
    data.append(sno)
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "insert into Book values (%s, %s, %s, %s)"
        cursor.execute(sql, data)
        connect.commit()
    except Exception as e:
        flash("添加失败")
        return redirect(url_for("bookList"))
    return redirect(url_for("bookList"))


@app.route('/deleteBook/<bid>')
def delete_book(bid):
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "delete from book where Bid={}".format(bid)
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("删除失败")
        return redirect(url_for("bookList"))
    return redirect(url_for("bookList"))


@app.route('/deleteClark/<Cno>')
def delete_Clark(Cno):
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "delete from clark where Cno={}".format(Cno)
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("删除失败")
        return redirect(url_for("clarkList"))
    return redirect(url_for("clarkList"))


@app.route('/deleteDepartment/<Dno>')
def delete_Department(Dno):
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "delete from department where Dno={}".format(Dno)
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("删除失败")
        return redirect(url_for("departmentList"))
    return redirect(url_for("departmentList"))


@app.route('/deleteStudent/<Sno>')
def delete_Student(Sno):
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "delete from student where Sno={}".format(Sno)
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("删除失败")
        return redirect(url_for("studentList"))
    return redirect(url_for("studentList"))


@app.route('/deleteStudentClarkUnion/<ID>')
def delete_StudentClarkUnion(ID):
    try:
        connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
        cursor = connect.cursor()
        sql = "delete from studentclarkunion where ID={}".format(ID)
        cursor.execute(sql)
        connect.commit()
    except Exception as e:
        flash("删除失败")
        return redirect(url_for("studentClarkUnionList"))
    return redirect(url_for("studentClarkUnionList"))


@app.route('/studentClarkUnionList')
def studentClarkUnionList():
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = "select * from studentclarkunion"
    cursor.execute(sql)
    answer = cursor.fetchall()
    connect.close()
    studentClarkUnions = []
    for item in answer:
        studentClarkUnions.append(item)
    return render_template("studentClarkUnionList.html", studentClarkUnions=studentClarkUnions)


@app.route('/studentList')
def studentList():
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = "select * from student"
    cursor.execute(sql)
    answer = cursor.fetchall()
    connect.close()
    students = []
    for item in answer:
        students.append(item)
    return render_template("student_List.html", students=students)


@app.route('/departmentList')
def departmentList():
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = "select * from department"
    cursor.execute(sql)
    answer = cursor.fetchall()
    connect.close()
    departments = []
    for item in answer:
        departments.append(item)
    return render_template("department_List.html", departments=departments)


@app.route('/clarkList')
def clarkList():
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = "select * from clark"
    cursor.execute(sql)
    answer = cursor.fetchall()
    connect.close()
    clarks = []
    for item in answer:
        clarks.append(item)
    return render_template("clark_List.html", clarks=clarks)


@app.route('/bookList')
def bookList():
    connect = MySQLdb.connect(host='127.0.0.1', user='root', passwd='1234', charset='utf8', db='library')
    cursor = connect.cursor()
    sql = "select * from book"
    cursor.execute(sql)
    answer = cursor.fetchall()
    connect.close()
    books = []
    for item in answer:
        books.append(item)
    return render_template("book_List.html", books=books)


@app.route('/')
def homepage():
    return render_template("homepage.html")


if __name__ == '__main__':
    app.run()
    bootstrap.run()
