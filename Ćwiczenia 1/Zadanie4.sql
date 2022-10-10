with cte as (
	SELECT 
		  det.[order_id]
		  ,SUM(det.quantity * p.price) summary
		  ,MIN(o.date) date
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id 
	  GROUP BY det.order_id),

cte_month as(
	SELECT 
		  AVG(det.quantity * p.price) average
		  ,MONTH(o.date) month
	  FROM [cw1].[dbo].[order_details] det
	  JOIN dbo.pizzas p ON det.pizza_id = p.pizza_id
	  JOIN orders o ON o.order_id = det.order_id 
	  GROUP BY MONTH(o.date))

SELECT cte.order_id,cte.summary,cte_month.average,cte.date
FROM cte_month
JOIN cte on MONTH(cte.date) = cte_month.month