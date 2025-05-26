# 1. What is PostgreSQL ?

#### PostgreSQL is an open source strong `Relational Database Management System` which is used to store, update and manage data. It supports many advanced features like `JSON data storage`, `Full Text Search`, `Window Function`, `CTE` including traditional `SQL`.  
And it's also highly extensible because we can create `Custom Functions`, `Data Types` and `Operator` by PostgreSQL.  
Let's see an Example of creating a table of students using `PostgreSQL`.

### EXAMPLE :
<pre>
  CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    STUDENT_NAME VARCHAR(50)
  )
</pre>

# 2. What is the purpose of a database schema in PostgreSQL?

#### PostgreSQL schema is actually a logical grouping system which helps organizing `Tables`, `Views`, `Functions` etc into different categories.  
And its main purpose is  
1. Organizing  
2. Access Control  
3. Name Conflict Avoidance  

### `Organizing`  
It separates the database into different categories using `Schema`.

### Example  
`public`, `admin`, `customer` etc

### `Access Control`  
Using `Schema` we can control the access. Like in `ADMIN` schema only `ADMIN USERS` can access.

### `Name Conflict Avoidance`  
We can keep same named table in the database using separate `Schema`.

### Example
<pre>
  admin.user,
  customer.user
</pre>
Two same named tables in two different `schema`.

# 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### Primary Key  
Primary key is a column in a specific table that uniquely identifies each row in the table. It ensures that the value of the column must be `UNIQUE` and `NOT NULL`.

### Example
<pre>
  CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    STUDENT_NAME VARCHAR(50)
  );
</pre>
#### Here the student_id is Primary key. Each student's row will be recorded using unique ID.

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

# 4. What is the difference between the VARCHAR and CHAR data types ?  
Let's discuss about the differences between `CHAR` and `VARCHAR` below :  

### Differences

| Point | CHAR | VARCHAR |
|-----|----|-------|
| 1.  | `CHAR` is a `fixed length data type`. It means it will keep the data length provided by you no matter what the actual data length is. Let's understand by example | `VARCHAR` is `variable length data type`. It means no matter what you declared as length it will take the length of the variable only. Let's see an example |
| 2.  | Fixed-Length | Variable-Length |
| 3. | Fills with spaces if the variable length is less than the declared length | No extra spaces used. Only the variable length |
| 4. | Use it when you know that the length is fixed | Use this when the variable length is not fixed |
| 5. | Example : Suppose we have declared a data type like this `CHAR(20)`. Now if you insert a data in it suppose it's a name which is `SHUVO`. Here we can see that the original length of the name is `5`. But it will take the length `20` because we declared that length is `20`. What it will do is it will fill the rest length with spaces. That's why it is known as `fixed length data type`. | Example : If we declare a data type like `VARCHAR(100)` and then if we insert a data in it as `SHUVO` its length will be `5` because the length of `VARCHAR` is the variable length data type. |

# 5. What are the LIMIT and OFFSET clauses used for in PostgreSQL?

The `LIMIT` and `OFFSET` clauses are used to control the number of rows returned by a query. These are especially useful for pagination, where you want to fetch a specific number of records and possibly skip some.

### LIMIT Clause  
The LIMIT clause is used to specify the maximum number of rows to return from the result set.

### Example 
<pre>
  SELECT * FROM student
  LIMIT 5;
</pre>
#### This will return only 5 rows from the students table.

### OFFSET Clause  
The OFFSET clause is used to skip a specific number of rows before starting to return rows.

### Example
<pre>
  SELECT * FROM student
  OFFSET 5;
</pre>
#### This skips the first 5 rows and returns all the remaining rows.

### LIMIT with OFFSET (Pagination Example):  
You can use both together to implement pagination.

<pre>
  SELECT * FROM student
  LIMIT 5 OFFSET 5;
</pre>
#### This will skip the first 5 rows and then return the next 5 rows, which is perfect for showing page 2 in a paginated view.
