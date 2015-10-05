/* 寃��깋�뼱 遺꾩꽍 �뀒�씠釉� */
CREATE TABLE ANALYSIS_KEYWORD
(
   AGE_GROUP   NUMBER (3) NOT NULL,                            /* AGE_GROUP */
   GERDER      VARCHAR (10) NOT NULL,                             /* GERDER */
   KEYWORD     VARCHAR2 (100) NOT NULL,                          /* KEYWORD */
   COUNT       NUMBER (10) DEFAULT 1                                         /* COUNT */
);

CREATE UNIQUE INDEX PK_ANALYSIS_KEYWORD
   ON ANALYSIS_KEYWORD (AGE_GROUP ASC, GERDER ASC, KEYWORD ASC);

ALTER TABLE ANALYSIS_KEYWORD
   ADD CONSTRAINT PK_ANALYSIS_KEYWORD PRIMARY KEY
          (AGE_GROUP, GERDER, KEYWORD);

/* 寃��깋�뼱 ���옣 �뀒�씠釉� */
CREATE TABLE STORED_KEYWORD
(
   NO         NUMBER (7) NOT NULL,                                  /* �깉 而щ읆 */
   USER_NO    NUMBER (7) NOT NULL,                               /* USER_NO */
   KEYWORD    VARCHAR2 (100) NOT NULL,                           /* KEYWORD */
   REG_DATE   DATE                                              /* REG_DATE */
);

CREATE UNIQUE INDEX PK_STORED_KEYWORD
   ON STORED_KEYWORD (NO ASC);

ALTER TABLE STORED_KEYWORD
   ADD CONSTRAINT PK_STORED_KEYWORD PRIMARY KEY (NO);

ALTER TABLE STORED_KEYWORD
   ADD CONSTRAINT FK_MEMBER_TO_STORED_KEYWORD FOREIGN KEY (USER_NO)
       REFERENCES MEMBER (NO);