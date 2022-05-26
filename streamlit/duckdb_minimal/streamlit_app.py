import streamlit as st
import duckdb

from google.oauth2 import service_account
from google.cloud import storage

credentials = service_account.Credentials.from_service_account_info(
    st.secrets["gcp_service_account"]
)
client = storage.Client(credentials=credentials)

bucket = "fhoffa-lit"

@st.experimental_memo(ttl=600)
def read_file(bucket_name, file_path):
    bucket = client.bucket(bucket_name)
    return bucket.blob(file_path).download_as_string().decode("utf-8")

"These are the contents of the CSV file read from GCS:"
content = read_file(bucket, "myfile.csv")
st.code(content)


@st.experimental_memo(ttl=60000)
def download_to_local_file(bucket_name, file_path, destination):
    bucket = client.bucket(bucket_name)
    return bucket.blob(file_path).download_to_filename(destination)

download_to_local_file(bucket, "out/parquet__0_0_0.snappy.parquet", "temp.parquet")
con = duckdb.connect(database=':memory:')

"These are the contents of the Parquet file parsed with DuckDB:"
df = con.execute("SELECT * FROM read_parquet('temp.parquet')").df()
df

"More on https://medium.com/@hoffa/magic-data-apps-with-snowflake-streamlit-and-duckdb-c0dfc0d1fbe2"
