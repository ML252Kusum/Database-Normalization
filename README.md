# Database-Normalization
# Introduction:

Database Normalization is the process of organizing a database to reduce redundancy and improve data integrity.The goal is to structure the data so that dependencies are logical and each piece of data is stored in the appropirate place. Here you go through the steps to normalize the dataset to the Third Normal Form (3NF) using SQL Queries.

# STEP 1: FIRST NORMAL FORM (1NF):

To achieve 1NF, ensure that the table has:
  1. Atomic Columns which means each columns contains only one value>
  2. Unique rows which means each row is uniquely identifiable.

# STEP 2: SECOND NORMAL FORM (2NF):

To achieve 2NF, the table must be in 1NF and all non-keys attributes must be fully functionally dependent on the Primary Key.These means we need to removed partial dependencies.
  1. Identify the Primary Key
  2. Remove Partial Dependencies: Attributes that depends only on a part of the Primary Key, should be moved to seperate table.

# 3. THIRD NORMAL FORM (3NF):

To achieve 3NF, the table must be in 2NF and all attributes must be functionally dependent only on the Primary Key.This means removing transitive dependencies.
  1. Identify transitive dependencies
  2. Remove transitive dependencies

Hence by following these steps, we have normalized the dataset to the Third Normal Form(3NF).Ensuring there are no partial or transitive dependencies and improving data integrity.
