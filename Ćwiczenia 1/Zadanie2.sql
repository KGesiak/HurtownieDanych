with cte as (
SELECT [pizza_type_id]
  FROM [cw1].[dbo].[pizza_types] types
  WHERE types.ingredients NOT LIKE '%Pineapple%')

SELECT string_agg(det.order_id,',')
		,o.date
	FROM [cw1].[dbo].[order_details] det
	JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	JOIN orders o ON o.order_id = det.order_id
	JOIN cte ON cte.pizza_type_id = p.pizza_type_id 
	WHERE o.date BETWEEN '2015-03-01' AND '2015-03-31'
	GROUP BY o.date