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
text-align:left; -
color:Black; background:white; -
padding:0px 0px 0px 0px; margin:0px 0px 0px 0px; } -
th { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:white; -
background:#80bfff; -
padding:3px 3px 3px 3px;} -
</style> -
<title>Rapport 15 - Organigramme</title>" -
BODY "<p>Suite aux nombreux recrutements, OLVoyage souhaite établir un nouvel organigramme. -
Le nombre des réservations enregistrées par les employés doit suivre leur nom et leur prénom indentés. -
Etant donné que le dirigeant ne s’occupe pas des réservations, il ne doit pas apparaitre sur l’organigramme.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_15.htm

TTITLE "- Rapport 15 - Organigramme -"


SELECT LPAD(e.last_name || ' ' || e.first_name, LENGTH(e.last_name  || ' ' || e.first_name)+(LEVEL*2)-2, '_') "Nom et Prénom", 
	NVL(r.cr, 0) "Nombre de réservation"
FROM t_employee e
FULL OUTER JOIN (SELECT employee_id, COUNT(reservation_id) cr
		FROM t_reservation
		GROUP BY employee_id) r
ON (r.employee_id = e.employee_id)
START WITH e.manager_id = 1
CONNECT BY PRIOR e.employee_id = e.manager_id
/
TTITLE OFF
SET markup html off spool off
spool off