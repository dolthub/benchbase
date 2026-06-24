-- Q11  (fraction 0.001 assumes scale factor 0.1; fraction = 0.0001 / SF)
SELECT ps_partkey, SUM(ps_supplycost * ps_availqty) AS VALUE
FROM partsupp, supplier, nation
WHERE ps_suppkey = s_suppkey AND s_nationkey = n_nationkey AND n_name = 'GERMANY'
GROUP BY ps_partkey
HAVING SUM(ps_supplycost * ps_availqty) > (
   SELECT SUM(ps_supplycost * ps_availqty) * 0.001
   FROM partsupp, supplier, nation
   WHERE ps_suppkey = s_suppkey AND s_nationkey = n_nationkey AND n_name = 'GERMANY')
ORDER BY VALUE DESC;
