with cte as(
	SELECT 
			p.size
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id
	  WHERE o.date BETWEEN '2015-02-01' AND '2015-03-31'
	  )

SELECT
cte.size
,COUNT(*) amount_sold
FROM cte
GROUP BY cte.size