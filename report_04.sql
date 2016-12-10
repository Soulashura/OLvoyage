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
<title>Rapport 4 - Titres d'abonnement</title>" -
BODY "<p>En pr�vision de la rentr�e, OLVoyage pr�voie une campagne publicitaire pour vendre ses abonnements. -
� la date du 30 novembre 2016, affichez les noms et les pr�noms des clients avec leur titre d�abonnement. -
Si le client a un abonnement p�rim�, affichez le titre d�abonnement avec P�rim� !, si le client n�a aucun abonnement affichez Aucun. -
Les titres d�abonnements sont valables un an � compter de la date de souscription. -
Triez les r�sultats par nom et pr�nom.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_04.htm

TTITLE "- Rapport 4 - Titres d'abonnement -"


SELECT UPPER(c.last_name) || ' ' || c.first_name "Nom et Pr�nom",
CASE 
		WHEN pass_date<='30/11/15' THEN pass_name || ' ' || 'P�rim� !'
		WHEN pass_date>'30/11/15'THEN pass_name
		ELSE 'Aucun'
		END "Titre d'abonnement"
FROM t_customer c
FULL OUTER JOIN t_pass p
ON (c.pass_id = p.pass_id)
ORDER BY "Nom et Pr�nom"
/
TTITLE OFF
SET markup html off spool off
spool off