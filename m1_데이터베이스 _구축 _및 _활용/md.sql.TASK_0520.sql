--TASK1_0520. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� FOREIGN KEY�� �����Ͽ� ���� ���̺��� �����͸� ���� ��
--�ٸ� ���̺��� ���õǴ� �����͵� ��� �����ǵ��� �ϼ���. (��� ���� ������ ���)
--��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϰ� �ִ� �Ӽ��� �����Ͽ� ������ ����

--Task1_0520. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� FOREIGN KEY�� �����Ͽ� ���� ���̺��� �����͸� ���� �� 
--�ٸ� ���̺��� ���õǴ� �����͵� ��� �����ǵ��� �ϼ���. (��� ���������� ���)
--��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϰ� �ִ� �Ӽ��� �����Ͽ� ������ ���� 
DROP table mart;
DROP table department;
create table mart(
    custid number primary key
    , name varchar2(20)
    , age number
    , sx varchar2(20)
    , phone number not null
    , address varchar2(100)
    , frequency number -- �湮 ��
    , amount_num number
    , amount_price number
    , parking varchar2(20) -- ��������
    , family number -- ���� ������ ��
);

alter table mart drop column amount_num;
alter table mart modify (name varchar2(30));
alter table mart modify (phone varchar2(20));

DESC mart;
insert into mart values(1, '��浿', 32, '��', '010-1234-1234', '���� ����', 5, 1500000, 'N', 3);
insert into mart values(2, '�����', 31, '��', '010-7777-1234', '���� ��õ', 5, 200000000, 'Y', 4);
insert into mart values(3, '�̼���', 57, '��', '010-1592-1234', '�泲 �뿵', 5, 270000, 'N', 1);
insert into mart values(4, '������', 30, '��', '010-0516-1234', '���� ����', 5, 750000000, 'Y', 4);
insert into mart values(5, '�ӿ���', 30, '��', '010-0517-1235', '���� ����', 5, 75000000, 'Y', 2);

select * from mart;

create table department(
    custid number primary key
    , name varchar(20)
    , age number
    , sx varchar2(20)
    , phone number not null
    , address varchar2(100)
    , use_store varchar2(100) -- ���� ã�� ����
    , amount_num number
    , amount_price number
    , valet varchar2(20) -- �߷���ŷ ���� ��뿩��
    , rounge varchar2(20) -- vip ����� ��뿩��
    , foreign key (custid) references mart(custid) on delete cascade
);

alter table department modify (amount_price check (amount_price > 100000000));
alter table department modify (rounge default 'Y');
alter table department modify (valet default 'Y');
alter table department modify (phone varchar2(100));
alter table department drop column amount_num;
--alter table department add (custid number);
select * from department;

insert into department values(1, '�����', 31, '��', '010-7777-1234', '���� ��õ', 'LV', 900000000,'','');
insert into department values(2, '������', 30, '��', '010-0516-1234', '���� ����', 'GUCCI', 1500000000,'','');
insert into department values(3, '������', 31, '��', '010-7775-1235', '���� ��õ', 'LV', 900000000,'','');
insert into department values(4, '�ڼ���', 30, '��', '010-0516-1234', '���� ����', 'GUCCI', 1500000000,'','');
insert into department values(5, '�ӿ���', 30, '��', '010-0517-1235', '���� ����', 'ROLEX', 150000000,'','');

DELETE mart
WHERE custid = 1;

--Task2_0520. Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.

SELECT * FROM CUSTOMER;
UPDATE CUSTOMER
SET ADDRESS = (
    SELECT ADDRESS
    FROM CUSTOMER
    WHERE NAME = '�迬��'
)   
--�ٽ� �λ����� ����
WHERE NAME = '�ڼ���';
UPDATE CUSTOMER
SET ADDRESS = '���ѹα� �λ�'
WHERE NAME = '�ڼ���';

--�ߴ밪
SELECT ABS(-78) , ABS(+78)
FROM DUAL;

--�ݿø�
SELECT ROUND(4.875,1)
FROM DUAL;

--Q. ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
SELECT * FROM ORDERS;
SELECT CUSTID AS ����ȣ, ROUND(AVG(SALEPRICE),-2) AS ����ֹ��ݾ�
FROM ORDERS
GROUP BY CUSTID;
--��� ���� ������ ""�Ƚᵵ��

--Task3_0520.���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ���, ������ ���̽ÿ�.
SELECT BOOKID, REPLACE(BOOKNAME, '�߱�','��') AS BOOKNAME, PUBLISHER,PRICE
FROM BOOK;

--Q. '�½�����'���� ������ ������ ����� ������ ���ڼ�, ����Ʈ ���� ���Ͻÿ�
SELECT BOOKNAME ���� , LENGTH(BOOKNAME) ���ڼ� , LENGTHB(BOOKNAME) ����Ʈ��
FROM BOOK
WHERE PUBLISHER = '�½�����';

--Task4_0520. ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
--SUBSTR(NAME, 1, 1) (ù��° NAME���� 1��) �Լ��� ���ڿ� NAME�� ù ��° ���ں��� ���ں��� �����Ͽ� �� ���ڸ� ��ȯ
--GROUP BY ������ ��Ī�� �ƴ� SUBSTR(NAME,1,1) ǥ������ ����ؾ� ��
SELECT * FROM CUSTOMER;
SELECT SUBSTR(NAME,1,1) �� , COUNT(*) �ο�
FROM CUSTOMER
GROUP BY SUBSTR(NAME,1,1);

--Task5_0520. ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT * FROM orders;
SELECT orderid, orderdate as �ֹ���, orderdate + 10 Ȯ������
FROM orders;

--Task5-1_0520. ���缭���� �ֹ��Ϸκ��� 2���� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT * FROM orders;
SELECT orderid , orderdate as �ֹ���, ADD_MONTHS(orderdate,2) AS Ȯ������ 
FROM orders;

--Task6_0520.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. 
--�� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.

SELECT orderid �ֹ���ȣ, TO_CHAR(orderdate, 'YYYY-mm-dd day') �ֹ��� , custid ����ȣ, bookid ������ȣ
FROM orders
WHERE orderdate = '2020-07-07';
--WHERE orderdate = TO_DATE('20/07/07', 'YY/MM/DD')
--WHERE orderdate = TO_DATE('20/07/07', 'DD/MM/YY')




--Task7_0520. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
SELECT ORDERID , SALEPRICE FROM ORDERS
WHERE SALEPRICE < (SELECT AVG(SALEPRICE) FROM ORDERS);

--
SELECT o1.orderid , o1.saleprice
FROM ORDERS o1
WHERE o1.saleprice <= (SELECT AVG(o2.saleprice)
FROM orders o2);

--���������� o2��� ��Ī���� ����, saleprice�� ��հ��� avg_saleprice�� ���
SELECT o1.orderid, o1.saleprice
FROM ORDERS o1
JOIN (SELECT AVG(saleprice) AS avg_saleprice FROM ORDERS)o2
ON o1.saleprice < o2.avg_saleprice;



--Task8_0520. ���ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders
WHERE custid IN (SELECT custid FROM customer WHERE address LIKE '%���ѹα�%');