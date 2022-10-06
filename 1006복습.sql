--1. 사원명에 ‘L’자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력
select
    e.ename name, e.job job, d.dname dname, d.loc loc
from  
    emp e, dept d
where
    e.deptno = d.deptno and e.ename like '%L%';
--표준안
select
    e.ename name, e.job job, d.dname dname, d.loc loc
from  
    emp e inner join dept d
on
    e.deptno = d.deptno and e.ename like '%L%';
?

--2. 관리자보다 먼저 입사한 사원에 대해 이름, 입사일, 관리자 이름, 관리자 입사일을 출력
select
    e1.ename 이름, e1.hiredate 입사일, e2.ename 관리자_이름, e2.hiredate 관리자_입사일
from
    emp e1 inner join emp e2
on
    e1.mgr = e2.empno
    and e1.hiredate < e2.hiredate;
?

?

--3. 아래의 결과를 출력 ( 관리자가 없는 KING을 포함하여 모든 사원을 출력 )
select
    e1.empno 사번, e1.ename "사원명", e2.empno "매니저사번", e2.ename "매니저명"
from
    emp e1 full outer join emp e2
on
    e1.mgr = e2.empno;






