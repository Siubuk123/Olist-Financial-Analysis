import os
import sys
import pandas as pd
from sqlalchemy import create_engine

script_dir = os.path.dirname(os.path.abspath(__file__))
project_dir = os.path.dirname(script_dir)
data_folder = os.path.join(project_dir, "data")

# Zastąpiona jednolinijkowa pętla klasyczną pętlą for
files = []
for f in os.listdir(data_folder):
    if f.endswith(".csv"):
        files.append(f)

connection_string = (
    "mssql+pyodbc://localhost/Olist_Finance"
    "?driver=ODBC+Driver+17+for+SQL+Server"
    "&trusted_connection=yes"
    "&TrustServerCertificate=yes"
)

engine = create_engine(connection_string, fast_executemany=True)

for file in files:
    table_name = file.replace("olist_", "").replace("_dataset.csv", "").replace(".csv", "")
    file_path = os.path.join(data_folder, file)
    
    print(f"Table: {table_name}")
    try:
        df = pd.read_csv(file_path)
        df.to_sql(name=table_name, con=engine, if_exists="replace", index=False, chunksize=1000)
        print(f"{table_name} ({len(df)} lines)")
    except Exception as e:
        print(f"Error {table_name}: {e}")