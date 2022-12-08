#1

with avg_day as
(
	select dimDate as day, avg(amount) as average
	from FACTSales
	group by dimDate
)

select
	c.day day
	,avg(c.average) over (order by c.day rows between 2 preceding and current row ) as Moving_avg
from avg_day c


#2

select carrier,
	[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12] 
from 
(
select 
      month(dimDate) as Month
      ,[amount]
	, c.carrier_name as carrier
  from FACTSales fs
  join Carriers c on fs.carrier_idkey = c.carrier_id
) as SourceTable
pivot
(
	sum(amount)
  for Month IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
) as PivotTable


-- 3

SELECT 
      ca.[carrier_name]
      ,fs.[customer_idkey]
      ,sum(fs.[amount])
  from FACTSales fs
  join Carriers ca on fs.carrier_idkey = ca.carrier_id
  group by rollup( ca.[carrier_name],fs.[customer_idkey])
  order by  ca.[carrier_name]


select * from carriers



