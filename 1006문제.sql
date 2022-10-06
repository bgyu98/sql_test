-- 회원 테이블

create table ex_member(
id varchar2(10), -- 아이디
pass varchar2(10), -- 패스워드
name varchar2(20), -- 이름
tel varchar2(20), -- 전화번호
addr varchar2(100) -- 주소
);

-- 상품 테이블

create table ex_good(
gno varchar2(10), -- 상품번호
gname varchar(30), -- 상품명
gdetail varchar2(300), -- 상세설명
price number); -- 가격

- 주문 테이블

create table ex_order (
ono number, -- 번호
orderno varchar2(20), -- 주문번호
gno varchar2(10), -- 상품번호
id varchar2(10), -- 회원 아이디
count number, -- 갯수
status varchar2(10) -- 배송상태
);

?-- ######################################################
-- 주문테이블과 회원테이블, 상품테이블의 관계를 맺는다면?

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

--[ 문제 ]

--

--1. 배송중인 상품에 대한 내용을 출력
--
select *
from ex_order
where status like '배송중';

--2. 주문 들어온 상품 내역과 고객 정보 출력
--
select g.gname 상품내역, m.*
from ex_order o left outer join ex_member m
on o.id = m.id left outer join ex_good g
on o.gno = g.gno
where o.status like '주문';

--3. 주문별로 고객 정보(아이디)와 주문한 상품의 총금액을 출력
--
select o.id, sum(g.price*o.count)총금액
from ex_order o full outer join ex_good g
on o.gno = g.gno
group by o.id,o.orderno;
?

-- [ 도전문제 ]

--4. 3번에 주문 내역을 첫번재 상품명 외 몇 개로 출력
-- [예] 20161212   머리끈 외 1개 

