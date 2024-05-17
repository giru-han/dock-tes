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

