with cte as (
	SELECT 
		  det.[order_id]
		  ,SUM(det.quantity * p.price) summary
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id
	  WHERE o.date LIKE '2015-02-%'
	  GROUP BY det.order_id)

SELECT TOP (10) rank () over (
	order by summary desc
) placement
,cte.order_id
,cte.summary
FROM cte