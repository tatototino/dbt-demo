{{ config(materialized='incremental') }}


with personunion as (
SELECT *  FROM   {{ source('hive', 'pessoas') }} INNER JOIN  {{ source('trino-mariadb', 'persons') }} ON {{ source('hive', 'pessoas') }}.nome = {{ source('trino-mariadb', 'persons') }}.FirstName
),



final as (
select * from  personunion
)

select * from final
