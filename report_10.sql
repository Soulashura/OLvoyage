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
<title>Rapport 10 - Réservations Séniors de janvier 2017</title>" -
BODY "<p>OLVoyage souhaite faire une étude commerciale. -
Affichez le nombre de clients qui ont bénéficié de la réduction « Sénior » pour réserver -
des billets pour les trains partant au mois de janvier 2017. Ne prenez en compte que les réservations payées. -
Supposez que vous ne vous rappelez pas du nombre de jours dans le mois de janvier.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_10.htm

TTITLE "- Rapport 10 - Réservations Séniors de janvier 2017 -"


SELECT COUNT(c.customer_id) "Nb réservations Séniors 01/17"
FROM t_customer c
JOIN t_pass p
ON (c.pass_id = p.pass_id)
JOIN t_ticket t
ON (c.customer_id = t.customer_id)
JOIN t_reservation r
ON (t.reservation_id = r.reservation_id)
JOIN t_wagon_train w
ON (t.wag_tr_id = w.wag_tr_id)
JOIN t_train tr
ON (w.train_id = tr.train_id)
AND p.pass_name = 'Senior'
AND tr.departure_time LIKE '%/01/17'
AND (r.creation_date-c.pass_date)<365
AND r.price IS NOT NULL
/
TTITLE OFF
SET markup html off spool off
spool off