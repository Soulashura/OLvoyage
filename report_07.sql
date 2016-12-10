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
<title>Rapport 7 - Top-5 des trains</title>" -
BODY "<p>Affichez le Top-5 des trains (les 5 premiers trains) par rapport aux nombres de billets réservés. Le train doit être affiché de manière suivante Paris – Brest.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_07.htm

TTITLE "- Rapport 7 - Top-5 des trains -"


SELECT a.*
FROM (SELECT d.city || ' - ' || a.city "Train", COUNT(t.reservation_id) "Nombre de billets réservés"
		FROM t_train tr
		JOIN t_station d
		ON (d.station_id = tr.departure_station_id)
		JOIN t_station a
		ON (a.station_id = tr.arrival_station_id)
		JOIN t_wagon_train wt
		ON (tr.train_id = wt.train_id)
		JOIN t_ticket t
		ON (t.wag_tr_id = wt.wag_tr_id)
		GROUP BY d.city || ' - ' || a.city
		ORDER BY COUNT(t.reservation_id) DESC) a
WHERE ROWNUM <= 5
/
TTITLE OFF
SET markup html off spool off
spool off