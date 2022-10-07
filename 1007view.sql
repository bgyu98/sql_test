CREATE OR REPLACE VIEW v_emp  AS

           select empno, ename, deptno from emp;
           

SELECT * FROM v_emp;
DESC v_emp;

INSERT INTO v_emp VALUES (1000, '홍길동', 20);
SELECT * FROM v_emp;
SELECT * FROM emp;

--INSERT INTO v_emp VALUES (1000, '홍홍이',20); //pk
--INSERT INTO v_emp VALUES (2000, '홍홍이',90);

CREATE OR REPLACE VIEW v_emp_30 AS
			select empno EMP_NO , ename NAME, sal SALARY from emp WHERE DEPTNO = 30
			WITH READ only;
		
SELECT * FROM v_emp_30;		

Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno
WITH READ only;

SELECT * FROM v_emp_info;

--INSERT INTO V_EMP_INFO(empno, ename, dname) VALUES (3333, '맹꽁이', 30); 안돼
INSERT INTO V_EMP_INFO(empno, ename) VALUES (3333, '맹꽁이');

DELETE FROM v_emp_info WHERE empno = 7788;
SELECT * FROM emp;
SELECT * FROM v_emp_info;

--    [ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.

CREATE OR REPLACE VIEW v_dept_sum AS
SELECT D.dname, min(E.sal) 최소급여, max(E.sal) 최대급여, trunc(avg(E.sal)) 평균급여
FROM emp E, dept D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME 
WITH READ ONLY;

SELECT * FROM v_dept_sum ;

INSERT INTO emp(empno, ename, sal, DEPTNO)
VALUES (4444,'호이', 9900,20);

CREATE SEQUENCE seq_temp;
SELECT seq_temp.nextval FROM dual;
SELECT seq_temp.currval FROM dual;

-- 5000번부터 10씩 증가하는 자동증가수 (스퀀스)
CREATE SEQUENCE seq_test
	START WITH 5000
	INCREMENT BY 10;
	

SELECT seq_test.nextval FROM dual;

INSERT INTO emp(empno,ENAME)VALUES (seq_test.nextval , '박씨');
SELECT * FROM emp;


SELECT empno, ename, job, rowid FROM emp;






