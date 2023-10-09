import requests
import mysql.connector

# DB config
config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost,
    'database': 'mydatabase',
    'raise_on_warnings': True
}

states = ['az', 'ca', 'fl', 'ga', 'il', 'ma', 'or', 'pa', 'tx', 'wa']
api_link = 'https://api.covidtracking.com/v1/states/{}/current.json'

def json_to_sql_type(value):
    if isinstance(value, int):
        return "INT"
    elif isinstance(value, float):
        return "FLOAT"
    elif isinstance(value, str):
        return "TEXT"
    else:
        return "TEXT"

try:
    # Connect to the MySQL database
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()

    single_response = requests.get(api_link.format(states[0]))
    single_response.raise_for_status()
    single_data = single_response.json()

    columns = ', '.join([f"{key} {json_to_sql_type(value)}" for key, value in single_data.items()])
    create_table_query = f"CREATE TABLE IF NOT EXISTS covid_data (id INT AUTO_INCREMENT PRIMARY KEY, {columns});"
    cursor.execute(create_table_query)

    print("Table Created")

    for state in states:
        print(f"Fetching data for state: {state}")

        response = requests.get(api_link.format(state))
        if response.status_code != 200:
            print(f"Failed to fetch data for state {state}. HTTP Status Code: {response.status_code}")
            continue
        data = response.json()

        placeholders = ', '.join(['%s'] * len(data))
        columns = ', '.join(data.keys())
        values = tuple(data.values())

        insert_query = f"INSERT INTO covid_data ({columns}) VALUES ({placeholders});"
        cursor.execute(insert_query, values)

        print(f"Data inserted for state: {state}")

    # Commit the transaction
    conn.commit()

except mysql.connector.Error as err:
    print(f"Error: {err}")
    conn.rollback()

finally:
    cursor.close()
    conn.close()