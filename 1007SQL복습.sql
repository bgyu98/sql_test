--11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���
select ename, job, sal
from emp
where sal in (select sal from emp where ename like 'SCOTT' or ename like 'WARD');

--12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���


select e.ename, e.job
from emp e full outer join dept d
on e.deptno = d.deptno
where d.loc like (select loc from dept where loc like 'CHICAGO');

--13. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���

select e1.deptno, e1.ename, e1.sal
from emp e1 , (select deptno, trunc(avg(sal)) avg from emp group by deptno) e
where e1.deptno = e.deptno
and e1.sal > e.avg;

SELECT deptno, ename, sal
FROM emp e1
WHERE sal > (SELECT AVG(sal)
FROM emp e2
WHERE e1.deptno = e2.deptno)
ORDER BY deptno;

select avg(sal) from emp;
