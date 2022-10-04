-- �������

/*
    �̸�        name      varhcar2(10)
    �ֹι�ȣ    jumin      char(15)
    ��ȭ��ȣ     tel       varchar2(20)
    ����        gender    varchar2(10)
    ����        age       number(3)
    �����      home       varchar2(20)
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

-- ������ Ȯ��
SELECT * FROM info_tab;

/*
    ���̺�� : student_score
    
�й�        id        char(4)
�л���      name      varchar2(20)
��������    kor        number(3)
��������    eng        number(3)
����       total      number
���       avg        number(5,2) -- ���ڸ��� ��ü �ڸ� ��

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
--���̺� Ȯ��
DESC student_score;


DROP TABLE student_score;

-- ���� �÷��� �߰�
ALTER TABLE student_score ADD
(
    mat number(3)
);

-- ���� �÷��� �����ϱ�
ALTER TABLE student_score DROP (total);
-- ��� �÷����� �Ҽ��� 1�ڷ� ����
ALTER TABLE student_score MODIFY (avg number(4,1));

-- ������ �Է�
--  ���� : ' '
--  ���� 
INSERT INTO student_score (id, name, kor, eng)
VALUES ('0001', 'ȫ�浿' , 50, 80);

SELECT * FROM student_score;

-- 2000�� �й��� ȫ������ ����� ���������� ���� 60, 90 ���� ����

INSERT INTO student_score (id,name, kor, eng)
VALUES ('2000', 'ȫ����', 60,90);

commit;
rollback;

-- 1000�� �л� ȫ��� ������ ����
INSERT INTO student_score(id, name, kor, eng)
VALUES ('1000','ȫ���',80,70);
-- �̸��� ȫ����� �л��� ���ڵ带 ����
DELETE FROM student_score
WHERE name = 'ȫ���';

--0001�� �л��� ���������� 100���� �����ϱ�
UPDATE student_score
SET kor = 100 WHERE ID = '0001';
SELECT * FROM student_score;

--ȫ������ ���� ������ 90������ �Է�
UPDATE student_score
SET mat = 90 WHERE name = 'ȫ����';

--�л����� ��� ���ϱ�
UPDATE student_score
SET avg = (kor+eng+nvl2(mat, 0, 0))/3;

CREATE TABLE emp_copy
    AS SELECT * FROM emp;
    
DESC emp_copy;

SELECT * FROM emp_copy;

-- 1������
UPDATE emp_copy
SET deptno = 10 WHERE empno = 7788;

--2������
UPDATE emp_copy
SET ename = 'ȫ���',sal = 3500 WHERE empno = 7782;

--3������
UPDATE emp_copy
SET comm = nvl(comm,0)+300;

--4������
DELETE emp_copy
WHERE empno = 7499;

--5������
DELETE emp_copy
WHERE hiredate < '81/06/01';

DELETE FROM emp_copy;

rollback;

select * from emp_copy;

truncate table emp_copy;




























