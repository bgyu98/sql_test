--1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select empno, ename, job, sal
from emp
where sal >(select sal from emp where ename like 'SCOTT');
?
--2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���

select deptno, min(sal)
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno = 30);
?

--3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
select round(avg(sal),1) ���_�޿�, job
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job );

SELECT s.job, round(min(s.avg),2) min
FROM ( SELECT job, avg(sal) avg FROM emp GROUP BY job ORDER BY avg(sal) ) s
WHERE ROWNUM = 1
GROUP BY s.job;

--4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
select *
from emp
where job like (select job from emp where empno = 7521) and sal > (select sal from emp where empno = 7934);

select job
from emp
where empno like '7521';

select sal
from emp
where empno like '7934'; 
?

--5. 'WARD'�� �μ��� ������ ���� ��� ��� ���
select *
from emp
where deptno like (select deptno from emp where ename like 'WARD')and job like (select job from emp where ename like 'WARD');

select deptno, job
from emp
where ename like 'WARD';
