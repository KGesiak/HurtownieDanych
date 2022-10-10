with cte as (
	SELECT det.[order_details_id]
		  ,det.[order_id]
		  ,det.[pizza_id]
		  ,det.[quantity]
		  ,det.quantity * p.price summary
		  ,o.date
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id 
	  WHERE o.date = '2015-02-18')

SELECT cte.date, AVG(summary) average_price FROM cte
GROUP BY cte.date


  
