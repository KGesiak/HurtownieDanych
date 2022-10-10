with cte as(
	SELECT 
			pt.name
			,pt.category
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id
	  JOIN dbo.pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
	  WHERE o.date LIKE '2015-01-%'
	  )

SELECT
cte.name
,cte.category
,COUNT(*) amount_sold
FROM cte
GROUP BY cte.name
,cte.category