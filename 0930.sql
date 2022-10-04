--8000번 사원으로 < 본인이름 > 과 급여 10000 을 저장
INSERT INTO emp(empno, ename, sal)
VALUES(8000,'홍길자',10000);

SELECT * FROM emp;

--7788번 사원으로 <본인이름>과 급여 10000을 저장하세요
INSERT INTO emp(empno, ename, sal)
VALUES(7788,'변정환',10000);


INSERT INTO emp(empno, ename, sal, deptno)
VALUES(8001,'홍길국',10000, 20);

DELETE FROM emp_copy
WHERE ename = '홍길국';

INSERT INTO emp(empno, ename, sal, deptno)
VALUES(8002,'홍길동',10000, 50);

INSERT INTO info_tab(tel,name,jumin,gender,age,home)
VALUES('032','홍자','801212','남자',33,'제주');

SELECT *FROM info_tab;

INSERT INTO info_tab(tel,name)
VALUES('1002','둘리');

INSERT INTO info_tab(name,jumin) 
VALUES('김길동','901212-1234567');

INSERT INTO info_tab(gender,age) VALUES('남자',22);
INSERT INTO info_tab(tel,gender,age,name) VALUES('9999','남자',22,'김김김');

ALTER TABLE info_tab
ADD CONSTRAINT pk_info_tel PRIMARY KEY (tel);

DELETE FROM info_tab;

SELECT * FROM info_tab;

DROP TABLE info_tab;

CREATE TABLE info_tab
(
    name varchar2(10) NOT NULL,
    jumin char(15),
    tel varchar2(20),
    gender varchar2(10) default '남성',
    age number(3),
    home varchar2(20),
    deptno number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gener CHECK (gender IN ('남성','여성')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno)
);

ALTER TABLE info_tab
    MODIFY (name varchar2(10) NOT NULL);
    
ALTER TABLE info_tab
    ADD CONSTRAINT uq_info_jumin UNIQUE(jumin);
    
INSERT INTO info_tab (tel, name, jumin) values('2001','홍실이','990101');
INSERT INTO info_tab (tel, name, jumin) values('2002','홍동이','990101');
INSERT INTO info_tab (tel, name) values('2003','홍동이');

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK( gender in('남성','여성') );
    
INSERT INTO info_tab(tel,name,gender) VALUES('10001','홍돌이','남성');
INSERT INTO info_tab(tel,name,gender) VALUES('20001','홍숙이','남자');
INSERT INTO info_tab(tel,name,gender) VALUES('20001','홍숙이','여성');

ALTER TABLE info_tab
    MODIFY (gender varchar2(6)default '남성');
    
INSERT INTO info_tab(tel,name) VALUES('7777','홍이');

SELECT * FROM info_tab;

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('갑순이', '02-777-4444', '990909-1234567');     --가능

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('갑갑이','03-555-5555', '880808-1234567', '남자', 27,'경기');       -- '남자'여서 안들어감

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('홍길동','03-031-0310', '900909-1234567', '남성', 27,'경기');       --가능

INSERT INTO info_tab( name, jumin) VALUES('홍길자', '550505-1234567');     --전화번호가 없음
INSERT INTO info_tab( tel, jumin ) VALUES('031-777-7777', '700707-1234567');    --이름이 없음
INSERT INTO info_tab( name, tel, jumin ) VALUES('갑동이', '031-000-0000', '700707-1234567');   --가능

DROP TABLE info_tab;


CREATE TABLE info_tab
(
    name varchar2(10) NOT NULL,
    jumin char(15),
    tel varchar2(20),
    gender varchar2(10) default '남성',
    age number(3),
    home varchar2(20),
    deptno number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gener CHECK (gender IN ('남성','여성')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno)
);


INSERT INTO info_tab(tel, name, deptno) VALUES ('7777','맹이',20);
INSERT INTO info_tab(tel, name, deptno) VALUES ('8888','콩이',22);
INSERT INTO info_tab(tel, name) VALUES ('9999','짱이');
UPDATE info_tab
    SET name = '맹이' WHERE tel = '7777';
    
SELECT * FROM info_tab;

----------------------연습 SQL 기초--------------------------

--------------------------------1. sawon 테이블 생성-----------------------------
CREATE TABLE sawon
(
        sabun NUMBER(6),
        sawon_name varchar2(10),
        ubmu varchar2(20),
        weolgub number(10,2),
        buseo number(3)
);

--------------------------------2. sabun 기본키 지정-----------------------------

ALTER TABLE sawon
ADD CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun);

-------3. 최대 한글 10자리의 jiyeok 컬럼을 추가하되 NULL 값이 입력되지 않도록 지정-----

ALTER TABLE sawon
    ADD (jiyeok varchar2(20) NOT NULL);
    
select * from sawon;

------------------------4. weolgub 컬럼은 정수형 7자리로 변경----------------------

AlTER TABLE sawon
    MODIFY (weolgub number(7));

-------5. ubmu컬럼은 ‘개발’, ‘유지보수’, ‘관리’ 만 데이터 값으로 입력되도록 지정-------

ALTER TABLE sawon
    ADD CONSTRAINT ck_sawon_ubmu CHECK(ubmu in('개발','유지보수','관리'));
    
----------6. ubmu컬럼에 데이터가 입력이 안될 경우 디폴드값으로 ‘개발’을 설정-----------

ALTER TABLE sawon
    MODIFY (ubmu varchar2(20)default '개발');
    
------------------------7. buseo 테이블을 생성하세요----------------------------

CREATE TABLE buseo
(
    buseo_no number(3),
    buseo_name varchar(20)
);

ALTER TABLE buseo
ADD CONSTRAINT pk_sawon_buseo_no PRIMARY KEY (buseo_no);

----8. sawon 테이블의 buseo 컬럼을 buseo 테이블의 buseo_no를 참조하는 외래키로 설정---

ALTER TABLE sawon
    ADD CONSTRAINT fk_sawon_buseo_no FOREIGN KEY (buseo)REFERENCES buseo(buseo_no);

-------------------------9. buseo 테이블에 데이터 입력----------------------------

ALTER TABLE buseo
 modify (buseo_name varchar2(30));

INSERT INTO buseo (buseo_no,buseo_name) VALUES(101,'소프트웨어유지보수부');
INSERT INTO buseo (buseo_no,buseo_name) VALUES(202,'관리부');
INSERT INTO buseo (buseo_no,buseo_name) VALUES(303,'인적자원부');

select * from buseo;

-------------10. sawon 테이블에 데이터 입력 (입력이 안될 경우도 있음)--------------

ALTER TABLE sawon
 modify (sawon_name varchar2(15));
 
INSERT INTO sawon(sabun,sawon_name,weolgub,buseo,jiyeok)
    VALUES(8001,'홍길동이군',100000,101,'부산');

select * from sawon;

INSERT INTO sawon(sabun,sawon_name,ubmu,weolgub,buseo,jiyeok)
    VALUES(8002,'홍길자','사무',200000,202,'인천');
    --업무가 '사무'라 안됨
  
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok)
    VALUES(8003,'홍길순','개발',111,'대전');  
    --참조하고 있는 테이블의 칼럼에 입력돼있는 값이 없어서 발생한 오류.
    
INSERT INTO sawon(sabun,sawon_name,weolgub,jiyeok)
    VALUES(8004,'홍길석',12345678,'서울');  
    --월급 투머치 ;;
    
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok)
    VALUES(8005,'홍길철','유지보수',303,'판교');  
    --쌉가능
    
---------------------11. sawon 테이블에서 jiyeok 컬럼을 제거---------------------

ALTER TABLE sawon DROP (jiyeok);

select * from sawon;
select * from buseo;

-------------------12. buseo 테이블에서 buseo 명이 ‘인적자원부’인 행을 삭제---------
DELETE FROM sawon WHERE buseo = 303;
DELETE FROM buseo WHERE buseo_name = '인적자원부';

---------------------13. sawon 테이블이 모든 내용을 삭제하고 저장공간을 해제---------
DROP TABLE sawon;
truncate table sawon;
commit;

------------14.1~8 단계까지를 각각의 테이블을 각각 하나의 CREATE 문으로 작성---------

CREATE TABLE sawon
(
        sabun NUMBER(6),
        sawon_name varchar2(10),
        ubmu varchar2(20)default '개발',
        weolgub number(7),
        buseo number(3),
        jiyeok varchar2(20) NOT NULL,
        CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
        CONSTRAINT ck_sawon_ubmu CHECK(ubmu in('개발','유지보수','관리')),
        CONSTRAINT fk_sawon_buseo_no FOREIGN KEY (buseo)REFERENCES buseo(buseo_no)
);





        







































