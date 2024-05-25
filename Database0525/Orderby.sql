-- order by 정렬하는 기능 ---

SELECT 
    MENU_CODE, menu_name, menu_price
FROM
    tbl_MENu
ORDER BY menU_PRIcE ASC;

SELECT 
    MENU_CODE, menu_name, menu_price
FROM
    tbl_MENu
ORDER BY menU_PRIcE DESC;

SELECT 
    MENU_Code, menu_name, menu_price
FROM
    tbl_MENu
ORDER BY menU_PRIcE DESC , menu_NAME ASC;

SELECT 
    menu_code, menu_price, menu_code * menu_price
FROM
    tbl_menu
ORDER BY menu_code * menu_price DESC;

SELECT 
    menu_code, menu_price, (menu_code * menu_price) as multi
FROM
    tbl_menu
ORDER BY multi DESC;
-- 연산 한 번만 실행할 수 있게 별칭을 붙여준다 ---

SELECT FIELD('a', 'a', 'b', 'c');
-- 첫번째 것을 기준으로 뒤에 나와있는 후보 중에 몇 번째에 있는지 확인하기

SELECT 
    menu_name, orderable_status
FROM
    tbl_menu
ORDER BY FIELD(orderable_status, 'N', 'Y');
-- N이 먼저 정렬됨

SELECT 
    category_code, category_name, ref_category_code
FROM
    tbl_category
ORDER BY ref_category_code DESC;
-- 정렬할 때 널값이 제일 위로 온다.
-- 컬럼에는 널값도 들어갈 수 있다.


