-- group by 특정 값에 따라서 그룹화하는데 사용한다.
SELECT 
    category_code
FROM
    tbl_menu
GROUP BY category_code;

-- count()
SELECT 
    category_code, COUNT(*)
FROM
    tbl_menu
GROUP BY category_code;


-- sum()
SELECT 
    category_code, SUM(menu_price)
FROM
    tbl_menu
GROUP BY category_code;


-- avg()
SELECT 
    category_code, AVG(menu_price)
FROM
    tbl_menu
GROUP BY category_code;


-- 여러가지 그룹
SELECT 
    menu_price, category_code
FROM
    tbl_menu
GROUP BY menu_price , category_code;


-- having()
SELECT 
    menu_price, category_code
FROM
    tbl_menu
GROUP BY menu_price , category_code
HAVING category_code >= 5
    AND category_code <= 8;