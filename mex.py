import numpy as np
import time
import os

k = np.random.rand(3,2)
#print(k[0,1])
#print(os.getcwd())
#time.sleep(3)

from dotenv import load_dotenv


# Load environment variables from .env file
load_dotenv()

# Access environment variables
secret_key = os.getenv("SECRET_KEY")
database_url = os.getenv("DATABASE_URL")

# Use the environment variables in your script
# For example:
print(f"Secret key: {secret_key}")
print(f"Database URL: {database_url}")

from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/webhook', methods=['POST'])
def webhook():
    print('poster')
    #time.sleep(100)
    print('poster 2')
    return 'hello poster'
 

@app.route('/try', methods=['GET'])
def first_fet():
    print('logg hello')
    #time.sleep(100)
    print('logg hello 2')
    return 'hello rangers'

if __name__ == '__main__':
    #app.run(host='127.0.0.1', port=5000) # we run in localhost only so use this
    app.run(host='8.217.253.242', port=80)
    # we run python app using gunicorn gunicorn --bind 127.0.0.1:5000 main:app
    # the nginx will auto forward it to port 80 (http)
