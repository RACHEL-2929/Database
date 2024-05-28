-- CAST Functions

/*
명시적 형변환
cast(expression as 데이터 형식[(길이)])
convert(expression, 데이터 형식[(길이)])
*/
use menudb;

SELECT AVG(menu_price) FROM tbl_menu;
select cast(avg(menu_price) as SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;
select convert(avg(menu_price),SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;

SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CAST('2023@5@30' AS DATE);


