--1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
select empno, ename, job, sal
from emp
where sal >(select sal from emp where ename like 'SCOTT');
?
--2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력

select deptno, min(sal)
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno = 30);
?

--3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력
select round(avg(sal),1) 평균_급여, job
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job );

SELECT s.job, round(min(s.avg),2) min
FROM ( SELECT job, avg(sal) avg FROM emp GROUP BY job ORDER BY avg(sal) ) s
WHERE ROWNUM = 1
GROUP BY s.job;

--4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력
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

--5. 'WARD'와 부서와 업무가 같은 사원 명단 출력
select *
from emp
where deptno like (select deptno from emp where ename like 'WARD')and job like (select job from emp where ename like 'WARD');

select deptno, job
from emp
where ename like 'WARD';
