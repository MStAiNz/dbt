{{
    config
    (
        materialized = 'table'
    )
}}

with employee as 
(
    select 
    EMPID as emp_id,
    split_part(NAME, ' ', 1) as emp_firstname,
    split_part(NAME, ' ', 2) as emp_lastname,
    SALARY as emp_salary,
    HIREDATE as emp_hiredate,
    from {{source('employee','EMPLOYEE_RAW')}} --DBT_MAZI.PUBLIC.EMPLOYEE_RAW
)
SELECT * FROM employee