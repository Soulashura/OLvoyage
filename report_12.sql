set markup HTML ON ENTMAP ON SPOOL ON PREFORMAT OFF HEAD "<style type='text/css'> -
body { -
font:10pt Arial,Helvetica,sans-serif; -
color:black; background:white; -
text-align: center; } -
p { -
font:8pt Arial,sans-serif; -
color:grey; background:white; } -
table,tr,td { -
font:10pt Arial,Helvetica,sans-serif; -
text-align:center; -
color:Black; background:white; -
padding:0px 0px 0px 0px; margin:0px 0px 0px 0px; } -
th { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:white; -
background:#80bfff; -
padding:3px 3px 3px 3px;} -
</style> -
<title>Rapport 12 - Popularité des abonnements</title>" -
BODY "<p>Affichez les titres des abonnements du plus vendu au moins vendu.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_12.htm

TTITLE "- Rapport 12 - Popularité des abonnements -"


SELECT pass_name "Titre"
FROM t_pass p
JOIN t_customer c
ON (c.pass_id = p.pass_id)
GROUP BY pass_name
ORDER BY COUNT(customer_id) DESC
/
TTITLE OFF
SET markup html off spool off
spool off