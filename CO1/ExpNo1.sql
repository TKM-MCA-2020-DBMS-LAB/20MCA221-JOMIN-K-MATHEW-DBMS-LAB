Experiment No 1:
****************************

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| tkmmca             |
+--------------------+
5 rows in set (0.40 sec)

mysql> create database DBMS;
Query OK, 1 row affected (0.23 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| dbms               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| tkmmca             |
+--------------------+
6 rows in set (0.02 sec)

mysql> use dbms;
Database changed

mysql> create table employee(empno int NOT NULL PRIMARY KEY,empname varchar(30)NOT NULL,DOB date NOT NULL,address varchar(50),DOJ date NOT NULL,mobileno BIGINT NOT NULL,deptno int NOT NULL,salary BIGINT NOT NULL);
Query OK, 0 rows affected (0.92 sec)

mysql> create table department(deptno int NOT NULL,deptname varchar(30),location varchar(30));
Query OK, 0 rows affected (1.84 sec)

mysql> show tables;
+----------------+
| Tables_in_dbms |
+----------------+
| department     |
| employee       |
+----------------+
2 rows in set (0.03 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| empno    | int         | NO   | PRI | NULL    |       |
| empname  | varchar(30) | NO   |     | NULL    |       |
| DOB      | date        | NO   |     | NULL    |       |
| address  | varchar(50) | YES  |     | NULL    |       |
| DOJ      | date        | NO   |     | NULL    |       |
| mobileno | bigint      | NO   |     | NULL    |       |
| deptno   | int         | NO   |     | NULL    |       |
| salary   | bigint      | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.24 sec)

mysql> alter table employee add(designation varchar(30));
Query OK, 0 rows affected (1.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| empno       | int         | NO   | PRI | NULL    |       |
| empname     | varchar(30) | NO   |     | NULL    |       |
| DOB         | date        | NO   |     | NULL    |       |
| address     | varchar(50) | YES  |     | NULL    |       |
| DOJ         | date        | NO   |     | NULL    |       |
| mobileno    | bigint      | NO   |     | NULL    |       |
| deptno      | int         | NO   |     | NULL    |       |
| salary      | bigint      | NO   |     | NULL    |       |
| designation | varchar(30) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
9 rows in set (0.12 sec)

mysql> alter table department drop location;
Query OK, 0 rows affected (2.68 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc department;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptno   | int         | NO   |     | NULL    |       |
| deptname | varchar(30) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> drop table employee;
Query OK, 0 rows affected (0.84 sec)

mysql> drop table department;
Query OK, 0 rows affected (2.56 sec)

mysql> show tables;
Empty set (0.01 sec)

mysql> drop database DBMS;
Query OK, 0 rows affected (0.22 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| tkmmca             |
+--------------------+
5 rows in set (0.26 sec)

Querry:
***************

create database DBMS;

show databases;

use dbms;

create table employee(empno int NOT NULL PRIMARY KEY,empname varchar(30)NOT NULL,DOB date NOT NULL,address varchar(50),DOJ date NOT NULL,mobileno BIGINT NOT NULL,deptno int NOT NULL,salary BIGINT NOT NULL);

create table department(deptno int NOT NULL,deptname varchar(30),location varchar(30));

show tables;

desc employee;

alter table employee add(designation varchar(30));

alter table department drop location;

drop table employee;

drop table department;

drop database DBMS;