--1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
select
    e.ename name, e.job job, d.dname dname, d.loc loc
from  
    emp e, dept d
where
    e.deptno = d.deptno and e.ename like '%L%';
--ǥ�ؾ�
select
    e.ename name, e.job job, d.dname dname, d.loc loc
from  
    emp e inner join dept d
on
    e.deptno = d.deptno and e.ename like '%L%';
?

--2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
select
    e1.ename �̸�, e1.hiredate �Ի���, e2.ename ������_�̸�, e2.hiredate ������_�Ի���
from
    emp e1 inner join emp e2
on
    e1.mgr = e2.empno
    and e1.hiredate < e2.hiredate;
?

?

--3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
select
    e1.empno ���, e1.ename "�����", e2.empno "�Ŵ������", e2.ename "�Ŵ�����"
from
    emp e1 full outer join emp e2
on
    e1.mgr = e2.empno;






