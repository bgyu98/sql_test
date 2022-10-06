--1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���
SELECT
    *
FROM
    emp;
?
select empno, ename, job, sal, (sal*1.15) as New_Salary, (sal*0.15) as Increase
from emp;

--2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
select ename, hiredate, next_day(add_months(hiredate,6),'��') as ������
from emp;
?

--3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���
select ename,hiredate,trunc((sysdate - hiredate)/365) as �ټӳ��, sal ,trunc((sysdate - hiredate)/365)*(sal*12) as �޿��Ѱ�
from emp;

--4.�̸�, ����, �Ի���, �Ի��� ������ ���
select ename, job, hiredate, to_char(hiredate,'day') as �Ի���_����
from emp;
?

?

--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
  -- 10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
select job, deptno, sum(sal) sum, count(*) as �ο���
from emp
where not deptno = 10
group by job, deptno
having job = 'SALESMAN' or job = 'MANAGER';
?

--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
select job, trunc(avg(sal))��ձ޿�, max(sal)�ִ�޿�
from emp
group by job
having avg(sal) >= 2000
order by trunc(avg(sal)) desc;
?

--7. ���� �Ի�⵵ ���� �ο����� ���
select to_char(hiredate,'YYYY')�Ի�⵵, count(*) �ο���
from emp
group by to_char(hiredate,'YYYY');
?
-- 8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)
SELECT
    ceil(rownum/5),
    SUM(sal) �޿��հ�,
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





