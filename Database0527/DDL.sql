-- DDL (Data Definition Language)
-- 데이터베이스의 스키마를 정의하거나 수정하는 데 사용되는 것.


-- CREATE
-- 테이블 생성을 위한 구문.
-- IF NOT EXISTS 를 적용하면 기존에 존재하는 테이블이더라도 에러가 발생하지 않는다.

CREATE TABLE IF NOT EXISTS tbl (
pk INT PRIMARY KEY,
fk INT,
col1 VARCHAR(255),
-- 제약조건으로 Y 또는 N만 받을 수 있도록 함
CHECK(col1 IN ('Y','N'))
)ENGINE = InnoDB;

-- 만든 테이블의 구조를 볼 수 있다.
DESCRIBE tbl;

INSERT INTO tbl VALUES(1,10,'Y');

SELECT * FROM tbl;

CREATE TABLE IF NOT EXISTS tb2(
pk INT AUTO_INCREMENT PRIMARY KEY,
fk INT,
col1 VARCHAR(255),
CHECK(col1 IN ('Y','N'))
)ENGINE = InnoDB;

DESCRIBE tb2;

INSERT INTO tb2 VALUES (null,10,'Y');
INSERT INTO tb2 VALUES (null,20,'Y');
INSERT INTO tb2 VALUES (null,30,'Y');

SELECT * FROM tb2;


-- ALTER
-- 데이블에 추가, 변경, 삭제하는 모든 것은 ALTER 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것들 살펴본다.

-- 새로운 열(속성) 추가하기
ALTER TABLE tb2
ADD col2 INT;

DESCRIBE tb2;

-- 컬럼을 지울 수도 있다.
ALTER TABLE tb2
DROP COLUMN col2;


-- 열 이름 바꾸기 바뀔 컬럼, 바뀔 이름 자료형 제약조건
ALTER TABLE tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

-- auto increment가 걸려져 있으면 해당 컬럼은 지울 수 없다.
-- 해당 요소를 제거하고 실행하면 primary key의 요소가 지워짐
ALTER TABLE tb2
DROP PRIMARY KEY;

-- auto increment 삭제함
ALTER TABLE tb2
MODIFY pk INT;

DESCRIBE tb2;


-- DROP
-- 테이블을 삭제하기 위한 구문
DROP TABLE IF EXISTS tbl,tb2;