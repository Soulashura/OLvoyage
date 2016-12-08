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
text-align:right; -
color:Black; background:white; -
padding:0px 0px 0px 0px; margin:0px 0px 0px 0px; } -
th { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:white; -
background:#80bfff; -
padding:3px 3px 3px 3px;} -
</style> -
<title>Rapport 1 - Meilleur Employ�</title>" -
BODY "<p>OLVoyage souhaite conna�tre son meilleur employ�. Affichez le pr�nom et le nom de l�employ� qui a enregistr� le plus grand nombre de r�servations.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_01.htm

TTITLE "- Rapport 1 - Meilleur employ� -"


SELECT first_name || ' ' || UPPER(last_name) "Nom", COUNT(reservation_id) "Nombre de r�servations"
FROM t_employee e
JOIN t_reservation r
ON (e.employee_id = r.employee_id)
GROUP BY first_name || ' ' || UPPER(last_name)
HAVING COUNT(reservation_id) = (SELECT MAX(COUNT(reservation_id))
								FROM t_reservation r
								GROUP BY employee_id)
/

TTITLE OFF
SET markup html off spool off
spool off