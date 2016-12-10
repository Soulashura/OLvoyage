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
<title>Rapport 6 - Statistiques</title>" -
BODY "<p>La soci�t� OLVoyage souhaite faire des statistiques. -
Affichez les totaux pour les unit�s suivantes : employ�s, clients, pourcentage des clients abonn�s (bien �videmment les calculs doivent exclure les abonnements p�rim�s), -
trains, gares, r�servations, billets. Prendre en compte les r�servations et les billets non pay�s. -
Votre rapport ne contiendra qu�une seule ligne avec un total par colonne.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_06.htm

TTITLE "- Rapport 6 - Statistiques -"


SELECT e.nbe "Nb employ�s", c.nbc "Nb clients", ROUND((ca.pca*100)/c.nbc) || '%' "Clients abonn�s", 
		tr.nbtr "Nb trains", s.nbs "Nb gares", r.nbr "Nb r�servations", t.nbt "Nb billets"
FROM (SELECT COUNT(employee_id)nbe
		FROM t_employee) e,
		(SELECT COUNT(customer_id)nbc
		FROM t_customer) c,
		(SELECT COUNT(customer_id) pca
		FROM t_customer
		WHERE pass_date > sysdate-365) ca,
		(SELECT COUNT(train_id)nbtr
		FROM t_train) tr,
		(SELECT COUNT(station_id)nbs
		FROM t_station) s,
		(SELECT COUNT(reservation_id)nbr
		FROM t_reservation) r,
		(SELECT COUNT(ticket_id)nbt
		FROM t_ticket) t
/
TTITLE OFF
SET markup html off spool off
spool off