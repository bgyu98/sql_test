--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
select
    e.employee_id epid,
    d.department_name dpname
from
    employees e
    full outer join departments d
on
    e.department_id = d.department_id
where
    e.last_name like 'King'; 
    
--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
select
    e.last_name,
    e.employee_id epid,
    d.department_name dpname,
    j.job_title jtitle
from
    employees e full outer join departments d
on
    e.department_id = d.department_id
    full outer join jobs j
on
    e.job_id = j.job_id
where
    e.last_name like 'King';
    
--3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���

--(*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
select
    e.employee_id epid,
    e.first_name || ' ' || e.last_name name,
    e.hire_date hire,
    d.department_name
from
    employees e 
    full outer join departments d
on
    e.department_id = d.department_id
where
    to_char(e.hire_date,'YYYY') = '2007' and to_char(e.hire_date,'MM') <= '06';
    
 --4. 'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���

--(*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
select
    e1.first_name || ' ' || e1.last_name name,
    e2.first_name || ' ' || e2.last_name boss
from
    employees e1
    full outer join departments d
on
    e1.department_id = d.department_id
    full outer join employees e2
on
    e1.manager_id = e2.employee_id
where
    d.department_name like 'Executive';







