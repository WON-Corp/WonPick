// 회원 관련 TABLE--------------------------------------------------------
// 기존 테이블 DROP
DROP TABLE SAVE_LIST;
DROP TABLE POST_LIKE;

DROP TABLE POST_COMMENTS_LIKE;
DROP TABLE POST_COMMENT;
DROP TABLE POST;
DROP TABLE PICK;
DROP TABLE ERROR_POST_COMMENT;
DROP TABLE ERROR_POST;
DROP TABLE MEMBER;
DROP TABLE ALERT;
DROP TABLE SET_ALERT;

DROP SEQUENCE SEQ_POST_NO;
DROP SEQUENCE SEQ_ERR_POST_NO;
DROP SEQUENCE SEQ_POST_COMMENT_NO;
DROP SEQUENCE SEQ_SAVE_POST_NO;
DROP SEQUENCE SEQ_ALT_NO;

// 회원관련 TABLE 추가
CREATE TABLE MEMBER(
    USER_ID VARCHAR2(20) PRIMARY KEY,
    PASSWORD VARCHAR2(200) NOT NULL,
    USER_NAME VARCHAR2(15) NOT NULL,
    NICK_NAME VARCHAR2(20) UNIQUE NOT NULL,
    EMAIL VARCHAR2(50) UNIQUE NOT NULL,
    PHONE VARCHAR2(19) UNIQUE NOT NULL,
    GENDER VARCHAR2(6) NOT NULL,
    BIRTH DATE,
    ADDRESS VARCHAR2(100),
    INTRODUCE VARCHAR2(100),
    P_IMG VARCHAR2(300),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N', 'A'))
);

CREATE TABLE PICK(
    USER_ID VARCHAR2(20) REFERENCES MEMBER,
    PICKED_ID VARCHAR2(20) REFERENCES MEMBER
);

CREATE TABLE POST (
    POST_ID NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL,
    POST_TITLE VARCHAR2(100) NOT NULL,
    POST_CONTENT VARCHAR2(2000),
    POSTING_TIME DATE DEFAULT SYSDATE NOT NULL,
    COUNT NUMBER DEFAULT 0,
    IMG_FILE VARCHAR2(300) UNIQUE ,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

CREATE SEQUENCE SEQ_POST_NO;

CREATE TABLE POST_LIKE(
    POST_ID REFERENCES POST,
    USER_ID REFERENCES MEMBER
);

CREATE TABLE POST_COMMENT(
    POST_COMMENT_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    POST_ID REFERENCES POST,
    POST_COMMENT VARCHAR2(300) NOT NULL,
    COMMENT_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y'
);

CREATE SEQUENCE SEQ_POST_COMMENT_NO;


CREATE TABLE POST_COMMENTS_LIKE( 
    COMMENT_ID REFERENCES POST_COMMENT,
    USER_ID REFERENCES MEMBER
);


CREATE TABLE WON_MESSAGE(
    MESSAGE_ID NUMBER PRIMARY KEY,
    MS_SENDER REFERENCES MEMBER,
    MS_RECEIVER REFERENCES MEMBER,
    MESSAGE_TEXT VARCHAR2(300) NOT NULL,
    MESSAGE_TIME DATE NOT NULL
);

CREATE SEQUENCE SEQ_SAVE_POST_NO;
CREATE TABLE SAVE_LIST(
    SAVE_LIST_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    SAVED_POST_ID REFERENCES POST
);


CREATE TABLE ERROR_POST(
    ERROR_POST_ID NUMBER PRIMARY KEY,
    ERROR_POST_TITLE VARCHAR2 (100) NOT NULL,
    USER_ID REFERENCES MEMBER,
    POSTING_DATE DATE NOT NULL,
    ERROR_CONTENT VARCHAR2(600) NOT NULL,
    RESPONSED VARCHAR2(1) DEFAULT 'N' CHECK (RESPONSED IN ('Y', 'N'))
);

CREATE SEQUENCE SEQ_ERR_POST_NO;


CREATE TABLE ALERT( 
    ALERT_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    ALERT_MESSAGE VARCHAR2(300),
    ALERT_TYPE VARCHAR2(4) CHECK (ALERT_TYPE IN ('POST', 'PICK', 'CLIK', 'LIKE')) NOT NULL
);

CREATE SEQUENCE SEQ_ALT_NO;

CREATE TABLE SET_ALERT (
    USER_ID VARCHAR2(20) NOT NULL,
    POST_ALERT VARCHAR2(1) DEFAULT 'Y' CHECK (POST_ALERT IN ('Y', 'N')), -- 게시물 좋아요 알림
    PICK_ALERT VARCHAR2(1) DEFAULT 'Y' CHECK (PICK_ALERT IN ('Y', 'N')), -- 픽 알림
    COMMENT_ALERT VARCHAR2(1) DEFAULT 'Y' CHECK (COMMENT_ALERT IN ('Y', 'N')), -- 댓글 알림
    COMMENT_LIKE_ALERT VARCHAR2(1) DEFAULT 'Y' CHECK (COMMENT_LIKE_ALERT IN ('Y', 'N')), -- 댓글 좋아요 알림
    PRIMARY KEY (USER_ID),
    FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)
);



--// 알림 관련 TABLE 추후 추가
--DROP TABLE NOTICE;
--
--CREATE TABLE NOTICE(
--);







