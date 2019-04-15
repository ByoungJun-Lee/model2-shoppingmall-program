DROP TABLE shop_board;

DROP SEQUENCE shop_board_seq;

CREATE SEQUENCE shop_board_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE;

CREATE TABLE shop_board (
	board_num       NUMBER DEFAULT 0,
    board_kinds     NUMBER DEFAULT 0,
	board_writer    VARCHAR2(30)        NOT NULL,
	board_pw        VARCHAR2(15),
	board_subject   VARCHAR2(50)        NOT NULL,
	board_content   VARCHAR2(2000)      NOT NULL,
	board_file      VARCHAR2(50),
	board_re_ref    NUMBER              ,
	board_re_lev    NUMBER              ,
	board_re_seq    NUMBER              ,
	board_read_count NUMBER DEFAULT 0,
	board_date      DATE,
    product_id      VARCHAR2(50) DEFAULT NULL,
	PRIMARY KEY(board_num),
    CONSTRAINT fk_board_writer FOREIGN KEY (board_writer) 
    REFERENCES shop_member (id)
    
);

COMMIT;

DROP PROCEDURE shop_board_dummy_gen_proc;

CREATE OR REPLACE PROCEDURE shop_board_dummy_gen_proc
IS
BEGIN

    FOR i IN 1..100 LOOP
        INSERT INTO shop_board VALUES 
        (
        	shop_board_seq.nextval,
            1,
        	'spring'|| i,
        	null,
        	'글 제목'|| i,
        	'글 내용',
        	null,
        	shop_board_seq.nextval,
        	0,
        	0,
        	0,
        	TO_DATE('2018-11-16 12:34:56', 'YYYY-MM-DD HH24:MI:SS'),
            null
        );
     END LOOP;

    COMMIT;    
END;
/

EXECUTE shop_board_dummy_gen_proc;