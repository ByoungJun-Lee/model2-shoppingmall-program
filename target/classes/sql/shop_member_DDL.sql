-------------------------------------------------------------------------------- 
							-- CREATE TABLE --
--------------------------------------------------------------------------------
DROP TABLE shop_member;

CREATE TABLE SHOP_MEMBER
(
  ID        VARCHAR2(20 BYTE)              PRIMARY KEY,
  PW        VARCHAR2(20 BYTE)                ,
  NAME      VARCHAR2(20 BYTE)                  ,
  GENDER      VARCHAR2(20 BYTE)                  ,
  PHONE     VARCHAR2(20 BYTE)                 ,
  EMAIL     VARCHAR2(50 BYTE)                 ,
  ZIP       VARCHAR2(10 BYTE)                   ,
  ADDRESS   VARCHAR2(401 BYTE)                  ,
  BIRTHDAY  DATE                  ,
  JOINDATE  VARCHAR2(20 BYTE)                  ,
  UPDATEDATE VARCHAR2(20 BYTE)   
);

-------------------------------------------------------------------------------- 
							-- CREATE PROCEDURE --
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE dummy_shop_member_gen_proc
IS
BEGIN

    FOR i IN 1..100 LOOP
        INSERT INTO shop_member VALUES 
        ('spring' || (i),
         'A!qwer1234', 
         '스프링' || (i),
         '남자',
         '010-1234-' || (1112+i),  
         'spring' || i || '@naver.com', 
         '12345',
         '경기도 부천시 신흥로 56번길 25 * 부천대학교',
         '1991-01-01',
         SYSDATE,
         NULL);
     END LOOP;

    COMMIT;    
END;
/

EXECUTE dummy_shop_member_gen_proc;

--------------------------------------------------------------------------------