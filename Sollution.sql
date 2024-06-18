with rest_history (id_dog, dt, balance) as (
select 111, to_date('10.07.2022', 'dd.mm.yyyy'), 10 from dual union all
select 111, to_date('15.08.2022', 'dd.mm.yyyy'), 0  from dual union all
select 111, to_date('20.09.2022', 'dd.mm.yyyy'), 15 from dual union all
select 111, to_date('15.07.2022', 'dd.mm.yyyy'), 25 from dual union all
select 111, to_date('15.07.2022', 'dd.mm.yyyy'), 35 from dual union all
select 222, to_date('15.07.2022', 'dd.mm.yyyy'), 5  from dual union all
select 222, to_date('15.08.2022', 'dd.mm.yyyy'), 7  from dual union all
select 222, to_date('15.09.2022', 'dd.mm.yyyy'), 0  from dual union all
select 222, to_date('03.03.2023', 'dd.mm.yyyy'), 33  from dual union all
select 222, to_date('04.04.2023', 'dd.mm.yyyy'), 44 from dual union all
select 222, to_date('10.05.2023', 'dd.mm.yyyy'), 0  from dual 
), rest_history_l
AS (SELECT ID_DOG, 
    DT, 
    BALANCE, 
    lag(BALANCE, 1, 0) over (PARTITION BY ID_DOG ORDER BY DT) AS BALANCE_L
  FROM rest_history)

SELECT rl.ID_DOG, 
    to_char(rl.DT, 'dd.mm.yyyy') AS DATE_BEG,
    nvl(to_char((SELECT MIN(rl1.DT) - 1
      FROM rest_history_l rl1 
      WHERE rl1.BALANCE = 0 AND rl1.BALANCE_L <> 0
        AND rl1.DT > rl.DT
        AND rl1.ID_DOG = rl.ID_DOG), 'dd.mm.yyyy'), '31.12.2999')
  FROM rest_history_l rl
  WHERE BALANCE > 0 AND BALANCE_L = 0
  ORDER BY ID_DOG, DT