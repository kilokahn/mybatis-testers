     SELECT cache_plan.plan_handle, cache_plan.objtype, cache_plan.size_in_bytes,
            cache_plan.cacheobjtype, cache_plan.usecounts, sql_text.text
       FROM sys.dm_exec_cached_plans as cache_plan
OUTER APPLY sys.dm_exec_sql_text (cache_plan.plan_handle) as sql_text 
      WHERE sql_text.text like N'%MyMarker001x%' AND cache_plan.cacheobjtype='Compiled Plan' AND cache_plan.objtype='Prepared'
      
      
SELECT query_plan 
  FROM sys.dm_exec_query_plan (0x06003500F43BCC1940A17B9E010000000000000000000000)
