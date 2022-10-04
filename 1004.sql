CREATE TABLE dept AS SELECT * FROM scott.dept;

desc dept;

select * from dept;

ALTER TABLE dept
ADD CONSTRAINT pk_dept_deptno PRIMARY KEY (deptno);


--  1) student 테이블 만들기
create table student
(
    no varchar2(4),   -- 학번
    name varchar2(12) not null, -- 이름
    gender varchar2(6), -- 성별
    addr varchar2(36), -- 주소
    jumin varchar2(15) not null, -- 주민번호
    deptno number(2), -- 학과
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno) 
);

drop table student;

--  2) 학번 컬럼에 기본키(primary key) 제약조건 추가
ALTER TABLE student
    ADD CONSTRAINT pk_student_no PRIMARY KEY (no);
    
--  3) 주민번호 컬럼에서 NOT NULL 제약조건 삭제

ALTER TABLE student
    MODIFY (jumin varchar2(15));
    
--  4) 주소 컬럼에 디폴트 제약조건으로 “서울” 추가

ALTER TABLE student
    DROP CONSTRAINT ck_student_addr;

ALTER TABLE student
    MODIFY (addr varchar2(36)default '서울');
   
select * from student;

-- 5) 성별 컬럼에 체크 제약조건으로 “남성”, “여성” 추가

ALTER TABLE student
    ADD CONSTRAINT ck_student_gender CHECK(gender in('남성','여성'));
    
-- 레코드 입력
INSERT INTO student(no, name, gender, addr, jumin ) 
VALUES('1111', '김태희', '여성', '서울시 강남구', '801212-1234567' );

INSERT INTO student(no, name, jumin ) 
VALUES('2222', '송혜교', '881212-1234567');

INSERT INTO student(no, name, jumin ) 
VALUES('1111', '강동원', '881212-1234567');  -- 기본키 겹침

INSERT INTO student(no, name, gender, jumin ) 
VALUES('3333', '하정우', '남자', '830303-1234567');  -- 체크 걸림(남성)

INSERT INTO student(no, name, addr, jumin ) 
VALUES('4444', '김새론', '서울시 서초구', '990909-1234567');

INSERT INTO student(no, name, addr, deptno ) 
VALUES('8888', '이병헌', '서울시 한강', 50);    -- deptno 에 50이 없음


-- 6) library 테이블 만들기
create table library
(
    rent_id number(1),
    book_id varchar2(5) not null,
    hakbun varchar2(4),
    CONSTRAINT pk_library_rentid PRIMARY KEY (rent_id),
    CONSTRAINT fk_library_hakbun FOREIGN KEY (hakbun) REFERENCES student(no)
);

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );
-- student table에 없음

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );
-- student table에 없음
 
select * from student;
select * from library;















