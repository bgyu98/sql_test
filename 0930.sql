--8000�� ������� < �����̸� > �� �޿� 10000 �� ����
INSERT INTO emp(empno, ename, sal)
VALUES(8000,'ȫ����',10000);

SELECT * FROM emp;

--7788�� ������� <�����̸�>�� �޿� 10000�� �����ϼ���
INSERT INTO emp(empno, ename, sal)
VALUES(7788,'����ȯ',10000);


INSERT INTO emp(empno, ename, sal, deptno)
VALUES(8001,'ȫ�汹',10000, 20);

DELETE FROM emp_copy
WHERE ename = 'ȫ�汹';

INSERT INTO emp(empno, ename, sal, deptno)
VALUES(8002,'ȫ�浿',10000, 50);

INSERT INTO info_tab(tel,name,jumin,gender,age,home)
VALUES('032','ȫ��','801212','����',33,'����');

SELECT *FROM info_tab;

INSERT INTO info_tab(tel,name)
VALUES('1002','�Ѹ�');

INSERT INTO info_tab(name,jumin) 
VALUES('��浿','901212-1234567');

INSERT INTO info_tab(gender,age) VALUES('����',22);
INSERT INTO info_tab(tel,gender,age,name) VALUES('9999','����',22,'����');

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
    gender varchar2(10) default '����',
    age number(3),
    home varchar2(20),
    deptno number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gener CHECK (gender IN ('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno)
);

ALTER TABLE info_tab
    MODIFY (name varchar2(10) NOT NULL);
    
ALTER TABLE info_tab
    ADD CONSTRAINT uq_info_jumin UNIQUE(jumin);
    
INSERT INTO info_tab (tel, name, jumin) values('2001','ȫ����','990101');
INSERT INTO info_tab (tel, name, jumin) values('2002','ȫ����','990101');
INSERT INTO info_tab (tel, name) values('2003','ȫ����');

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK( gender in('����','����') );
    
INSERT INTO info_tab(tel,name,gender) VALUES('10001','ȫ����','����');
INSERT INTO info_tab(tel,name,gender) VALUES('20001','ȫ����','����');
INSERT INTO info_tab(tel,name,gender) VALUES('20001','ȫ����','����');

ALTER TABLE info_tab
    MODIFY (gender varchar2(6)default '����');
    
INSERT INTO info_tab(tel,name) VALUES('7777','ȫ��');

SELECT * FROM info_tab;

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '02-777-4444', '990909-1234567');     --����

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('������','03-555-5555', '880808-1234567', '����', 27,'���');       -- '����'���� �ȵ�

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27,'���');       --����

INSERT INTO info_tab( name, jumin) VALUES('ȫ����', '550505-1234567');     --��ȭ��ȣ�� ����
INSERT INTO info_tab( tel, jumin ) VALUES('031-777-7777', '700707-1234567');    --�̸��� ����
INSERT INTO info_tab( name, tel, jumin ) VALUES('������', '031-000-0000', '700707-1234567');   --����

DROP TABLE info_tab;


CREATE TABLE info_tab
(
    name varchar2(10) NOT NULL,
    jumin char(15),
    tel varchar2(20),
    gender varchar2(10) default '����',
    age number(3),
    home varchar2(20),
    deptno number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gener CHECK (gender IN ('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno)REFERENCES dept(deptno)
);


INSERT INTO info_tab(tel, name, deptno) VALUES ('7777','����',20);
INSERT INTO info_tab(tel, name, deptno) VALUES ('8888','����',22);
INSERT INTO info_tab(tel, name) VALUES ('9999','¯��');
UPDATE info_tab
    SET name = '����' WHERE tel = '7777';
    
SELECT * FROM info_tab;

----------------------���� SQL ����--------------------------

--------------------------------1. sawon ���̺� ����-----------------------------
CREATE TABLE sawon
(
        sabun NUMBER(6),
        sawon_name varchar2(10),
        ubmu varchar2(20),
        weolgub number(10,2),
        buseo number(3)
);

--------------------------------2. sabun �⺻Ű ����-----------------------------

ALTER TABLE sawon
ADD CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun);

-------3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL ���� �Էµ��� �ʵ��� ����-----

ALTER TABLE sawon
    ADD (jiyeok varchar2(20) NOT NULL);
    
select * from sawon;

------------------------4. weolgub �÷��� ������ 7�ڸ��� ����----------------------

AlTER TABLE sawon
    MODIFY (weolgub number(7));

-------5. ubmu�÷��� �����ߡ�, ������������, �������� �� ������ ������ �Էµǵ��� ����-------

ALTER TABLE sawon
    ADD CONSTRAINT ck_sawon_ubmu CHECK(ubmu in('����','��������','����'));
    
----------6. ubmu�÷��� �����Ͱ� �Է��� �ȵ� ��� �����尪���� �����ߡ��� ����-----------

ALTER TABLE sawon
    MODIFY (ubmu varchar2(20)default '����');
    
------------------------7. buseo ���̺��� �����ϼ���----------------------------

CREATE TABLE buseo
(
    buseo_no number(3),
    buseo_name varchar(20)
);

ALTER TABLE buseo
ADD CONSTRAINT pk_sawon_buseo_no PRIMARY KEY (buseo_no);

----8. sawon ���̺��� buseo �÷��� buseo ���̺��� buseo_no�� �����ϴ� �ܷ�Ű�� ����---

ALTER TABLE sawon
    ADD CONSTRAINT fk_sawon_buseo_no FOREIGN KEY (buseo)REFERENCES buseo(buseo_no);

-------------------------9. buseo ���̺� ������ �Է�----------------------------

ALTER TABLE buseo
 modify (buseo_name varchar2(30));

INSERT INTO buseo (buseo_no,buseo_name) VALUES(101,'����Ʈ��������������');
INSERT INTO buseo (buseo_no,buseo_name) VALUES(202,'������');
INSERT INTO buseo (buseo_no,buseo_name) VALUES(303,'�����ڿ���');

select * from buseo;

-------------10. sawon ���̺� ������ �Է� (�Է��� �ȵ� ��쵵 ����)--------------

ALTER TABLE sawon
 modify (sawon_name varchar2(15));
 
INSERT INTO sawon(sabun,sawon_name,weolgub,buseo,jiyeok)
    VALUES(8001,'ȫ�浿�̱�',100000,101,'�λ�');

select * from sawon;

INSERT INTO sawon(sabun,sawon_name,ubmu,weolgub,buseo,jiyeok)
    VALUES(8002,'ȫ����','�繫',200000,202,'��õ');
    --������ '�繫'�� �ȵ�
  
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok)
    VALUES(8003,'ȫ���','����',111,'����');  
    --�����ϰ� �ִ� ���̺��� Į���� �Էµ��ִ� ���� ��� �߻��� ����.
    
INSERT INTO sawon(sabun,sawon_name,weolgub,jiyeok)
    VALUES(8004,'ȫ�漮',12345678,'����');  
    --���� ����ġ ;;
    
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok)
    VALUES(8005,'ȫ��ö','��������',303,'�Ǳ�');  
    --�԰���
    
---------------------11. sawon ���̺��� jiyeok �÷��� ����---------------------

ALTER TABLE sawon DROP (jiyeok);

select * from sawon;
select * from buseo;

-------------------12. buseo ���̺��� buseo ���� �������ڿ��Ρ��� ���� ����---------
DELETE FROM sawon WHERE buseo = 303;
DELETE FROM buseo WHERE buseo_name = '�����ڿ���';

---------------------13. sawon ���̺��� ��� ������ �����ϰ� ��������� ����---------
DROP TABLE sawon;
truncate table sawon;
commit;

------------14.1~8 �ܰ������ ������ ���̺��� ���� �ϳ��� CREATE ������ �ۼ�---------

CREATE TABLE sawon
(
        sabun NUMBER(6),
        sawon_name varchar2(10),
        ubmu varchar2(20)default '����',
        weolgub number(7),
        buseo number(3),
        jiyeok varchar2(20) NOT NULL,
        CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
        CONSTRAINT ck_sawon_ubmu CHECK(ubmu in('����','��������','����')),
        CONSTRAINT fk_sawon_buseo_no FOREIGN KEY (buseo)REFERENCES buseo(buseo_no)
);





        







































