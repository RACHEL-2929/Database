-- join 두 개 이상의 테이블을 결합하는데 사용

-- AS

select
menu_code AS 'code',
menu_name as name, -- 특수 기호 없으면 그냥 써도 문자로 받아들여진다.
menu_price 'price'
from tbl_menu
order by price;


select
a.category_code,
a.menu_name
from tbl_menu a -- as 생략도 가능
ORDER BY
a.category_code,
a.menu_name;
-- 테이블에 별칭 지어줌


-- inner join (교집합 반환)
SELECT 
    a.menu_name, b.category_name
FROM
    tbl_menu a
        JOIN
    tbl_category b ON a.category_code = b.category_code;
    
    
    
SELECT 
    a.menu_name, b.category_name
FROM
    tbl_menu a
        INNER JOIN
    tbl_category b USING (category_code);
-- 두 개 다 똑같은 결과를 반환해준다. on으로 조건을 줄 수도 있고, using으로도 조건을 줄 수도 있다.


-- left join
SELECT 
    a.category_name, b.menu_name
FROm tbl_category a LEFT JOIN tbl_menu b ON a.category_code = b.category_code;
    
    
-- right join
SELECT 
    a.category_name, b.menu_name
FROM
    tbl_category a
        RIGHT JOIN
    tbl_menu b ON a.category_code = b.category_code;tbl_category
-- inner join이랑 똑같은 결과가 나옴
-- tbl_menu는 다 나오고  category_code에서 겹치는 것만 가지고 오는데 inner join이랑 결과가 같다.
select * from tbl_menu;
select * from tbl_category;

