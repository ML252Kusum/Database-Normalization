# Database Normalization is the process of organizing a database to reduce redundancy and improve data integrity.
# Let's go through the steps to normalize a dataset to the Third Normal Form (3NF) using an example.

# STEP 1: FIRST NORMAL FORM (1NF)::
# To achieve 1NF, ensure that table has :
    # 1. Atomic Columns(Each column contains onle one value).
    # 2. Unique Rows(Each row is uniquely identified).
    
# Let's Create Table i.e in 1NF:
create table student_course(Student_Id int primary key,Student_Name varchar(10),Course_Id int ,Course_Name varchar(20),
Instructor_Id int ,Instructor_Name varchar(12));
# HENCE TABLE CREATED SUCCESSFULLY!!

# LET'S INSERTING DATA INTO TABLE:
Insert into student_course(Student_Id,Student_Name,Course_Id,Course_Name,Instructor_Id,Instructor_Name) values(1,"Alice",101,"Maths",1001,
"DR. Smith"),(2,"Bob",102,"English",1002,"Prof. Brown"),(3,"Charlie",101,"Maths",1001,"DR. Smith");
select*from student_course;
#HENCE DATA INSERTED INTO TABLE SUCCESSFULLY!!
# NOTE: WE CAN SEE OUR TABLE IS ALREADY IN 1NF, AS EACH CELL CONTAINS ONLY ONE VALUE, AND THERE ARE IS NO DUPLICATE ROWS.

# STEP 2: SECOND NORMAL FORM (2NF)::
# To achieve 2NF, the table must be in 1NF and all non-keys attributes must be fully functionally dependent on the Primary Key.These means we need to removed partial dependencies.
   # 1. Identify the Primary Key:
   # 2. Remove Partial Dependencies: Attributes that depends only on a part of the Primary Key, should be moved to seperate table.

# Let's create two tables to remove Partial Dependencies:
# 1. Student Table:

Create Table students(Student_Id int primary key,Student_Name varchar(10));
# HENCE STUDENTS TABLE CREATED SUCCESSFULLY !!
Insert into students(Student_Id,Student_Name) values (1,"Alice"),(2,"Bob"),(3,"Charlie");
Select* From students;
# HENCE DATA INSERTED INTO STUDENTS TABLE CREATED SUCCESSFULLY !!

# 2. Course Table:

Create Table course(Course_Id int primary key,Course_Name varchar(10),Instructor_Id int);
# HENCE COURSE TABLE CREATED SUCCESSFULLY!!
Insert into course(Course_Id ,Course_Name,Instructor_Id) values(101,'Maths',1001),(102,'English',1002),(103,'History',1003);
Select* From course;
# HENCE DATA INSERTED INTO COURSE TABLE SUCCESSFULLY !!

# 3. Enrollment Table(That Contains Remaining Data):

Create Table enrollments(Student_Id int, Course_Id int , primary key(Student_Id,Course_Id),foreign key(Student_Id)references students(Student_Id),
foreign key(Course_Id)references course(Course_Id));
# HENCE ENROLLMENTS TABLE CREATED SUCCESSFULLY !!
Insert into enrollments(Student_Id,Course_Id) values(1,101),(2,102),(1,103),(3,101);
Select* From enrollments;
# HENCE DATA INTO ENROLLMENTS TABLE INSERTED SUCCESSFULLY !!

# STEP 3: THIRD NORMAL FORM (3NF):
# To achieve 3NF, the table must be in 2NF and all attributes must be functionally dependent only on the Primary Key.This means removing transitive dependencies.
    # 1. Identify transitive dependencies: In the Course Table, the Instructor_Id determines the Instructor_Name.
    # 2. Remove transitive dependencies: Create a seperate table for Instructors.
    
# 1. Instructors Table:
Create Table Instructors(Instructor_Id int primary key, Instructor_Name varchar(15));
# HENCE INSTRUCTOR TABLE CREATED SUCCESSFULLY !!
Insert into Instructors(Instructor_Id, Instructor_Name) values (1001,'Dr. Smith'),(1002,'Prof. Brown'),(1003,'Dr. Green');
Select* From Instructors;
# HENCE DATA INSERTED INTO INSTRUCTORS TABLE SUCCESSFULLY !!

# 2. Update Course Table to Remove Transitive Dependencies:
Create Table courses(Course_Id int Primary key, Course_Name varchar(10),Instructor_Id int,foreign key(Instructor_Id) references
Instructors(Instructor_Id));
# HENCE NEW COURSE TABLE CREATED SUCCESSFULLY!!
Insert into courses(Course_Id , Course_Name,Instructor_Id) values(101,'Maths',1001),(102,'English',1002),(103,'History',1003);
Select* From course;
# HENCE DATA INSERTED SUCCESSFULLY !!

# FINAL TABLES IN 3NF ARE:
# 1. STUDENTS TABLE:
Select* From students;

# 2. COURSES TABLE:
Select* From courses;

# 3. INSTRUCTORS TABLE:
Select* From instructors;

# 4. ENROLLMENT TABLE:
Select* From enrollments;

# Hence by following these steps, we have normalized the dataset to the Third Normal Form(3NF).
# Ensuring there are no partial or transitive dependencies and improving data integrity.

