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

-- Exercício 1.2 - Verificar se um número é múltiplo de 3 ou de 5
-- Usando IF
valor := valor_aleatorio_entre(1, 100);
RAISE NOTICE 'Exercício 1.2 - IF: O valor gerado é: %', valor;
IF valor % 3 = 0 OR valor % 5 = 0 THEN
    RAISE NOTICE 'O número % é múltiplo de 3 ou de 5', valor;
ELSE
    RAISE NOTICE 'O número % não é múltiplo de 3 nem de 5', valor;
END IF;
-- Usando CASE
valor := valor_aleatorio_entre(1, 100);
RAISE NOTICE 'Exercício 1.2 - CASE: O valor gerado é: %', valor;
CASE
    WHEN valor % 3 = 0 OR valor % 5 = 0 THEN
        RAISE NOTICE 'O número % é múltiplo de 3 ou de 5', valor;
    ELSE
        RAISE NOTICE 'O número % não é múltiplo de 3 nem de 5', valor;
END CASE;

-- Exercício 1.3 - Operações de acordo com o menu
op := valor_aleatorio_entre(1, 4);  -- Gera uma operação aleatória entre 1 e 4
op1 := valor_aleatorio_entre(1, 100);
op2 := valor_aleatorio_entre(1, 100);
-- Usando IF
RAISE NOTICE 'Exercício 1.3 - IF: Operação escolhida: %', op;
IF op = 1 THEN
    resultado := op1 + op2;
    RAISE NOTICE '% + % = %', op1, op2, resultado;
ELSIF op = 2 THEN
    resultado := op1 - op2;
    RAISE NOTICE '% - % = %', op1, op2, resultado;
ELSIF op = 3 THEN
    resultado := op1 * op2;
    RAISE NOTICE '% * % = %', op1, op2, resultado;
ELSE
    IF op2 != 0 THEN
        resultado := op1 / op2::NUMERIC;
        RAISE NOTICE '% / % = %', op1, op2, resultado;
    ELSE
        RAISE NOTICE 'Divisão por zero não permitida';
    END IF;
END IF;

-- Usando CASE
RAISE NOTICE 'Exercício 1.3 - CASE: Operação escolhida: %', op;
CASE op
    WHEN 1 THEN
        resultado := op1 + op2;
        RAISE NOTICE '% + % = %', op1, op2, resultado;
    WHEN 2 THEN
        resultado := op1 - op2;
        RAISE NOTICE '% - % = %', op1, op2, resultado;
    WHEN 3 THEN
        resultado := op1 * op2;
        RAISE NOTICE '% * % = %', op1, op2, resultado;
    WHEN 4 THEN
        IF op2 != 0 THEN
            resultado := op1 / op2::NUMERIC;
            RAISE NOTICE '% / % = %', op1, op2, resultado;
        ELSE
            RAISE NOTICE 'Divisão por zero não permitida';
        END IF;
    ELSE
        RAISE NOTICE 'Opção inválida';
END CASE;

-- Exercício 1.4 - Cálculo do valor de venda com base no lucro
valor_compra := valor_aleatorio_entre(1, 100) + RANDOM();  -- Valor aleatório com parte decimal
-- Usando IF
RAISE NOTICE 'Exercício 1.4 - IF: Valor de compra: R$ %', valor_compra;
IF valor_compra < 20 THEN
    valor_venda := valor_compra * 1.45;
ELSE
    valor_venda := valor_compra * 1.30;
END IF;
RAISE NOTICE 'Valor de venda (IF): R$ %', valor_venda;
-- Usando CASE
RAISE NOTICE 'Exercício 1.4 - CASE: Valor de compra: R$ %', valor_compra;
CASE
    WHEN valor_compra < 20 THEN
        valor_venda := valor_compra * 1.45;
    ELSE
        valor_venda := valor_compra * 1.30;
END CASE;
RAISE NOTICE 'Valor de venda (CASE): R$ %', valor_venda;

END;
$$;