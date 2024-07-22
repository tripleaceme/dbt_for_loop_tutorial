------------------------------------------

-- Conditional Columns for Regions Without Jinja

------------------------------------------

select
       "Order ID",
       case when "Region" = 'East' then 'Yes' else 'No' end as is_east,
       case when "Region" = 'West' then 'Yes' else 'No' end as is_west,
       case when "Region" = 'Central' then 'Yes' else 'No' end as is_central,
       case when "Region" = 'South' then 'Yes' else 'No' end as is_south,
       "Customer ID"
   from {{ ref('superstore_table') }}


------------------------------------------

-- Conditional Columns for Regions With Jinja

------------------------------------------

select
       "Order ID",
       {% for region in ["East", "West", "Central", "South"] %}
       case when "Region" = '{{ region }}' then 'Yes' else 'No' end as is_{{ region | lower }},
       {% endfor %}
       "Customer ID"
   from {{ ref('superstore_table') }}