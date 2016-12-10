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
<title>Rapport 13 - Billets des moins de 25 ans</title>" -
BODY "<p>Affichez le numéro du billet, le prénom et le nom du client ainsi que le train (même format que pour le rapport 5) -
pour les billets de première classe ayant été réservés par les clients de moins de 25 ans. -
Ne récupérez que les informations sur les réservations payées qui ont été faites 20 jours avant la date de départ du train. -
Ne prenez en compte que les trains qui partent entre le 15/01/2017 et le 25/01/2017. -
Triez les résultats par la date de la réservation.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_13.htm

TTITLE "- Rapport 13 - Billets des moins de 25 ans -"


SELECT t.ticket_id "Numéro du billet", c.first_name || ' ' ||UPPER(c.last_name) "Nom du client", 
		d.city||'('||TO_CHAR(tr.departure_time, 'DD/MM/YY HH24:MI')||')-'||a.city||'('||TO_CHAR(tr.arrival_time, 'DD/MM/YY HH24:MI')||')' "Nom du train"
FROM t_ticket t
JOIN t_customer c
ON (t.customer_id = c.customer_id)
JOIN t_wagon_train wt
ON(t.wag_tr_id = wt.wag_tr_id)
JOIN t_train tr
ON (wt.train_id = tr.train_id)
JOIN t_station d
ON (tr.departure_station_id = d.station_id)
JOIN t_station a
ON (tr.arrival_station_id = a.station_id)
JOIN t_wagon w
ON (wt.wagon_id = w.wagon_id)
JOIN t_reservation r
ON (t.reservation_id = r.reservation_id)
AND w.class_type = 1
AND c.birth_date+9125>'26/12/16'
AND r.price IS NOT NULL
AND (tr.departure_time-r.creation_date)<20
AND tr.departure_time BETWEEN '15/01/17' AND '25/01/17'
ORDER BY r.creation_date
/
TTITLE OFF
SET markup html off spool off
spool off