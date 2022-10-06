--1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력
SELECT
    *
FROM
    emp;
?
select empno, ename, job, sal, (sal*1.15) as New_Salary, (sal*0.15) as Increase
from emp;

--2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
select ename, hiredate, next_day(add_months(hiredate,6),'월') as 월요일
from emp;
?

--3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력
select ename,hiredate,trunc((sysdate - hiredate)/365) as 근속년수, sal ,trunc((sysdate - hiredate)/365)*(sal*12) as 급여총계
from emp;

--4.이름, 업무, 입사일, 입사한 요일을 출력
select ename, job, hiredate, to_char(hiredate,'day') as 입사한_요일
from emp;
?

?

--5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 
  -- 10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
select job, deptno, sum(sal) sum, count(*) as 인원수
from emp
where not deptno = 10
group by job, deptno
having job = 'SALESMAN' or job = 'MANAGER';
?

--6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
select job, trunc(avg(sal))평균급여, max(sal)최대급여
from emp
group by job
having avg(sal) >= 2000
order by trunc(avg(sal)) desc;
?

--7. 같은 입사년도 별로 인원수를 출력
select to_char(hiredate,'YYYY')입사년도, count(*) 인원수
from emp
group by to_char(hiredate,'YYYY');
?
-- 8. 5개씩 급여합계와 인원수를 출력 (rownum이용)
SELECT
    ceil(rownum/5),
    SUM(sal) 급여합계,
    COUNT(*)
FROM
    emp
group by
    ceil (ROWNUM /5);

-- 9.
SELECT
    *
FROM
    emp;

SELECT
    COUNT('CLERK')
FROM
    emp;

-- 10.
SELECT
    job,
    like(deptno, 10)
FROM
    emp;





