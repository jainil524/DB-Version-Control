import os
import datetime
import shutil

# Create necessary folders for storing table structures and records
def create_folders(base_path, dbname):
    folders = [
        os.path.join(base_path, dbname, 'Tables/Structure'),
        os.path.join(base_path, dbname, 'Tables/Records')
    ]
    for folder in folders:
        if not os.path.exists(folder):
            os.makedirs(folder)

# Parse SQL File or read SQL Content         
def parse_sql_file(sql_file_path):
    with open(sql_file_path, 'r') as file:
        sql_content = file.read()
    return sql_content

# Extract Table Structures from SQL Content
def extract_table_structures(sql_content):
    tables = {}
    for line in sql_content.split(';'):
        line = line.strip()
        if line.lower().startswith('create table'):
            parts = line.split()
            if len(parts) > 2:
                table_name = parts[2].strip('`"')
                tables[table_name] = line + ';'
    return tables

# Extract Table Data from SQL Content
def extract_table_data(sql_content):
    data = {}
    for line in sql_content.split(';'):
        line = line.strip()
        if line.lower().startswith('insert into'):
            parts = line.split()
            if len(parts) > 2:
                table_name = parts[2].strip('`"')
                if table_name not in data:
                    data[table_name] = []
                data[table_name].append(line + ';')
    return data

def generate_valid_timestamp():
    return datetime.datetime.now().strftime('%Y%m%dT%H%M%S')

def save_structures(base_path, dbname, tables):
    for table_name, table_sql in tables.items():
        table_structure_folder = os.path.join(base_path, dbname, 'Tables/Structure', table_name)
        if not os.path.exists(table_structure_folder):
            os.makedirs(table_structure_folder)
        timestamp = generate_valid_timestamp()
        with open(os.path.join(table_structure_folder, f'{timestamp}.sql'), 'w') as file:
            file.write(table_sql)

def save_data(base_path, dbname, data):
    for table_name, table_data in data.items():
        table_records_folder = os.path.join(base_path, dbname, 'Tables/Records', table_name)
        if not os.path.exists(table_records_folder):
            os.makedirs(table_records_folder)
        timestamp = generate_valid_timestamp()
        with open(os.path.join(table_records_folder, f'{timestamp}.sql'), 'w') as file:
            for record in table_data:
                file.write(record + '\n')

def main(sql_file_path, base_path):
    # Extract database name from the SQL file path
    dbname = os.path.basename(sql_file_path).split('.')[0]
    
    # Step 1: Create Folder Structure
    create_folders(base_path, dbname)
    
    # Step 2: Parse SQL File
    sql_content = parse_sql_file(sql_file_path)
    
    # Step 3: Extract Table Structures
    tables = extract_table_structures(sql_content)
    
    # Step 4: Extract Table Data
    data = extract_table_data(sql_content)
    
    # Step 5: Save Table Structures
    save_structures(base_path, dbname, tables)
    
    # Step 6: Save Table Data
    save_data(base_path, dbname, data)

# Example Usage
if __name__ == '__main__':
    sql_file_path = os.path.abspath('./booksharing.sql')  # Replace with your .sql file path
    
    # Base path where the database folder will be created, one level up from the current script's directory
    base_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))  # Adjust as needed
    
    # Move the SQL file to the base path if needed
    
    # Update the SQL file path to the new location
    sql_file_path = os.path.join(base_path, os.path.basename(sql_file_path))
    
    main(sql_file_path, base_path)
    
    shutil.move(sql_file_path, os.path.join(base_path, os.path.basename(sql_file_path)))
