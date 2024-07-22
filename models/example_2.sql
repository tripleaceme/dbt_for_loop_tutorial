------------------------------------------

-- aggregates sales by customer ID for each product category Without Jinja

------------------------------------------

select
       "Customer ID",
       sum(case when "Category" = 'Furniture' then "Sales" end) as total_furniture_sales,
       sum(case when "Category" = 'Office Supplies' then "Sales" end) as total_office_supplies_sales,
       sum(case when "Category" = 'Technology' then "Sales" end) as total_technology_sales,
       sum("Sales") as total_sales
   from {{ ref('superstore_table') }}
   group by "Customer ID"


------------------------------------------

-- aggregates sales by customer ID for each product category With Jinja

------------------------------------------

select
       "Customer ID",
       {% for category in ["Furniture", "Office Supplies", "Technology"] %}
       sum(case when "Category" = '{{ category }}' then "Sales" end) as total_{{ category | lower | replace(" ", "_") }}_sales,
       {% endfor %}
       sum("Sales") as total_sales
   from {{ ref('superstore_table') }}
   group by "Customer ID"