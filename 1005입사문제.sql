--1.

select
    s.이름 이름
from
    enroll e full outer join student s
on
    e.학번 = s.학번
    full outer join class c
on
    e.강좌번호 = c.강좌번호
where
    avg(e.학점) >= 3.0;
    
--2.

--##결과
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











  