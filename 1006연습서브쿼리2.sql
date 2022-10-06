--1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. 
 --  Zlotkey는 제외하십시오.
select first_name || ' ' ||last_name 이름, hire_date 입사일
from employees
where last_name not like (select last_name from employees where last_name like 'Zlotkey') and department_id like (select department_id from employees where last_name like 'Zlotkey');
?
--2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 
  -- 결과를 급여에 대해 오름차순으로 정렬하십시오.
select employee_id 사원번호, first_name || ' ' ||last_name 이름
from employees
where salary > (select round(avg(salary)) from employees) order by salary desc;

--3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는
   --질의를 작성하십시오.
select employee_id 사원번호, first_name || ' ' ||last_name 이름
from employees
where  department_id in (select department_id from employees where first_name || ' ' ||last_name like '%u%');
?
--4. 부서 위치 ID가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하십시오.
select e.first_name || ' ' ||e.last_name 이름, e.department_id, j.job_id
from employees e full outer join jobs j
on e.job_id = j.job_id
from employees e full outer join departments d
on e.department_id = d.department_id
where e.department_id like 1700;

--5. King에게 보고하는 모든 사원의 이름과 급여를 표시하십시오.
select first_name || ' ' ||last_name 이름, salary
from employees
where manager_id in (select employee_id from employees where last_name like 'King');
?

?

---6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.

?

?

--7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 
  -- 모든 사원의 사원 번호, 이름 및 급여를 표시하는 질의를 작성하십시오.