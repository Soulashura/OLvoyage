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
<title>Rapport 5 - Trajets effectu�s</title>" -
BODY "<p>Cr�ez le rapport sur tous les trajets effectu�s par les trains OLVoyage. Affichez le num�ro du train, le trajet qui est constitu� de la ville de d�part avec l�heure de d�part et la ville d�arriv�e avec l�heure d�arriv�e, la distance parcourue et le prix initial. Triez les r�sultats par num�ro du train.</p" - 
TABLE "border='1' width='90%' align='center'" -


spool c://olvoyage/report_05.htm

TTITLE "- Rapport 5 - Trajets effectu�s -"


SELECT tr.train_id "N� du train",
d.city||'('||TO_CHAR(tr.departure_time, 'DD/MM/YY HH24:MI')||')-'||a.city||'('||TO_CHAR(tr.arrival_time, 'DD/MM/YY HH24:MI')||')' "Trajet", 
tr.distance || ' Km' "Distance", tr.price || ' euros' "Prix Initial"
FROM t_train tr
JOIN t_station d
ON (tr.departure_station_id = d.station_id)
JOIN t_station a
ON (tr.arrival_station_id = a.station_id)
ORDER BY tr.train_id
/

TTITLE OFF
SET markup html off spool off
spool off