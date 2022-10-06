--1. EMPLOYEES ���̺��� ��� �̸��� first_name�� last_name�� ���� full_name���� ���
select first_name || ' ' || last_name AS full_name
from employees;

--2. �μ���ȣ�� 30(���źμ�)�̰� �޿� 10000�̸��� ����� full_name�� ����,�μ���ȣ�� ���

select first_name || ' ' || last_name AS full_name, salary,department_id
from employees
where department_id = 30 and salary < 10000;

--3. �μ���ȣ�� 30�̰� �޿��� 10000�޷� ���ϸ� �޴� 2006�⵵ ���� �Ի��� ����� full_name�� ���

select first_name || ' ' || last_name AS full_name
from employees
where department_id = 30 and salary < 10000 and hire_date < '06/01/01';

--4. �μ���ȣ�� 30(���źμ�)�̰� �޿��� 10000������ ����� �μ���ȣ�� 60(IT�μ�)���� �޿��� 5000�̻��� ����� ��ȸ

select *
from employees
where department_id = 30 and salary <= 10000 or department_id = 60 and salary >= 5000;

--5. �����ȣ�� 110������ 120���� ��� �� �޿��� 5000���� 10000������ �������� ��ȸ

select *
from employees
where department_id >= 110 and department_id <= 120 and salary >= 5000 and salary <= 10000;

--6. �����ȣ�� 110������ 120���� �ƴ� ����� ��ȸ

select *
from employees
where not (employee_id >= 110 and employee_id <= 120);
--between 110 and 120;


--7. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�)�� ���� ����� ��ȸ

select *
from employees
where department_id = 30 or department_id = 60 or department_id = 90;


--8. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�) ���� �μ��� ���� ����� ��ȸ

select *
from employees
where not department_id = 30 and not department_id = 60 and not department_id = 90;


--9. ��ȭ��ȣ���� 590���� �����ϴ� ������ ��ȭ��ȣ�� ��ȸ

select first_name || ' ' || last_name AS full_name ,phone_number
from employees
where phone_number like '590%';


