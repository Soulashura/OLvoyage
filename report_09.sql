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
<title>Rapport 9 - Vitesse moyenne d'un train</title>" -
BODY "<p>Calculez la vitesse moyenne des trains. Utilisez l’affichage suivant : 90 km/h. Pour chacun des trains, vous afficherez son numéro et son nom au format Paris – Bordeaux.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_09.htm

TTITLE "- Rapport 9 - Vitesse moyenne d'un train -"


SELECT train_id || ' ' || d.city || ' - ' || a.city "Nom du train", ROUND((distance/((arrival_time-departure_time)*1440))*60, 0) || ' km/h' "Vitesse"
FROM t_train t
JOIN t_station d
ON (t.departure_station_id = d.station_id)
JOIN t_station a
ON (t.arrival_station_id = a.station_id)
ORDER BY train_id
/
TTITLE OFF
SET markup html off spool off
spool off