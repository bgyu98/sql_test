--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�. 
 --  Zlotkey�� �����Ͻʽÿ�.
select first_name || ' ' ||last_name �̸�, hire_date �Ի���
from employees
where last_name not like (select last_name from employees where last_name like 'Zlotkey') and department_id like (select department_id from employees where last_name like 'Zlotkey');
?
--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� 
  -- ����� �޿��� ���� ������������ �����Ͻʽÿ�.
select employee_id �����ȣ, first_name || ' ' ||last_name �̸�
from employees
where salary > (select round(avg(salary)) from employees) order by salary desc;

--3. �̸��� u�� ���Ե� ����� ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ�
   --���Ǹ� �ۼ��Ͻʽÿ�.
select employee_id �����ȣ, first_name || ' ' ||last_name �̸�
from employees
where  department_id in (select department_id from employees where first_name || ' ' ||last_name like '%u%');
?
--4. �μ� ��ġ ID�� 1700�� ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻʽÿ�.
select e.first_name || ' ' ||e.last_name �̸�, e.department_id, j.job_id
from employees e full outer join jobs j
on e.job_id = j.job_id
from employees e full outer join departments d
on e.department_id = d.department_id
where e.department_id like 1700;

--5. King���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���Ͻʽÿ�.
select first_name || ' ' ||last_name �̸�, salary
from employees
where manager_id in (select employee_id from employees where last_name like 'King');
?

?

---6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻʽÿ�.

?

?

--7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� 
  -- ��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.