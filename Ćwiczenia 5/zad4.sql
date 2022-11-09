create view zad4 with schemabinding as
select [order_id]
,[time]
,[order_details_id]
,c.[carrier_id]
,[pizza_id]
,[carrier_name]
,[address]
,[tax_id]
,[contact_person]
from [dbo].[zad2] z
join [dbo].[carrier] c on c.carrier_id = z.carrier_id;


create unique clustered index zad4_1 on zad4 (
[order_id]
,[time]
,[order_details_id]
,[pizza_id]
,[carrier_name]
,[address]
,[tax_id]
,[contact_person]
)
