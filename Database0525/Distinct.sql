-- distinct 중복값 제거
SELECT DISTINCT
    category_code
FROM
    tbl_menu
ORDER BY category_code;

-- 다중 열 distinct
SELECT DISTINCT
    category_code, orderable_status
FROM
    tbl_menu;
    

-- LIMIT 반환할 행의 수를 제한
SELECT 
    menu_code, menu_name, menu_price
FROM
    tbl_menu
ORDER BY menu_price DESC
limit 1,4;
-- 0행부터 시작하는데 1행부터 4개 조회한다는 뜻

SELECT 
    menu_code, menu_name, menu_price
FROM
    tbl_menu
ORDER BY menu_price DESC
LIMIT 5;


