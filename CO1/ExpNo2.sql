Experiment No 2
******************

mysql> insert into employee values(1, "Abhi","1999-04-10","Abhi Bhavan","2020-02-10",9234567890,1,1000,"CEO");
Query OK, 1 row affected (0.25 sec)

mysql> insert into employee values(2,"john","1999-07-11","John Bhavan","2020-03-10",9234347891,1,2000,"COO");
Query OK, 1 row affected (0.18 sec)

mysql> insert into employee values( 3,"Rob","1999-10-10","Rob Bhavan","2020-03-11",9544347891,1,700,"Typist");
Query OK, 1 row affected (0.26 sec)

mysql> insert into employee values( 4,"Jom","1999-06-02","Jom Bhavan","2020-03-12",9534567891,2,3000,"CIO");
Query OK, 1 row affected (0.10 sec)

mysql> insert into employee values(5,"Zack","1999-12-08"," Zack Bhavan","2020-03-15",9531234561,2,4050,"CTO");
Query OK, 1 row affected (0.26 sec)

mysql> insert into department values(1,"Finance","TVM");
Query OK, 1 row affected (0.43 sec)

mysql> insert into department values(1,"Production","TVM");
Query OK, 1 row affected (0.22 sec)

mysql> insert into department values(2,"Accounting","Kochi");
Query OK, 1 row affected (0.18 sec)

mysql> insert into department values(2,"Sales","Kochi");
Query OK, 1 row affected (0.17 sec)

mysql> insert into department values(3,"Engineering","Bengaluru");
Query OK, 1 row affected (0.17 sec)

mysql> select * from employee;
+-------+---------+------------+--------------+------------+------------+--------+--------+-------------+
| empno | empname | DOB        | address      | DOJ        | mobileno   | deptno | salary | designation |
+-------+---------+------------+--------------+------------+------------+--------+--------+-------------+
|     1 | Abhi    | 1999-04-10 | Abhi Bhavan  | 2020-02-10 | 9234567890 |      1 |   1000 | CEO         |
|     2 | john    | 1999-07-11 | John Bhavan  | 2020-03-10 | 9234347891 |      1 |   2000 | COO         |
|     3 | Rob     | 1999-10-10 | Rob Bhavan   | 2020-03-11 | 9544347891 |      1 |    700 | Typist      |
|     4 | Jom     | 1999-06-02 | Jom Bhavan   | 2020-03-12 | 9534567891 |      2 |   3000 | CIO         |
|     5 | Zack    | 1999-12-08 |  Zack Bhavan | 2020-03-15 | 9531234561 |      2 |   4050 | CTO         |
+-------+---------+------------+--------------+------------+------------+--------+--------+-------------+
5 rows in set (0.12 sec)

mysql> select * from department;
+--------+-------------+-----------+
| deptno | deptname    | location  |
+--------+-------------+-----------+
|      1 | Finance     | TVM       |
|      1 | Production  | TVM       |
|      2 | Accounting  | Kochi     |
|      2 | Sales       | Kochi     |
|      3 | Engineering | Bengaluru |
+--------+-------------+-----------+
5 rows in set (0.00 sec)

mysql> select empno,empname from employee where deptno=2;
+-------+---------+
| empno | empname |
+-------+---------+
|     4 | Jom     |
|     5 | Zack    |
+-------+---------+
2 rows in set (0.00 sec)


mysql> select empno,empname,designation,deptno,salary from employee order by salary desc;
+-------+---------+-------------+--------+--------+
| empno | empname | designation | deptno | salary |
+-------+---------+-------------+--------+--------+
|     5 | Zack    | CTO         |      2 |   4050 |
|     4 | Jom     | CIO         |      2 |   3000 |
|     2 | john    | COO         |      1 |   2000 |
|     1 | Abhi    | CEO         |      1 |   1000 |
|     3 | Rob     | Typist      |      1 |    700 |
+-------+---------+-------------+--------+--------+
5 rows in set (0.00 sec)


mysql> select empno,empname from employee where salary between 2000 and 5000;
+-------+---------+
| empno | empname |
+-------+---------+
|     2 | john    |
|     4 | Jom     |
|     5 | Zack    |
+-------+---------+
3 rows in set (0.10 sec)

mysql> select distinct designation from employee;
+-------------+
| designation |
+-------------+
| CEO         |
| COO         |
| Typist      |
| CIO         |
| CTO         |
+-------------+
5 rows in set (0.02 sec)

mysql> select department.deptname,sum(employee.salary) from employee inner join department on  employee.deptno=department.deptno group by employee.deptno;
+------------+----------------------+
| deptname   | sum(employee.salary) |
+------------+----------------------+
| Finance    |                 7400 |
| Accounting |                14100 |
+------------+----------------------+
2 rows in set (0.13 sec)


mysql> update employee set salary=25000 where designation='typist';
Query OK, 1 row affected (0.22 sec)
Rows matched: 1  Changed: 1  Warnings: 0


mysql> select * from employee where designation='typist';
+-------+---------+------------+------------+------------+------------+--------+--------+-------------+
| empno | empname | DOB        | address    | DOJ        | mobileno   | deptno | salary | designation |
+-------+---------+------------+------------+------------+------------+--------+--------+-------------+
|     3 | Rob     | 1999-10-10 | Rob Bhavan | 2020-03-11 | 9544347891 |      1 |  25000 | Typist      |
+-------+---------+------------+------------+------------+------------+--------+--------+-------------+
1 row in set (0.00 sec)


mysql> update employee set mobileno=7863857653 where empname='John';
Query OK, 1 row affected (0.16 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee where empname='John';
+-------+---------+------------+-------------+------------+------------+--------+--------+-------------+
| empno | empname | DOB        | address     | DOJ        | mobileno   | deptno | salary | designation |
+-------+---------+------------+-------------+------------+------------+--------+--------+-------------+
|     2 | john    | 1999-07-11 | John Bhavan | 2020-03-10 | 7863857653 |      1 |   2000 | COO         |
+-------+---------+------------+-------------+------------+------------+--------+--------+-------------+
1 row in set (0.10 sec)


mysql> select department.deptname,sum(employee.salary) from employee inner join department on department.deptno=employee.deptno group by department.deptname having sum(employee.salary)>25000;
+------------+----------------------+
| deptname   | sum(employee.salary) |
+------------+----------------------+
| Finance    |                28000 |
| Production |                28000 |
+------------+----------------------+
2 rows in set (0.09 sec)


Querry;
************

insert into employee values();

insert into department values();

select * from employee;

select * from department;

select empno,empname from employee where deptno=2;

select empno,empname,designation,deptno,salary from employee order by salary desc;

select empno,empname from employee where salary between 2000 and 5000;

select distinct designation from employee;

select distinct designation from employee;

select department.deptname,sum(employee.salary) from employee inner join department on  employee.deptno=department.deptno group by employee.deptno;

update employee set salary=25000 where designation='typist';

select * from employee where salary=25000;

select * from employee where designation='typist';

update employee set mobileno=7863857653 where empname='John';

select * from employee where empname='John';

select department.deptname,sum(employee.salary) from employee inner join department on department.deptno=employee.deptno group by department.deptname having sum(employee.salary)>25000;