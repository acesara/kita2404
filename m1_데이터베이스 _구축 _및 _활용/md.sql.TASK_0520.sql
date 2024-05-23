--TASK1_0520. 10개의 속성으로 구성되는 테이블 2개를 작성하세요. 단 FOREIGN KEY를 적용하여 한쪽 테이블의 데이터를 삭제 시
--다른 테이블의 관련되는 데이터도 모두 삭제되도록 하세요. (모든 제약 조건을 사용)
--단, 각 테이블에 5개의 데이터를 입력하고 두번째 테이블에 첫번째 데이터를 참조하고 있는 속성을 선택하여 데이터 삭제

--Task1_0520. 10개의 속성으로 구성되는 테이블 2개를 작성하세요. 단 FOREIGN KEY를 적용하여 한쪽 테이블의 데이터를 삭제 시 
--다른 테이블의 관련되는 데이터도 모두 삭제되도록 하세요. (모든 제약조건을 사용)
--단, 각 테이블에 5개의 데이터를 입력하고 두번째 테이블에 첫번째 데이터를 참조하고 있는 속성을 선택하여 데이터 삭제 
DROP table mart;
DROP table department;
create table mart(
    custid number primary key
    , name varchar2(20)
    , age number
    , sx varchar2(20)
    , phone number not null
    , address varchar2(100)
    , frequency number -- 방문 빈도
    , amount_num number
    , amount_price number
    , parking varchar2(20) -- 주차여부
    , family number -- 가족 구성원 수
);

alter table mart drop column amount_num;
alter table mart modify (name varchar2(30));
alter table mart modify (phone varchar2(20));

DESC mart;
insert into mart values(1, '고길동', 32, '남', '010-1234-1234', '서울 강남', 5, 1500000, 'N', 3);
insert into mart values(2, '손흥민', 31, '남', '010-7777-1234', '강원 춘천', 5, 200000000, 'Y', 4);
insert into mart values(3, '이순신', 57, '남', '010-1592-1234', '경남 통영', 5, 270000, 'N', 1);
insert into mart values(4, '아이유', 30, '여', '010-0516-1234', '서울 서초', 5, 750000000, 'Y', 4);
insert into mart values(5, '임영웅', 30, '남', '010-0517-1235', '서울 역삼', 5, 75000000, 'Y', 2);

select * from mart;

create table department(
    custid number primary key
    , name varchar(20)
    , age number
    , sx varchar2(20)
    , phone number not null
    , address varchar2(100)
    , use_store varchar2(100) -- 자주 찾는 매장
    , amount_num number
    , amount_price number
    , valet varchar2(20) -- 발렛파킹 서비스 사용여부
    , rounge varchar2(20) -- vip 라운지 사용여부
    , foreign key (custid) references mart(custid) on delete cascade
);

alter table department modify (amount_price check (amount_price > 100000000));
alter table department modify (rounge default 'Y');
alter table department modify (valet default 'Y');
alter table department modify (phone varchar2(100));
alter table department drop column amount_num;
--alter table department add (custid number);
select * from department;

insert into department values(1, '손흥민', 31, '남', '010-7777-1234', '강원 춘천', 'LV', 900000000,'','');
insert into department values(2, '아이유', 30, '여', '010-0516-1234', '서울 서초', 'GUCCI', 1500000000,'','');
insert into department values(3, '박지성', 31, '남', '010-7775-1235', '강원 춘천', 'LV', 900000000,'','');
insert into department values(4, '박세리', 30, '여', '010-0516-1234', '서울 서초', 'GUCCI', 1500000000,'','');
insert into department values(5, '임영웅', 30, '남', '010-0517-1235', '서울 역삼', 'ROLEX', 150000000,'','');

DELETE mart
WHERE custid = 1;

--Task2_0520. Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.

SELECT * FROM CUSTOMER;
UPDATE CUSTOMER
SET ADDRESS = (
    SELECT ADDRESS
    FROM CUSTOMER
    WHERE NAME = '김연아'
)   
--다시 부산으로 변경
WHERE NAME = '박세리';
UPDATE CUSTOMER
SET ADDRESS = '대한민국 부산'
WHERE NAME = '박세리';

--잘대값
SELECT ABS(-78) , ABS(+78)
FROM DUAL;

--반올림
SELECT ROUND(4.875,1)
FROM DUAL;

--Q. 고객별 평균 주문금액을 백원 단위로 반올림한 값을 구하시오
SELECT * FROM ORDERS;
SELECT CUSTID AS 고객번호, ROUND(AVG(SALEPRICE),-2) AS 평균주문금액
FROM ORDERS
GROUP BY CUSTID;
--띄어 쓰기 없으면 ""안써도됨

--Task3_0520.도서 제목에 ‘야구’가 포함된 도서를 ‘농구’로 변경한 후 도서 목록, 가격을 보이시오.
SELECT BOOKID, REPLACE(BOOKNAME, '야구','농구') AS BOOKNAME, PUBLISHER,PRICE
FROM BOOK;

--Q. '굿스포츠'에서 출판한 도서의 제목과 제목의 글자수, 바이트 수를 구하시오
SELECT BOOKNAME 제목 , LENGTH(BOOKNAME) 글자수 , LENGTHB(BOOKNAME) 바이트수
FROM BOOK
WHERE PUBLISHER = '굿스포츠';

--Task4_0520. 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
--SUBSTR(NAME, 1, 1) (첫번째 NAME부터 1개) 함수는 문자열 NAME의 첫 번째 글자부터 글자부터 시작하여 한 글자를 반환
--GROUP BY 절에서 별칭이 아닌 SUBSTR(NAME,1,1) 표현식을 사용해야 함
SELECT * FROM CUSTOMER;
SELECT SUBSTR(NAME,1,1) 성 , COUNT(*) 인원
FROM CUSTOMER
GROUP BY SUBSTR(NAME,1,1);

--Task5_0520. 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT * FROM orders;
SELECT orderid, orderdate as 주문일, orderdate + 10 확정일자
FROM orders;

--Task5-1_0520. 마당서점은 주문일로부터 2개월 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT * FROM orders;
SELECT orderid , orderdate as 주문일, ADD_MONTHS(orderdate,2) AS 확정일자 
FROM orders;

--Task6_0520.마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시한다.

SELECT orderid 주문번호, TO_CHAR(orderdate, 'YYYY-mm-dd day') 주문일 , custid 고객번호, bookid 도서번호
FROM orders
WHERE orderdate = '2020-07-07';
--WHERE orderdate = TO_DATE('20/07/07', 'YY/MM/DD')
--WHERE orderdate = TO_DATE('20/07/07', 'DD/MM/YY')




--Task7_0520. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
SELECT ORDERID , SALEPRICE FROM ORDERS
WHERE SALEPRICE < (SELECT AVG(SALEPRICE) FROM ORDERS);

--
SELECT o1.orderid , o1.saleprice
FROM ORDERS o1
WHERE o1.saleprice <= (SELECT AVG(o2.saleprice)
FROM orders o2);

--서브쿼리를 o2라는 별칭으로 지정, saleprice의 평균값을 avg_saleprice로 계산
SELECT o1.orderid, o1.saleprice
FROM ORDERS o1
JOIN (SELECT AVG(saleprice) AS avg_saleprice FROM ORDERS)o2
ON o1.saleprice < o2.avg_saleprice;



--Task8_0520. 대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
--
SELECT SUM(saleprice) AS 총판매액
FROM orders
WHERE custid IN (SELECT custid FROM customer WHERE address LIKE '%대한민국%');