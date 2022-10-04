-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력

select ename, sal, round (sal/12, -1) as wolgup
from emp;



-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
select ename, sal, trunc(sal*0.033,-1) as tax
from emp;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
select * from emp;

select empno, ename, LOWER(job)as job
from emp;

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
select empno, INITCAP(ename) as ename , INITCAP(job) as job
from emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
select empno, ename, job, sal, deptno
from emp
where (substr(ename,1,1) > 'K' and substr(ename,1,1) < 'Y') order by ename asc;


-- 이름이 5글자 이상인 사원들을 출력
select *
from emp
where length(ename) >=5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
select RPAD(ename,15,'*') as ename
from emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
select LPAD(sal,10,'-') as sal
from emp;

select name, jumin ,substr(jumin, 8, 1) gender,
                    substr(jumin,1,2) birth_year
from info_tab;

-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
select TRANSLATE(sal,1234567890,'일이삼사오육칠팔구영') as sal, sal
from emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
select REPLACE(sal, 0, '$')as sal
from emp;


----
select '-' || trim(' 이순신 ') || '-' as col1, 
       '-' || ltrim(' 이순신 ') || '-' as col2, 
       '-' || rtrim(' 이순신 ') || '-' as col3
from dual;

select sysdate
from dual;

select '-*-' as cl
from dual;

--- *********
select replace('이      순         신',' ','') as ename
from dual;



select * from emp;
-- 현재까지 근무일 수가 많은 사람 순으로 출력
select ename , trunc(sysdate - hiredate) as hiredate1
from emp
order by hiredate desc;

select ename, hiredate
from emp
order by sysdate-hiredate desc nulls last;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
select ename, trunc((sysdate-hiredate)/7) as 근속주 ,trunc(sysdate-hiredate) as 근속일,
                trunc(sysdate - add_months(hiredate, months_between(sysdate,hiredate)))as ㅁㄴㅇㄹ
from emp;

select ename, trunc(sysdate-hiredate) as a,
            trunc((sysdate-hiredate)/7,0) as weeks,
            floor(mod(sysdate-hiredate,7)) as days
from emp;



-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
select deptno, trunc(months_between(sysdate, hiredate)) as 개월수
            ,ceil(months_between(sysdate, hiredate)) as 개월수
            ,floor(months_between(sysdate, hiredate)) as 개월수
from emp
where deptno = 10;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) as mydate from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
select next_day(sysdate, '월') as wol from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day(sysdate) as lastwol from dual;

-- 입사일자에서 입사년도를 출력
select ename, hiredate, to_char(hiredate,'YYYY' ||' '||'MM' || ' ' ||'DD') as hire_year
from emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
select ename, hiredate, to_char(hiredate,'YYYY' ||'"년" '||'MM' || '"월" ' ||'DD'|| '"일"') as hire_year
from emp;

-- 1981년도에 입사한 사원 검색
select ename, hiredate
from emp
where to_char(hiredate, 'YYYY') = '1981';

-- 5월에 입사한 사원 검색
select ename, hiredate
from emp
where to_char(hiredate, 'MM') = '05';

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
select ename, sal, to_char(sal,'$999,999,999,999,999,999') as dollar
from emp;

-- 81년 2월에 입사한 사원 검색
select ename, hiredate
from emp
where to_char(hiredate,'YYYY'||'MM') = '1981'||'02';


-- 81년에 입사하지 않은 사원 검색
select ename, hiredate
from emp
where not to_char(hiredate,'YYYY') ='1981';


-- 81년 하반기에 입사한 사원 검색
select ename, hiredate
from emp
where to_char(hiredate,'YYYYMM') between '198107' and '198112';
--where to_char(hiredate,'YYYYMM') > '198106' and to_char(hiredate,'YYYYMM') <= '198112' ;

-- 주민번호에서 성별 구하기
SELECT decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 
WHEN '1' THEN '남자'
WHEN '3' THEN '남자'
ELSE '여자'
END as gender
FROM info_tab;

-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
--1
select deptno, decode(deptno,'10','영업부','20','관리부','30','IT부','기술부') as detpno
from emp;

--2
select deptno ,case(deptno)
when 10 then '영업부'
when 20 then '관리부'
when 30 then 'IT부'
else '기술부'
end as detpno
from emp;

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
--1
select job, decode(job,'ANALYST',sal*1.1,'CLERK',sal*1.15,'MANAGER',sal*1.2) AS job
from emp;

--2
select  job ,case job
when 'ANALYST' then sal*1.1
when 'CLERK' then sal*1.15
when 'MANAGER' then sal*1.2
end as job
from emp;













