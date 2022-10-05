--1.

select
    s.�̸� �̸�
from
    enroll e full outer join student s
on
    e.�й� = s.�й�
    full outer join class c
on
    e.���¹�ȣ = c.���¹�ȣ
where
    avg(e.����) >= 3.0;
    
--2.

--##���
--  DEPTNO        DNAME
--------------|---------
--1 30          SALES 
--2 null         null          
--3 10          RESEARCH

CREATE TABLE dept2
(
    deptno number(2),
    dname varchar2(8)
);
create table emp2
(
    deptno number(2),
    dname varchar(4)
);

insert into dept2(deptno,dname)
values(30,'SALES');
insert into emp2(deptno,dname)
values(40,'WARD');


select
    d.deptno,
    d.dname
from
    dept2 d
    full outer join emp2 e
on
    d.deptno = e.deptno;











  