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
<title>Rapport 14 - Places disponibles</title>" -
BODY "<p>Affichez le numéro du train, le nom du train et le nombre de places libres. -
Ne prendre en compte que les trains qui ont parcouru une distance supérieure à 300 Km le 22/01/2017 et pour lesquels des billets ont été réservés. -
Triez les résultats par le numéro du train.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_14.htm

TTITLE "- Rapport 14 - Places disponibles -"


SELECT LPAD(tr.train_id, 2, 0) || ' ' || d.city || ' - ' || a.city "Nom du train",
	SUM(nb_seat)-COUNT(ticket_id) "Nombre de places libres"
FROM t_train tr
JOIN t_wagon_train wt
ON (tr.train_id = wt.train_id)
JOIN t_wagon w
ON (w.wagon_id = wt.wagon_id)
JOIN t_station d
ON (tr.departure_station_id = d.station_id)
JOIN t_station a
ON (tr.arrival_station_id = a.station_id)
JOIN t_ticket t
ON (t.wag_tr_id = wt.wag_tr_id)
JOIN t_reservation r
ON (t.reservation_id = r.reservation_id)
AND tr.distance > 300
AND tr.departure_time LIKE '22/01/17'
GROUP BY LPAD(tr.train_id, 2, 0) || ' ' || d.city || ' - ' || a.city
HAVING COUNT(ticket_id) > 0
ORDER BY LPAD(tr.train_id, 2, 0) || ' ' || d.city || ' - ' || a.city
/
TTITLE OFF
SET markup html off spool off
spool off