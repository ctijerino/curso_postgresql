--- BLOQUE SENCILLO
DO $$
<<first_block>>
DECLARE
	contador integer:= 0;
BEGIN
	contador := contador + 1;
	RAISE NOTICE 'El valor actual es %', contador;
	contador := contador + 1;
	RAISE NOTICE 'El valor actual es %', contador;
END first_block  $$;

--- SUB BLOQUES
DO $$
<<bloque_externo>>
DECLARE
	contador integer:= 0;
BEGIN
	contador := contador + 1;
	RAISE NOTICE 'El valor actual es %', contador;
	DECLARE
		contador integer:=0;
	BEGIN
		RAISE NOTICE 'El valor del bloque interno es %', contador;
		RAISE NOTICE 'El valor del bloque externo es %', bloque_externo.contador;
	END;
	RAISE NOTICE 'El valor del bloque externo al salir es %', contador;
END bloque_externo $$;

--- Variables
DO $$
DECLARE
	creado time := NOW();
BEGIN
	RAISE NOTICE '%', creado;
	PERFORM pg_sleep(10);
	creado := now();
	RAISE NOTICE '%', creado;
END$$;

-- Primer Funcion
CREATE FUNCTION inc(val integer) RETURNS integer AS $$
BEGIN
	return val + 1;
END; $$
LANGUAGE PLPGSQL;

select inc(20);
select inc(inc(20));

