SELECT index_name, INDEX_TYPE 
FROM user_indexes
WHERE table_name='EMPLOYEES';

SELECT employee_id, first_name, last_name, phone_number FROM employees
WHERE salary = 3000;
