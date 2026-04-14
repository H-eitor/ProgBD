DECLARE
  v_senha CHAR(8);
  v_qtde_algarismos INTEGER; -- 48-57
  v_qtde_letras_minusculas INTEGER; -- 97-122
BEGIN
  v_qtde_algarismos := 0;
  v_qtde_letras_minusculas := 0;
  v_senha := 't1e2s3t4';
  FOR i IN 1..LENGTH(v_senha) LOOP
    FOR j IN 48..57 LOOP
      IF SUBSTR(v_senha,i,1) = CHR(j) THEN
        v_qtde_algarismos := v_qtde_algarismos + 1;
      END IF;
    END LOOP;
    FOR k IN 97..122 LOOP  
      IF SUBSTR(v_senha,i,1) = CHR(k) THEN
        v_qtde_letras_minusculas := v_qtde_letras_minusculas + 1;
      END IF;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_senha||' possui '||v_qtde_algarismos||' algarismos.');
  DBMS_OUTPUT.PUT_LINE(v_senha||' possui '||v_qtde_letras_minusculas||' letras minúsculas.');
END;