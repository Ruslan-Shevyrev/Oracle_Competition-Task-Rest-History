# Competition Task Rest History

Имеется таблица остатков rest_history.

 :one: id_dog - id договора \
 :two: dt - дата изменения остатка \
 :three: balance - остаток на конце дня dt (0 или положительный) \

Условия:

:one: на каждую дату максимум одна запись, если остаток менялся;
:two: в таблице для каждого договора первой строкой является строка с ненулевым остатком.

Необходимо написать SQL-запрос:

:one: для каждого договора вычислить периоды, когда он имел ненулевой остаток;
:two: период закрывается датой dt-1 строки с нулевым остатком;
:three: eсли ненулевой остаток остается, то период закрывается датой 31.12.2999.

Тестовые данные:
```
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
) select * from rest_history
```

Результат для данного примера:
```
111 | 10.07.2022 | 14.08.2022
111 | 20.09.2022 | 31.12.2999
222 | 15.07.2022 | 14.09.2022
222 | 03.03.2023 | 09.05.2023
```

<table>
	<tr>
		<td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logo_mini.gif" title="logo"></td>
		<td valign="center" width="49%"><img src="https://github.com/Ruslan-Shevyrev/Ruslan-Shevyrev/blob/main/logoRS/logoRS_FULL.png" title="RuslanShevyrev"></td>
	</tr>
</table>