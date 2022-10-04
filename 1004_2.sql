-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���

select ename, sal, round (sal/12, -1) as wolgup
from emp;



-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
select ename, sal, trunc(sal*0.033,-1) as tax
from emp;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
select * from emp;

select empno, ename, LOWER(job)as job
from emp;

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
select empno, INITCAP(ename) as ename , INITCAP(job) as job
from emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
select empno, ename, job, sal, deptno
from emp
where (substr(ename,1,1) > 'K' and substr(ename,1,1) < 'Y') order by ename asc;


-- �̸��� 5���� �̻��� ������� ���
select *
from emp
where length(ename) >=5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
select RPAD(ename,15,'*') as ename
from emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
select LPAD(sal,10,'-') as sal
from emp;

select name, jumin ,substr(jumin, 8, 1) gender,
                    substr(jumin,1,2) birth_year
from info_tab;

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
select TRANSLATE(sal,1234567890,'���̻�����ĥ�ȱ���') as sal, sal
from emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
select REPLACE(sal, 0, '$')as sal
from emp;


----
select '-' || trim(' �̼��� ') || '-' as col1, 
       '-' || ltrim(' �̼��� ') || '-' as col2, 
       '-' || rtrim(' �̼��� ') || '-' as col3
from dual;

select sysdate
from dual;

select '-*-' as cl
from dual;

--- *********
select replace('��      ��         ��',' ','') as ename
from dual;



select * from emp;
-- ������� �ٹ��� ���� ���� ��� ������ ���
select ename , trunc(sysdate - hiredate) as hiredate1
from emp
order by hiredate desc;

select ename, hiredate
from emp
order by sysdate-hiredate desc nulls last;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select ename, trunc((sysdate-hiredate)/7) as �ټ��� ,trunc(sysdate-hiredate) as �ټ���,
                trunc(sysdate - add_months(hiredate, months_between(sysdate,hiredate)))as ��������
from emp;

select ename, trunc(sysdate-hiredate) as a,
            trunc((sysdate-hiredate)/7,0) as weeks,
            floor(mod(sysdate-hiredate,7)) as days
from emp;



-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
select deptno, trunc(months_between(sysdate, hiredate)) as ������
            ,ceil(months_between(sysdate, hiredate)) as ������
            ,floor(months_between(sysdate, hiredate)) as ������
from emp
where deptno = 10;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) as mydate from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day(sysdate, '��') as wol from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day(sysdate) as lastwol from dual;

-- �Ի����ڿ��� �Ի�⵵�� ���
select ename, hiredate, to_char(hiredate,'YYYY' ||' '||'MM' || ' ' ||'DD') as hire_year
from emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select ename, hiredate, to_char(hiredate,'YYYY' ||'"��" '||'MM' || '"��" ' ||'DD'|| '"��"') as hire_year
from emp;

-- 1981�⵵�� �Ի��� ��� �˻�
select ename, hiredate
from emp
where to_char(hiredate, 'YYYY') = '1981';

-- 5���� �Ի��� ��� �˻�
select ename, hiredate
from emp
where to_char(hiredate, 'MM') = '05';

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select ename, sal, to_char(sal,'$999,999,999,999,999,999') as dollar
from emp;

-- 81�� 2���� �Ի��� ��� �˻�
select ename, hiredate
from emp
where to_char(hiredate,'YYYY'||'MM') = '1981'||'02';


-- 81�⿡ �Ի����� ���� ��� �˻�
select ename, hiredate
from emp
where not to_char(hiredate,'YYYY') ='1981';


-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
select ename, hiredate
from emp
where to_char(hiredate,'YYYYMM') between '198107' and '198112';
--where to_char(hiredate,'YYYYMM') > '198106' and to_char(hiredate,'YYYYMM') <= '198112' ;

-- �ֹι�ȣ���� ���� ���ϱ�
SELECT decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 
WHEN '1' THEN '����'
WHEN '3' THEN '����'
ELSE '����'
END as gender
FROM info_tab;

-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
--1
select deptno, decode(deptno,'10','������','20','������','30','IT��','�����') as detpno
from emp;

--2
select deptno ,case(deptno)
when 10 then '������'
when 20 then '������'
when 30 then 'IT��'
else '�����'
end as detpno
from emp;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
--1
select job, decode(job,'ANALYST',sal*1.1,'CLERK',sal*1.15,'MANAGER',sal*1.2) AS job
from emp;

--2
select  job ,case job
when 'ANALYST' then sal*1.1
when 'CLERK' then sal*1.15
when 'MANAGER' then sal*1.2
end as job
from emp;













