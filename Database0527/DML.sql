-- DML (DATA MANIPULATION LANGUAGE) 데이터 조작 언어

-- 테이블에 값을 삽입하거나 수정하거나 삭제하는 언어
-- insert, update,delete,select
 
-- insert
-- 새로운 행을 추가하는 구문이다. 테이블의 행의 수가 증가한다.

use menudb;

INSERT INTO tbl_menu(
menu_name,
menu_price,
category_code,
orderable_status
)VALUES (
'바나나 해장국',
8500,
4,
'Y'
);

select * from tbl_menu;

INSERT INTO tbl_menu VALUES(null,'바나나 해장국',8500,4, 'Y');

INSERT INTO tbl_menu(
orderable_status,
menu_price,
menu_name,
category_code
)VALUES (
'Y',
5500,
'파인애플탕',
4
);

-- 서브쿼리도 가능
INSERT INTO tbl_menu
VALUES (
null,
'순대국밥',
8500,
(SELECT category_code FROM tbl_category where category_name = '한식'),
'Y'
);

-- 여러 개도 가능
INSERT INTO tbl_menu
VALUES
(null, '참치아이스크림',1700,12,'Y'),
(null, '멸치아이스크림',1500,11,'Y');


-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다. 전체 행 갯수는 변화가 없다.

UPDATE tbl_menu
set menu_name = "델몬트바나나"
where menu_name = "바나나 해장국";

select * from tbl_menu;


UPDATE tbl_menu
SET category_code = 6
WHERE menu_price in (
select
menu_price
-- 위에 tbl_menu 중 어떤 것을 먼저 실행시켜줘야 할지 모르기 때문에 오류가 난다
-- 그래서 직접적인 명을 써주면 안된다.
from (select * from tbl_menu) AS a
WHERE menu_name = '델몬트바나나'
);

-- DELETE
-- 행을 삭제하는 구문이다. 테이블의 행의 갯수가 줄어든다.

DELETE FROM tbl_menu
where menu_name = '델몬트바나나';

-- 제일 비싼 가격 2개를 삭제함
DELETE FROM tbl_menu
ORDER BY menu_price desc
LIMIT 2;


SELECT
*
FROM tbl_menu
WHERE orderable_status = 'Y';

update tbl_menu set orderable_status = 'N'
where menu_code = 27;


-- insert 시에 충돌이 발생할 수 있다면 replace 를 통해 중복된 데이터를 덮어 쓸 수 있다
-- replace 사용시 있다면 바꿔주고, 없다면 추가해준다.
REPLACE INTO tbl_menu VALUES(1,'참기름라떼',5000,10,'Y');


