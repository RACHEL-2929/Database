-- BUILD IN FUNCTIONS

-- 문자열 관련 함수

SELECT ASCII('A');

-- CONCAT 문자열을 이어붙이는 함수


SELECT CONCAT('호랑이', '돼지');
SELECT CONCAT_WS(',', '호랑이', '돼지');
SELECT CONCAT_WS('-', '2023', '05', '30');

-- ELT(위치, 문자열1, 문자열2,....) - FIELD(찾을문자열, 문자열1, 문자열2,...)
-- FIND_IN_SET(찾을문자열, 문자열 리스트...) INSTR(기존문자열, 부분문자열)
-- LOCATE(부분문자열, 기준문자열)

SELECT ELT(2, '사과', '딸기', '바나나');	-- 해당 위치의 문자열 반환
SELECT FIELD('딸기', '사과', '딸기', '바나나');	-- 찾을 문자열 위치 반환
SELECT FIND_IN_SET('바나나', '사과,딸기,바나나');	-- 찾을 문자열의 위치 반환
SELECT INSTR('사과딸기바나나', '딸기');	-- 기존 문자열에서 부분 문자열의 시작 위치 반환
SELECT LOCATE('딸기', '사과딸기바나나');	-- 위와 똑같은데 인자의 위치만 달라진 것

-- FORMAT(숫자,소수점 자릿수)
SELECT FORMAT(12345123123.34565, 3);	-- 천자리마다 콤마 찍어주고 소수점은 3자리까지 나타내줌

-- BIN()	OCT()	HEX()
-- 2진수	    8진수	16진수
SELECT BIN(65), OCT(65), HEX(65);

-- INSERT(기준 문자열, 위치, 길이, 삽입할 문자열);
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');	-- 7번째부터 3자리를 홍길동으로 바꾼다

-- LEFT(문자열, 길이) 	RIGHT(문자열, 길이)
SELECT LEFT('HELLO WORLD', 3), RIGHT('HELLO WORLD', 3);

-- UPPER(문자열), LOWER(문자열)
SELECT LOWER('Hello world'), UPPER('Hello world');

-- LPAD(문자열, 길이, 채울문자열) RPAD(문자열, 길이, 채울문자열)
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6, '@');

-- LTRIM(문자열), RTRIM(문자열)	- 공백제거
SELECT LTRIM('       왼쪽'), RTRIM('오른쪽      ');

-- TRIM(문자열)
SELECT TRIM('   MYSQL   ');
SELECT TRIM(BOTH '@' FROM '@@@MYSQL@@@');
-- LEADING (앞), BOTH(양쪽), TRAILING(뒤)

-- REPEAT(문자열, 횟수)
SELECT REPEAT('MYSQL', 3);

-- REPLACE (문자열, 찾을문자열, 바꿀문자열)
SELECT REPLACE('마이SQL', '마이', 'MY');


-- REVERSE(문자열)
SELECT REVERSE('stressed');


-- SPACE(길이)
SELECT 
    CONCAT('제 이름은',
            SPACE(5),
            '이고 나이는',
            SPACE(3),
            '세 입니다.');
            
-- SUBSTRING(문자열,시작위치,길이)
SELECT SUBSTRING('안녕하세요 반갑습니다', 7, 2);
SELECT SUBSTRING('안녕하세요 반갑습니다', 7);
-- 길이를 생략하면 시작위치부터 끝까지 나옴


-- SUBSTRING_INDEX(문자열,구분자,횟수)
SELECT SUBSTRING_INDEX('hong.test@gmail.com', '.', 2);
-- 2번째 나오는 .부터 뒤를 싹 지움

-- 수학 관련 함수


-- ABS(숫자)	-- 절대값
SELECT ABS(- 123);

-- CEILING(숫자), FLOOR(숫자), ROUND(숫자)
-- 올림	           버림       반올림
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV(1010, 2, 8);

-- POW(숫자1,숫자2) SQRT(숫자)
-- 거듭제곱          제곱근
SELECT POW(2, 4), SQRT(16);


-- RAND()
-- 0이상 1미만의 실수
-- M과 N 사이의 임의의 정수를 구하려면
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);


-- SIGN(숫자)	-- 양수면 1, 0이면 0, 음수면 -1 반환
SELECT SIGN(10.1), SIGN(0), SIGN(- 10.1);


-- TRUNCATE(숫자, 정수)
-- 소수점을 나타내고 싶은 자리까지 나타내기
-- 소수점을 기준으로 정수 위치까지 구하고 나머지는 버린다.
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, - 2);


-- ADDDATE(날짜,차이), SUBDATE(날짜,차이)
SELECT ADDDATE('2023-05-31', INTERVAL 30 DAY);
-- 해당 날짜만큼 이후
SELECT SUBDATE('2023-05-31', INTERVAL 30 DAY);
-- 해당 날짜만큼 전

-- ADDTIME(날짜/시간, 시간), SUBTIME(날짜/시간, 시간)
SELECT ADDTIME('2023-05-31 09:00:00', '1:0:1');
-- 해당 시간만큼 더해짐
SELECT SUBTIME('2023-05-31 09:00:00', '1:0:1');
-- 해당 시간만큼 뺌


-- CURDATE(), CURTIME(),NOW(), SYSDATE()->시스템 상 날짜와시간
SELECT CURDATE(), CURRENT_TIME(), NOW(), SYSDATE();

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT 
    HOUR(CURTIME()),
    MINUTE(CURTIME()),
    SECOND(CURRENT_TIME()),
    MICROSECOND(CURRENT_TIME());
    
SELECT DATE(NOW()), TIME(NOW());


-- datediff(날짜1, 날짜2), timediff(날짜또는시간1, 날짜또는시간2);
SELECT DATEDIFF('2024-05-30', NOW());
SELECT TIMEDIFF('17:07:11', '13:06:10');
-- 앞에 것에서 뒤에 것을 뺌

SELECT DAYOFWEEK(CURDATE());	-- 일요일이 1
SELECT MONTHNAME(CURDATE());	-- 해당 달의 영어이름
SELECT DAYOFYEAR(CURDATE());	-- 1/1일부터 며칠이 흘렀는지


-- last_day(날짜)
SELECT LAST_DAY('20230201');


-- makedate(연도,정수)
SELECT MAKEDATE(2024, 32);	-- 해당연도 첫날에서 정수만큼 지난 날짜


-- period_add(연월,개월 수)
select period_add(202305,6);	-- 해당 개월수만큼 더한 것


-- quarter(날짜)
SELECT quarter(curdate());		-- 분기 나타내기


-- TIME_TO_SEC(시간)
-- 입력한 시간을 초 단위로 구함
select time_to_sec('1:1:1');		-- 해당 시간을 초단위로 나타내줌