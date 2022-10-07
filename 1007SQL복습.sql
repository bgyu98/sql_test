--11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
select ename, job, sal
from emp
where sal in (select sal from emp where ename like 'SCOTT' or ename like 'WARD');

--12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력


select e.ename, e.job
from emp e full outer join dept d
on e.deptno = d.deptno
where d.loc like (select loc from dept where loc like 'CHICAGO');

--13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력

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
