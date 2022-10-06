select * from employees;

--1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
select employee_id, first_name ||' ' || last_name as name, to_char(hire_date, 'DD') day
from employees
where to_char(hire_date, 'YYYY') = '2003';

--2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
select *
from employees
where job_id = 'FI_ACCOUNT' or job_id = 'FI_MGR' or job_id = 'SA_MAN' or job_id = 'SA_REP';

--3. Ŀ�̼��� �޴� ������� ����� ���
select first_name ||' ' || last_name as name
from employees
where commission_pct > 0;
?
--4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���

SELECT job_id, CASE job_id
WHEN 'SA_MAN' THEN '�Ǹźμ�'
WHEN 'SA_REP' THEN '�Ǹźμ�'
ELSE '�� �� �μ�'
end as job_id
FROM employees;
?

--5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
select to_char(hire_date,'yyyy'),min(salary), max(salary), sum(salary), trunc(avg(salary))
from employees
group by to_char(hire_date,'yyyy')
order by to_char(hire_date,'yyyy') asc;
?
--6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
select job_id, avg(salary)sal
from employees
group by job_id
having avg(salary) >= 10000;

?
--7. �μ��� �ִ� �޿��� ���Ͻÿ�
select job_id, max(salary)
from employees
group by job_id
order by max(salary) asc;



