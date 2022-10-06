-- ȸ�� ���̺�

create table ex_member(
id varchar2(10), -- ���̵�
pass varchar2(10), -- �н�����
name varchar2(20), -- �̸�
tel varchar2(20), -- ��ȭ��ȣ
addr varchar2(100) -- �ּ�
);

-- ��ǰ ���̺�

create table ex_good(
gno varchar2(10), -- ��ǰ��ȣ
gname varchar(30), -- ��ǰ��
gdetail varchar2(300), -- �󼼼���
price number); -- ����

- �ֹ� ���̺�

create table ex_order (
ono number, -- ��ȣ
orderno varchar2(20), -- �ֹ���ȣ
gno varchar2(10), -- ��ǰ��ȣ
id varchar2(10), -- ȸ�� ���̵�
count number, -- ����
status varchar2(10) -- ��ۻ���
);

?-- ######################################################
-- �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?

ALTER TABLE ex_member
ADD CONSTRAINT pk_ex_member_id PRIMARY KEY (id);

ALTER TABLE ex_good
ADD CONSTRAINT pk_ex_good_gno PRIMARY KEY (gno);

ALTER TABLE ex_order
ADD CONSTRAINT pk_ex_member_ono PRIMARY KEY (ono);

ALTER TABLE ex_order
ADD CONSTRAINT fk_ex_order_id FOREIGN KEY (id) REFERENCES ex_member(id);

ALTER TABLE ex_order
ADD CONSTRAINT fk_ex_order_gno FOREIGN KEY (gno) REFERENCES ex_good(gno);

--[ ���� ]

--

--1. ������� ��ǰ�� ���� ������ ���
--
select *
from ex_order
where status like '�����';

--2. �ֹ� ���� ��ǰ ������ �� ���� ���
--
select g.gname ��ǰ����, m.*
from ex_order o left outer join ex_member m
on o.id = m.id left outer join ex_good g
on o.gno = g.gno
where o.status like '�ֹ�';

--3. �ֹ����� �� ����(���̵�)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
--
select o.id, sum(g.price*o.count)�ѱݾ�
from ex_order o full outer join ex_good g
on o.gno = g.gno
group by o.id,o.orderno;
?

-- [ �������� ]

--4. 3���� �ֹ� ������ ù���� ��ǰ�� �� �� ���� ���
-- [��] 20161212   �Ӹ��� �� 1�� 

