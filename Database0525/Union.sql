SELECT 
    menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = (SELECT 
            category_code
        FROM
            tbl_menu
        WHERE
            menu_name = '민트미역국');



-- MAX() 제일 큰 값 호출
SELECT 
    MAX(menu_price)
FROM
    tbl_menu;

SELECT 
    MAX(count)
FROM -- from 뒤에 무언가를 만들때는 별칭을 꼭 만들어야 한다.
    (SELECT 
        COUNT(*) AS 'count'
    FROM
        tbl_menu
    GROUP BY category_code) AS conuntMenu;
    
    
    
    
    
    
-- 평균 가격보다 높은 가격의 메뉴들 컬럼의 모든 걸 출력
SELECT 
    *
FROM
    tbl_menu
WHERE
    menu_price > (SELECT 
            AVG(menu_price)
        FROM
            tbl_menu);


-- union 중복을 제거한 다음에 합쳐서 결과 보여줌 (합집합) A+B - A교집합B
SELECT 
    *
FROM
    tbl_menu
WHERE
    category_code = 10 
UNION SELECT 
    *
FROM
    tbl_menu
WHERE
    menu_price < 9000;
    
    
    
    
    
SELECT 
    *
FROM
    tbl_menu
WHERE
    category_code = 10 
UNION ALL SELECT 
    *
FROM
    tbl_menu
WHERE
    menu_price < 9000;

