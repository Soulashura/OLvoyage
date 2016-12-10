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
<title>Rapport 11 - Trains de Paris</title>" -
BODY "<p>OLVoyage a besoin des statistiques sur les trains partant de Paris. -
Affichez les numéros des trains et les noms des trains avec le titre de chaque abonnement. -
Calculez également les tarifs comprenant chaque type de réduction pendant la semaine et le week-end. -
Ne pas prendre en compte les augmentations dues à la classe. Triez les résultats par numéro du train.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_11.htm

TTITLE "- Rapport 11 - Trains de Paris -"

SELECT t.train_id || ' ' || d.city || ' - ' || a.city "Nom du train", p.pass_name "Titre", t.price-((t.price*p.discount_pct)/100) "Tarif semaine", t.price-((t.price*p.discount_we_pct)/100) "Tarif week-end"
FROM t_train t
CROSS JOIN t_pass p
JOIN t_station d 
ON (t.departure_station_id = d.station_id)
JOIN t_station a
ON (t.arrival_station_id = a.station_id)
AND d.city = 'Paris'
ORDER BY t.train_id
/

TTITLE OFF 
SET markup html off spool off
spool off