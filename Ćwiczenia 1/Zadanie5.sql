with cte as(
	SELECT 
		  COUNT(det.order_id) Number
		  ,MIN(o.date) date
		  ,DATEPART(HOUR,o.time) hour
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id 
	  WHERE o.date = '2015-01-01'
	  GROUP BY DATEPART(HOUR,o.time)
	  )

SELECT *
FROM cte