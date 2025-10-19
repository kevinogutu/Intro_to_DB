#!/usr/bin/env python3
"""
MySQLServer.py
A simple Python script to create 'alx_book_store' database in MySQL.
"""

import mysql.connector

def create_database():
    try:
        # Connect to MySQL server (no specific database)
        connection = mysql.connector.connect(
            host='localhost',       # or your MySQL server host
            user='root',            # replace with your MySQL username
            password='your_password' # replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create the database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error: Unable to connect or create database. {err}")

    finally:
        # Close cursor and connection properly
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()
