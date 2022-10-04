-- 구조잡기

/*
    이름        name      varhcar2(10)
    주민번호    jumin      char(15)
    전화번호     tel       varchar2(20)
    성별        gender    varchar2(10)
    나이        age       number(3)
    출신지      home       varchar2(20)
*/

-- CREATE TABLE table_name ( [column_name data_type] );

CREATE TABLE info_tab
(
    name      varchar2(10),
    jumin      char(15),
    tel       varchar2(20),
    gender    varchar2(10),
    age       number(3),
    home       varchar2(20)
);

DESC info_tab;

-- 데이터 확인
SELECT * FROM info_tab;

/*
    테이블명 : student_score
    
학번        id        char(4)
학생명      name      varchar2(20)
국어점수    kor        number(3)
영어점수    eng        number(3)
총점       total      number
평균       avg        number(5,2) -- 앞자리가 전체 자리 수

*/

CREATE TABLE student_score
(
    id char(4),
    name varchar(20),
    kor number(3),
    eng number(3),
    total number,
    avg number(5,2)
);
--테이블 확인
DESC student_score;


DROP TABLE student_score;

-- 수학 컬럼을 추가
ALTER TABLE student_score ADD
(
    mat number(3)
);

-- 총점 컬럼을 삭제하기
ALTER TABLE student_score DROP (total);
-- 평균 컬럼에서 소수점 1자로 변경
ALTER TABLE student_score MODIFY (avg number(4,1));

-- 데이터 입력
--  문자 : ' '
--  숫자 
INSERT INTO student_score (id, name, kor, eng)
VALUES ('0001', '홍길동' , 50, 80);

SELECT * FROM student_score;

-- 2000번 학번인 홍길자의 국어와 영어점수를 각각 60, 90 으로 저장

INSERT INTO student_score (id,name, kor, eng)
VALUES ('2000', '홍길자', 60,90);

commit;
rollback;

-- 1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score(id, name, kor, eng)
VALUES ('1000','홍길숙',80,70);
-- 이름이 홍길숙인 학생의 레코드를 삭제
DELETE FROM student_score
WHERE name = '홍길숙';

--0001번 학생의 국어점수를 100으로 수정하기
UPDATE student_score
SET kor = 100 WHERE ID = '0001';
SELECT * FROM student_score;

--홍길자의 수학 점수를 90점으로 입력
UPDATE student_score
SET mat = 90 WHERE name = '홍길자';

--학생들의 평균 구하기
UPDATE student_score
SET avg = (kor+eng+nvl2(mat, 0, 0))/3;

CREATE TABLE emp_copy
    AS SELECT * FROM emp;
    
DESC emp_copy;

SELECT * FROM emp_copy;

-- 1번문제
UPDATE emp_copy
SET deptno = 10 WHERE empno = 7788;

--2번문제
UPDATE emp_copy
SET ename = '홍길숙',sal = 3500 WHERE empno = 7782;

--3번문제
UPDATE emp_copy
SET comm = nvl(comm,0)+300;

--4번문제
DELETE emp_copy
WHERE empno = 7499;

--5번문제
DELETE emp_copy
WHERE hiredate < '81/06/01';

DELETE FROM emp_copy;

rollback;

select * from emp_copy;

truncate table emp_copy;




























