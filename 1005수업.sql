-- 사원테이블에 사원명과 부서테이블에 그사원의 부서명을 출력
SELECT
    e.ename,
    d.dname,
    d.deptno
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno; --조인

-- 내부 조인
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;
    
-- 표준 조인
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e
    inner join dept d
on
    e.deptno = d.deptno;

-- 외부 조인
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e,
    dept d
WHERE
    e.deptno (+) = d.deptno;

-- left outer join
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e
    LEFT OUTER JOIN dept d
ON
    e.deptno = d.deptno;
    
--right outer join
select
    e.ename ename,
    d.dname dname,
    d.deptno deptno
from
    emp e
    RIGHT OUTER JOIN dept d
ON
    e.deptno = d.deptno;

-- full outer join
select
    e.ename ename,
    d.dname dname,
    d.deptno deptno
from
    emp e
    full outer join dept d
on
    e.deptno = d.deptno;
    
    
--사원테이블에 각 사원의 매니저를 조회 >> self join
select
    e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from
    emp e1, emp e2
where
    e1.mgr = e2.empno;
  
-- 외부조인?  
select
    e1.empno e1empno,
    e1.ename e1ename,
    e1.mgr e1mgr,
    e2.empno e2empno,
    e2.ename e2ename
from
    emp e1,
    emp e2
where
    e1.mgr = e2.empno(+);

--  외부조인  
select
    e1.empno e1empno,
    e1.ename e1ename,
    e1.mgr e1mgr,
    e2.empno e2empno,
    e2.ename e2ename
from
    emp e1,
    emp e2
where
    e1.mgr = e2.empno;

-- 집합
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    -- SMITH / ADAMS / JAMES / MILLER
    -- union all -- 합집합
    -- intersect -- 교집합
    minus -- 차집합
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
    -- CLARK / KING / MILLER

-- 조인 연습
--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
select
    e.empno empno,
    e.ename ename,
    e.job ejob,
    e.deptno edeptno,
    d.dname dname,
    d.loc dloc
from
   emp e
   full outer join dept d
on
    e.deptno = d.deptno;
?   

--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력    
select
    e.empno empno,
    e.ename ename,
    e.sal esal,
    d.dname dname,
    d.loc dloc
from
   emp e
   full outer join dept d
on
    e.deptno = d.deptno
where
    job like 'SALESMAN';
?


--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
select
    e.ename ename,
    d.dname dname,
    d.loc dloc
from
    emp e
    full outer join dept d
on
    e.deptno = d.deptno
where
    not e.comm = 0; 
?

--4. 부서별 부서명과 급여 합계를 출력
select
    d.dname dname,
    sum(e.sal) esal
from
    emp e
    full outer join dept d
on
    e.deptno = d.deptno
group by 
    dname;


-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력 
select
      e.ename ename,
      e.job ejob,
      d.dname dname,
      d.loc dloc
from
    emp e
    full outer join dept d
on
    e.deptno = d.deptno
where
    job like 'MANAGER';
?














