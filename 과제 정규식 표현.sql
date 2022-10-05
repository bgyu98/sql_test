create table reg_tab(text varchar2(20));

INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('��');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('�����');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('����');

-- 1.  text �÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�
select * from reg_tab;

select text
from reg_tab
where text like 't%';


-- 2.  text �÷��� ���ڿ����� 't'�� ������ ������ �˻�

select text
from reg_tab
where text like '%t';



-- 3. ù��° 't'�� �����Ͽ� 5��° 'r'�� �ִ� ������ �˻�
select text
from reg_tab
where text like 't%%%%r%';
?

-- 4. ���ڷ� ������ ������ �˻�
select text
from reg_tab
where regexp_like(text,'[0-9]$');
?

-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�
select text
from reg_tab
where regexp_like(text,'^[0-9]');
?

-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�
select text
from reg_tab
where regexp_like(text,'^[^0-9]');
?

-- 7. �빮�ڷ� �����ϴ� ������ �˻�

select text
from reg_tab
where regexp_like(text,'[A-Z]');

-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�
select text
from reg_tab
where not regexp_like(text,'[a-z]');
?

-- 9. �ѱ۷� �����ϴ� ������ �˻�
select text
from reg_tab
where regexp_like(text,'[��-�R]');

select text
from reg_tab
where text between '��' and '�R';


?

-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
select text
from reg_tab
where regexp_like(text,'gg|GG');