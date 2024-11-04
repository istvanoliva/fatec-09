-- Função para gerar valores aleatórios
CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior INT) RETURNS INT AS
$$
BEGIN
    RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

DO $$

-- Exercício 1.1 - Verificar se um número é múltiplo de 3
-- Usando IF
valor := valor_aleatorio_entre(1, 100);
RAISE NOTICE 'Exercício 1.1 - IF: O valor gerado é: %', valor;
IF valor % 3 = 0 THEN
    RAISE NOTICE 'O número % é múltiplo de 3', valor;
ELSE
    RAISE NOTICE 'O número % não é múltiplo de 3', valor;
END IF;
-- Usando CASE
valor := valor_aleatorio_entre(1, 100);
RAISE NOTICE 'Exercício 1.1 - CASE: O valor gerado é: %', valor;
CASE
    WHEN valor % 3 = 0 THEN
        RAISE NOTICE 'O número % é múltiplo de 3', valor;
    ELSE
        RAISE NOTICE 'O número % não é múltiplo de 3', valor;
END CASE;