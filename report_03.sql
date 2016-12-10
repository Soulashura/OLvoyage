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
<title>Rapport 3 - Première réservation effectuée</title>" -
BODY "<p>Quelle a été la première réservation effectuée ? Affichez son numéro, sa date de création, le nom et le prénom de l’employé et de l’acheteur.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_03.htm

TTITLE "- Rapport 3 - Première réservation effectuée -"

SELECT DISTINCT r.reservation_id "Num réservation", r.creation_date "Créé le", UPPER(e.last_name) || ' ' || e.first_name "Nom employé", UPPER(c.last_name) || ' ' || c.first_name "Nom acheteur"
FROM t_reservation r
JOIN t_ticket t
ON (t.reservation_id = r.reservation_id)
JOIN t_customer c 
ON (t.customer_id = c.customer_id)
JOIN t_employee e
ON (r.employee_id = e.employee_id)
WHERE r.creation_date = (SELECT MIN(creation_date)
			FROM t_reservation)
/
TTITLE OFF
SET markup html off spool off
spool off