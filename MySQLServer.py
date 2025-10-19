import mysql.connector
from mysql.connector import Error

def create_database():
    try:
       
        connection = mysql.connector.connect(
            host='localhost',       
            user='root',            
            password='root' 
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: Unable to connect or create database. {e}")

    finally:
        # Clean up connection
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if connection.is_connected():
            connection.close()
            # print("MySQL connection closed.")  # Optional

if __name__ == "__main__":
    create_database()
