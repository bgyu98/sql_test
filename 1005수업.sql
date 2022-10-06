-- ������̺� ������ �μ����̺� �׻���� �μ����� ���
SELECT
    e.ename,
    d.dname,
    d.deptno
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno; --����

-- ���� ����
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;
    
-- ǥ�� ����
SELECT
    e.ename  ename,
    d.dname  dname,
    d.deptno deptno
FROM
    emp  e
    inner join dept d
on
    e.deptno = d.deptno;

-- �ܺ� ����
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
    
    
--������̺� �� ����� �Ŵ����� ��ȸ >> self join
select
    e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from
    emp e1, emp e2
where
    e1.mgr = e2.empno;
  
-- �ܺ�����?  
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

--  �ܺ�����  
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

-- ����
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    -- SMITH / ADAMS / JAMES / MILLER
    -- union all -- ������
    -- intersect -- ������
    minus -- ������
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
    -- CLARK / KING / MILLER

-- ���� ����
--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
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

--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���    
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


--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
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

--4. �μ��� �μ���� �޿� �հ踦 ���
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


-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ��� 
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














