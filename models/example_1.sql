------------------------------------------

-- sums the sales, quantity, and profit for each order date Without Jinja

------------------------------------------

select
       "Order Date",
       sum("Sales") as total_sales,
       sum("Quantity") as total_quantity,
       sum("Profit") as total_profit
   from {{ ref('superstore_table') }}
   group by 1


------------------------------------------

-- sums the sales, quantity, and profit for each order date With Jinja

------------------------------------------

select 
       "Order Date", 
       {% for column_name in ["Sales", "Quantity", "Profit"] %}
       sum({{ "column_name" }}) as total_{{ column_name }}
       {% if not loop.last %},{% endif %}
       {% endfor %}
   from {{ ref('superstore_table') }}
   group by 1