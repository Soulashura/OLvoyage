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
<title>Rapport 8 - Clients sans abonnement</title>" -
BODY "<p>Pour sa campagne publicitaire OLVoyage souhaite connaître le prénom, le nom et l’adresse des clients qui n’ont jamais eu d’abonnement. Triez les résultats par nom et prénom.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_08.htm

TTITLE "- Rapport 8 - Clients sans abonnement -"



SELECT UPPER(last_name)||' '||first_name "Nom Prénom", address "Adresse"
FROM t_customer
WHERE pass_date IS NULL
ORDER BY "Nom Prénom"
/

TTITLE OFF
SET markup html off spool off
spool off