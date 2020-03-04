-- Base de Dados II  04/03/2020
-- Ricardo Costa (José Costa 1010393)

-- 'Revisões: PL/SQL.pdf' ------------------------------------------------------
-- Ex3 (but with validations)
CREATE OR REPLACE FUNCTION venda_artigo (pi_artigo NUMBER, pi_qt NUMBER) 
RETURN NUMBER
IS
  v_id VENDAS.ID%TYPE;
  v_stock ARTIGOS.STOCK%TYPE;
BEGIN
  SELECT STOCK				                    -- verify the stock (validation)
  INTO v_stock
  FROM ARTIGOS
  WHERE ID = pi_artigo;
  
  IF (v_stock >= PI_QT) AND (pi_qt > 0) THEN
    INSERT INTO VENDAS (ARTIGO,QT)        -- this will trigger the trigger.
    VALUES(pi_artigo,pi_qt);
  
    UPDATE ARTIGOS                        -- subtract the QT selled of the stock.
    SET STOCK = STOCK - pi_qt
    WHERE ID = pi_artigo;
  
    v_id := seq_vendas.CURRVAL; 
  ELSE
    v_id := -1;
    raise_application_error(-20100,'Stock Insuficiente.');
  END IF;
  return v_id;
END;
/

-- ADDING INFO INTO VENDAS TABLE (simple) ---------------------------_----------
INSERT INTO VENDAS (ARTIGO,QT)
VALUES (1,2);

SELECT * FROM VENDAS;

-- Ex5 -------------------------------------------------------------------------
set serveroutput on;                      -- activating the output on console.

/*
-- About CURSOR

CURSOR c_venda IS
  SELECT
  
OPEN c_venda;
LOOP
  FETCH c_venda INTO ;
  EXIT WHEN c_venda%NOTFOUND;
  ...
END LOOP;
CLOSE c_venda;*/

CREATE OR REPLACE PROCEDURE mostra_venda (pi_date DATE) IS
  
  CURSOR c_venda IS
    SELECT NOME,QT, TOTAL
    FROM VENDAS, ARTIGOS
    WHERE VENDAS.ARTIGO = ARTIGOS.ID
    AND TRUNC(VENDAS.DATA) = TRUNC(PI_DATA);
    v_reg_venda c_venda%ROWTYPE;          -- all 'variables' of the CURSOR
    v_total VENDAS.TOTAL%TYPE;
    
BEGIN
  OPEN c_venda;
    LOOP
      FETCH c_venda INTO v_reg_venda;
      EXIT WHEN c_venda%NOTFOUND;
      dbms_output.put_line(v_reg_venda.NOME||''||v_reg_venda.QT||''||v_reg_venda.total);
      v_total := v_total + v_reg_venda.total;
    END LOOP;
  CLOSE c_venda;   
  dbms_output.put_line(v_total);
END;
/
/*A SELECT that give more than one line as result, a CURSOR needs to be used. 
After the CURSOR is created, we need to open it (OPEN Command). After been open, 
the CURSOR need to 'see' on each row (FETCH)...*/

/*Creating a Test Procedure (EXEMPLIFICATION)*/
CREATE OR REPLACE PROCEDURE teste IS
  v_id VENDAS.ID%TYPE;
BEGIN
  v_id := venda_artigo(2, 3);
  dbms_output.put_line(v_id);
  
  v_id := venda_artigo(2, 300);
  dbms_output.put_line(v_id);

  mostra_venda(SYSDATE);
END;
/

/*In the case of craete VENDAS table we can directly apply the sequence on the 
creation of the table:
...
id number(9) default seq_vendas.nextval primary key,
...*/

/* IMPORTANT: This needs review because at the final the total code doesn't work 
as requered...*/