require 'sqlite3'

db = SQLite3::Database.new "db.sqlite"
id_type = 'INTEGER'

# db.execute("DROP TABLE book;");
# db.execute("DROP TABLE library;");

sql = <<-SQL 
  CREATE TABLE library (
    id #{id_type} PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
  );
SQL
db.execute sql

sql = <<-SQL 
  CREATE TABLE book (
    id #{id_type} PRIMARY KEY,
    library_id INTEGER,
    title VARCHAR(100),
    author VARCHAR(50),
    pages INTEGER,
    FOREIGN KEY (library_id) REFERENCES library(id)
  );
SQL
db.execute sql