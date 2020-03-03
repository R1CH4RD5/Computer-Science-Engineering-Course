-- Base de Dados II  03/03/2020
-- Ricardo Costa (José Costa 1010393)

-- 'Revisões: PL/SQL.pdf' ------------------------------------------------------
-- SETUP
CREATE TABLE ARTIGOS (
  ID NUMBER(9),
  NOME VARCHAR2(30) UNIQUE,
  PRECO NUMBER(6,2) NOT NULL,
  STOCK NUMBER(6) DEFAULT 1,
  DATA DATE DEFAULT SYSDATE,
  CONSTRAINT ARTIGO_PK PRIMARY KEY (ID)
);

CREATE TABLE VENDAS (
  ID NUMBER(9),
  ARTIGO NUMBER(2),
  QT NUMBER(2),
  DATA DATE DEFAULT SYSDATE,
  TOTAL NUMBER(7,2),
  CONSTRAINT VENDAS_PK PRIMARY KEY (ID),
  CONSTRAINT VENDAS_ART_FK FOREIGN KEY (ARTIGO)
  REFERENCES ARTIGOS(ID) ON DELETE CASCADE
);
/*'ON DELETE CASCADE' means that if we delete a subject/item on the 'ARTIGOS 
TABLE' automatically will delete on the 'VENDAS TABLE.'*/

-- Ex1
INSERT INTO ARTIGOS (ID,NOME,PRECO,STOCK)
VALUES (1,'Camisola',25,100);
INSERT INTO ARTIGOS (ID,NOME,PRECO,STOCK)
VALUES (2,'Casaco',75,20);
INSERT INTO ARTIGOS (ID,NOME,PRECO,STOCK)
VALUES (3,'Calças',50,30);
INSERT INTO ARTIGOS (ID,NOME,PRECO,STOCK)
VALUES (4,'Gravata',40,null);

-- Ex2
CREATE SEQUENCE seq_vendas
  START WITH 1000
  INCREMENT BY 1;

/*WARNINGS related with SEQUENCES:*/
SELECT bdii_1010393.seq_vendas.CURRVAL FROM DUAL;
/*The Teacher (ACCOUNT #2) can visualize the actual value of seq_vendas sequence 
that exists on the bdii_1010393 account (ACCOUNT#1).*/

SELECT bdii_1010393.seq_vendas.NEXTVAL FROM DUAL;
/*The way that the sequence works on mutiple accounts, if the #1 use the sequence 
he obtain the real number gived by #1 (1000), but when the #2 use the nextval 
(1001), if the #1 use the CURRVAL he will obtain his respective sequence value 
(1000) and not the changing of the #2 (1001), but if the #1 uses the NEXTVAL, it 
will count the #2 changes (1002).*/

-- Ex3
CREATE OR REPLACE TRIGGER venda_I
BEFORE INSERT ON VENDAS
FOR EACH ROW
DECLARE
  V_PRECO ARTIGOS.PRECO%TYPE;             -- same variable of the original table.
BEGIN
  :NEW.ID := seq_vendas.NEXTVAL;          -- value assignment is with ':='.
                                          -- comparison of values is with '='.
  SELECT PRECO
  INTO V_PRECO
  FROM ARTIGOS
  WHERE ID = :NEW.ARTIGO; 
  
  :NEW.TOTAL := V_PRECO * :NEW.QT;
END;
/

-- Ex4
CREATE OR REPLACE FUNCTION venda_artigo (pi_artigo NUMBER,pi_qt NUMBER)
RETURN NUMBER
IS
  v_id VENDAS.ID%TYPE;
BEGIN
  INSERT INTO VENDAS (ARTIGO,QT)          -- this will trigger the trigger.
  VALUES(pi_artigo,pi_qt);
  
  UPDATE ARTIGOS                          -- subtract the QT selled of the stock.
  SET STOCK = STOCK - pi_qt
  WHERE ID = pi_artigo;
  
  v_id := seq_vendas.CURRVAL;  
  return v_id;
END;
/
/*We need tohave the attention of this function is missing several types of 
exceptions...*/
