CREATE TABLE dept AS SELECT * FROM scott.dept;

desc dept;

select * from dept;

ALTER TABLE dept
ADD CONSTRAINT pk_dept_deptno PRIMARY KEY (deptno);


--  1) student ���̺� �����
create table student
(
    no varchar2(4),   -- �й�
    name varchar2(12) not null, -- �̸�
    gender varchar2(6), -- ����
    addr varchar2(36), -- �ּ�
    jumin varchar2(15) not null, -- �ֹι�ȣ
    deptno number(2), -- �а�
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno) 
);

drop table student;

--  2) �й� �÷��� �⺻Ű(primary key) �������� �߰�
ALTER TABLE student
    ADD CONSTRAINT pk_student_no PRIMARY KEY (no);
    
--  3) �ֹι�ȣ �÷����� NOT NULL �������� ����

ALTER TABLE student
    MODIFY (jumin varchar2(15));
    
--  4) �ּ� �÷��� ����Ʈ ������������ ����� �߰�

ALTER TABLE student
    DROP CONSTRAINT ck_student_addr;

ALTER TABLE student
    MODIFY (addr varchar2(36)default '����');
   
select * from student;

-- 5) ���� �÷��� üũ ������������ ��������, �������� �߰�

ALTER TABLE student
    ADD CONSTRAINT ck_student_gender CHECK(gender in('����','����'));
    
-- ���ڵ� �Է�
INSERT INTO student(no, name, gender, addr, jumin ) 
VALUES('1111', '������', '����', '����� ������', '801212-1234567' );

INSERT INTO student(no, name, jumin ) 
VALUES('2222', '������', '881212-1234567');

INSERT INTO student(no, name, jumin ) 
VALUES('1111', '������', '881212-1234567');  -- �⺻Ű ��ħ

INSERT INTO student(no, name, gender, jumin ) 
VALUES('3333', '������', '����', '830303-1234567');  -- üũ �ɸ�(����)

INSERT INTO student(no, name, addr, jumin ) 
VALUES('4444', '�����', '����� ���ʱ�', '990909-1234567');

INSERT INTO student(no, name, addr, deptno ) 
VALUES('8888', '�̺���', '����� �Ѱ�', 50);    -- deptno �� 50�� ����


-- 6) library ���̺� �����
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
-- student table�� ����

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );
-- student table�� ����
 
select * from student;
select * from library;















