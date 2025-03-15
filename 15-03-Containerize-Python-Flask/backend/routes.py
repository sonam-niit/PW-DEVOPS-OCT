from flask import Flask,request, jsonify
from database import get_db_connection
from models import create_table

app= Flask(__name__)


@app.route('/users', methods=['GET'])
def get_all_users():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * from users')
    users= cursor.fetchall()
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify(users), 200

@app.route('/users', methods=['POST'])
def add_user():
    conn = get_db_connection()
    data = request.json #get data from users 
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (name,email) values (%s,%s)",
                   (data['name'],data['email']))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({"message":"User created Successfully"}), 201

@app.route('/createtable')
def table_create():
    create_table()
    return jsonify({"message":"Table created Successfully"}), 200