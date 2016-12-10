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
<title>Rapport 2 - Acheteur r�servistes sans billet</title>" -
BODY "<p>Affichez le nom et le pr�nom des acheteurs qui ont pay� des r�servations ne contenant pas de billet � leur nom (donc pour quelqu�un d�autre). Triez les r�sultats par nom et pr�nom.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_02.htm

TTITLE "- Rapport 2 - Acheteur r�servistes sans billet -"


SELECT  DISTINCT (UPPER(c.last_name)||' '||c.first_name) "Nom Pr�nom"
FROM t_customer c
JOIN t_ticket t
ON c.customer_id = t.customer_id
JOIN t_reservation r
ON t.reservation_id = r.reservation_id
WHERE c.customer_id <> buyer_id
ORDER BY (UPPER(c.last_name)||' '||c.first_name)
/
TTITLE OFF
SET markup html off spool off
spool off