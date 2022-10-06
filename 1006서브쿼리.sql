select
    round(avg(sal)) ��ձ޿�
from
    emp;
    
    
select
    ename, sal
from 
    emp
where sal > (select round(avg(sal)) from emp);

select
    *
from
    emp
where sal = (select max(sal) from emp);

select max(sal)
from emp;

-- ������ ���� ���� ����� ���� ��ȸ
select
    *
from
    emp
where sal = (select max(sal) from emp);

-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ
select
    *
from
    emp
where 
    sal > (select round(avg(sal)) from emp) and sal < (select max(sal) from emp);

select *
from
    emp e,
        (select round(avg(sal))avg, max(sal) max from emp) ext
where e.sal > ext.avg and e.sal < ext.max;


-- ���޼����� ���� 10���� ����� ���

select e.*
from (select * from emp order by nvl(sal,0) desc) e
where rownum <= 10;
    
    -- ���� ��
-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);


-- 10�� �μ� ������� ������ ������ ������ �˻�
select ename, job
from emp
where job = any (select job from emp where deptno = 10);

select ename, job
from emp
where job in (select job from emp where deptno = 10);


-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
select empno, ename, job
from emp e1
where exists (select * from emp e2 where e1.empno = e2.mgr); 

select empno, ename, job
from emp
where ename in (select e2.ename from emp e1 left outer join emp e2 on e1.mgr=e2.empno);

-- ���ܻ��
select empno, ename, job
from emp e1
where not exists (select * from emp e2 where e1.empno = e2.mgr);



