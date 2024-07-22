------------------------------------------

-- aggregates profit, sales, number of orders, and quantity for each sub-category Without Jinja

------------------------------------------

select
        "Sub-Category",
        sum("Sales") as total_sales,
        count("Order ID") as total_orders,
        sum("Quantity") as total_quantity,
        sum("Profit") as total_profit
    from {{ ref('superstore_table') }}
    group by "Sub-Category"


------------------------------------------

-- aggregates profit, sales, number of orders, and quantity for each sub-category With Jinja

------------------------------------------

select
        "Sub-Category",
        {% for metric in ["Sales", "Order ID", "Quantity", "Profit"] %}
       {% if metric == "Order ID" %}
            count("{{ metric }}") as total_orders
       {% else %}
            sum("{{ metric }}") as total_{{ metric | lower }}
        {% endif %}
       {% if not loop.last %},{% endif %}
        {% endfor %}
    from {{ ref('superstore_table') }}
    group by "Sub-Category"