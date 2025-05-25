# 1. What is PostgreSQL ?

#### PostgreSQL is a open source strong `Relation Database Management System` which is used to store, update and manage data. It support many advanced features like `JSON data storage` , `Full Text Search`,`Window Function`,`CTE` include traditional `SQL`.
And its also highly extensible cause we can create `Custom Functions`, `Data Types` and `Operator` by PostgreSQL.
Lets see an Example of creating a table of students using `PostgreSQL`.
### EXAMPLE :
<pre>
  CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    STUDENT_NAME VARCHAR(50)
  )
</pre>

# 2. What is the purpose of a database schema in PostgreSQL?

#### PostgreSQL schema is actually a logical grouping system which helps organizing `Tables`, `Views` , `Functions` etc into different categories.
And it's main purpose is 
1. Organizing
2. Access Control
3. Name Conflict Avoidence

### `Organizing`
It separate the database into different categories using `Schema`.
### Example
`public`,`admin`,`customer` etc

### `Access Control`
Using `Schema` we can control the access. Like in `ADMIN` schema only `ADMIN USERS` can access.

### `Name Conflict Avoidence`
We can keep same named table in the database using separate `Schema`.
### Example
<pre>
  admin.user,
  customer.user
</pre>
Two same named table in two different `schema`.

# 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### Primary Key
Primary key is a column in a specific table that uniquely identifies each row in the table. It ensures that the value of the column must be `UNIQUE` and `NOT NULL`
### Example
<pre>
  CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    STUDENT_NAME VARCHAR(50)
  );
</pre>
#### Here the student_id is Primary key. Each student's row will be recorded using unique ID

### Foreign Key
Foreign key is also a column of a table that references the `PRIMARY KEY` of another table.
### Example
<pre>
  CREATE TABLE enrollments (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES student(student_id),
  course_name VARCHAR(100)
);
</pre>
#### Here `student_id` is the `Foreign Key`. And the foreign key is used to create `RELATION` between one table to another table.
