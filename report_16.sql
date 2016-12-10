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
<title>Rapport 16 - Augmentation des coordinateurs</title>" -
BODY "<p>Pour remercier ses coordinateurs de ventes, la société souhaite augmenter leur salaire de 100$. -
Affichez le numéro de l’employé, son nom et son prénom, ainsi que le salaire augmenté.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_16.htm

TTITLE "- Rapport 16 - Augmentation des coordinateurs -"


SELECT employee_id "N° employé", UPPER(last_name) || ' ' || first_name "Nom et Prénom", salary+100 "Salaire augmenté"
FROM t_employee
WHERE employee_id IN (SELECT employee_id 
			FROM t_employee
			WHERE manager_id = 1)
/
TTITLE OFF
SET markup html off spool off
spool off