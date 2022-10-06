select
    round(avg(sal)) 평균급여
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

-- 월급이 가장 많은 사원의 정보 조회
select
    *
from
    emp
where sal = (select max(sal) from emp);

-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회
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


-- 월급순으로 상위 10명의 명단을 출력

select e.*
from (select * from emp order by nvl(sal,0) desc) e
where rownum <= 10;
    
    -- 다중 행
-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);


-- 10번 부서 사원들의 업무와 동일한 직원들 검색
select ename, job
from emp
where job = any (select job from emp where deptno = 10);

select ename, job
from emp
where job in (select job from emp where deptno = 10);


-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
select empno, ename, job
from emp e1
where exists (select * from emp e2 where e1.empno = e2.mgr); 

select empno, ename, job
from emp
where ename in (select e2.ename from emp e1 left outer join emp e2 on e1.mgr=e2.empno);

-- 말단사원
select empno, ename, job
from emp e1
where not exists (select * from emp e2 where e1.empno = e2.mgr);



