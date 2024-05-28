-- VIEW

/*
SELECT 문을 저장한 객체로, 가상 테이블이라고 불린다.
실질적인 데이터를 물리적으로 저장하고 있지 않고, 쿼리만 저장했지만
테이블을 사용하는 것과 동일하게 사용할 수 있다.
데이터를 쉽게 읽고 이해할 수 있도록 돕는 동시에 원본 데이터의 보안을 유지하는데 도움이 된다.
원본 데이터가 변경되면 view로 저장한 것도 같이 변경된다.
한 번 만들어놓으면 이름만 가져다 쓸 수 있다. 단, 변경이 불가능하다
*/


-- view 생성 후 조회
CREATE VIEW hansik AS
    SELECT 
        menu_code,
        menu_name,
        menu_price,
        category_code,
        orderable_status
    FROM
        tbl_menu
    WHERE
        category_code = 4;

SELECT 
    *
FROM
    hansik;

INSERT into tbl_menu values(null, '식혜맛국밥',5500,4,'Y');

SELECT 
    *
FROM
    hansik;


-- view를 통한 DML
-- view로 정보를 넣어도 원본도 바뀐 것을 알 수 있다.
INSERT into hansik values(99,'수정과맛국밥',5500,4,'Y');

SELECT 
    *
FROM
    tbl_menu;



UPDATE hansik 
SET 
    menu_name = '버터맛국밥',
    menu_price = 5700
WHERE
    menu_code = 99;



SELECT 
    *
FROM
    hansik;


DELETE FROM hansik 
WHERE
    menu_code = 99;




SELECT 
    *
FROM
    hansik;
    
    

-- view 로 DML 명령어로 조작이 불가능한 경우
/*
1. 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
2. 뷰에 포함되지 않은 컬럼 중에 베이스가 되는 컬럼이 notnull 제약조건에 지정된 경우
3. 산술 표현식이 정의된 경우
4. join 을 이용해 여러 테이블을 연결할 경우
5. DISTINCT 를 포함한 경우
6. 그룹함수나 GROUP BY 절을 포함한 경우
*/

DROP VIEW hansik;

-- 없으면 만들고 있으면 교체해라
CREATE or replace view hansik as
select
menu_code as '메뉴코드',
menu_name as '메뉴명',
category_name as '카테고리명'
from tbl_menu a
join tbl_category b on a.category_code = b.category_code
where b.category_name = '한식';


select * from hansik;
