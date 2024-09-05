// 회원 관련 TABLE--------------------------------------------------------
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    USER_ID VARCHAR2(20) PRIMARY KEY,
    PASSWORD VARCHAR2(20) NOT NULL,
    USER_NAME VARCHAR2(15) NOT NULL,
    NICK_NAME VARCHAR2(20) UNIQUE NOT NULL,
    EMAIL VARCHAR2(50) UNIQUE NOT NULL,
    PHONE CHAR(19) UNIQUE NOT NULL,
    GENDER CHAR(6) NOT NULL,
    BIRTH DATE,
    INTRODUCE VARCHAR2(100),
    P_IMG VARCHAR2(300),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N', 'A'))
);

DROP TABLE PICK;

CREATE TABLE PICK(
    USER_ID VARCHAR2(20) REFERENCES MEMBER,
    PICKED_ID VARCHAR2(20) REFERENCES MEMBER
);

// 해쉬태그 TABLE --------------------------------------------------------------
DROP TABLE HASHTAG;

CREATE TABLE HASHTAG(
    HASHTAG_ID NUMBER PRIMARY KEY,
    HASHTAG VARCHAR2(30) NOT NULL UNIQUE
);

// 게시글 관련 TABLE-------------------------------------------------------------
DROP TABLE POST;

CREATE TABLE POST (
    POST_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    POST_CONTENT VARCHAR2(300),
    POSTING_TIME DATE NOT NULL
);

DROP TABLE POST_IMG;

CREATE TABLE POST_IMG(
    IMG_ID NUMBER PRIMARY KEY,
    POST_ID REFERENCES POST,
    FILE_NAME VARCHAR2(225) NOT NULL
);

DROP TABLE POST_TAG;

CREATE TABLE POST_TAG(
    POST_ID NUMBER REFERENCES POST,
    TAGGED_USER_ID REFERENCES MEMBER
);

DROP TABLE POST_LIKE;

CREATE TABLE POST_LIKE(
    POST_ID REFERENCES POST,
    USER_ID REFERENCES MEMBER
);

DROP TABLE POST_HASHTAG;

CREATE TABLE POST_HASHTAG(
    HASHTAG_ID REFERENCES HASHTAG,
    POST_ID REFERENCES POST
);

DROP TABLE POST_COMMENT;

CREATE TABLE POST_COMMENT(
    POST_COMMENT_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    POST_ID REFERENCES POST,
    POST_COMMENT VARCHAR2(100) NOT NULL
);

DROP TABLE POST_COMMENTS_LIKE;

CREATE TABLE POST_COMMENTS_LIKE( 
    COMMENT_ID REFERENCES POST_COMMENT,
    USER_ID REFERENCES MEMBER
);

// 메세지 관련 TABLE
DROP TABLE WON_MESSAGE;

CREATE TABLE WON_MESSAGE(
    MESSAGE_ID NUMBER PRIMARY KEY,
    MS_SENDER REFERENCES MEMBER,
    MS_RECEIVER REFERENCES MEMBER,
    MESSAGE_TEXT VARCHAR2(300) NOT NULL,
    MESSAGE_TIME DATE NOT NULL
);

DROP TABLE MESSAGE_IMG;

CREATE TABLE MESSAGE_IMG(
    IMG_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    MESSAGE_ID REFERENCES WON_MESSAGE,
    FILE_NAME VARCHAR2(225) NOT NULL
);

// 저장목록 TABLE
DROP TABLE SAVE_LIST;

CREATE TABLE SAVE_LIST(
    SAVE_LIST_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    SAVED_POST_ID REFERENCES POST
);

// 문제 신고 TABLE
DROP TABLE ERROR_POST;

CREATE TABLE ERROR_POST(
    ERROR_POST_ID NUMBER PRIMARY KEY,
    USER_ID REFERENCES MEMBER,
    POSTING_DATE DATE NOT NULL,
    ERROR_CONTENT VARCHAR2(600) NOT NULL
);

CREATE SEQUENCE SEQ_ERR_POST_NO;

DROP TABLE ERROR_POST_COMMENT;

CREATE TABLE ERROR_POST_COMMENT(
    ERROR_POST_ID REFERENCES ERROR_POST,
    COMMENT_DATE DATE NOT NULL,
    COMMENT_TEXT VARCHAR2(600) NOT NULL
);

--// 알림 관련 TABLE 추후 추가
--DROP TABLE NOTICE;
--
--CREATE TABLE NOTICE(
--);







