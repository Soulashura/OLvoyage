UPDATE t_reservation
SET buy_method = INITCAP('&type_de_paiement'),
   price = (SELECT SUM((tr.price)+
                           ((tr.price*NVL(w.class_pct, 0))/100)-
                           (((tr.price+((tr.price*NVL(w.class_pct, 0))/100))*NVL(CASE
          WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 1 AND 5 THEN discount_pct
          WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 6 AND 7 THEN discount_we_pct
          END, 0))/100))
                   FROM t_reservation r
                   JOIN t_ticket t
                   ON (r.reservation_id = t.reservation_id)
                   JOIN t_customer c
                   ON (t.customer_id = c.customer_id)
                   FULL OUTER JOIN t_pass p
                   ON (c.pass_id = p.pass_id)
                   JOIN t_wagon_train wt
                   ON (t.wag_tr_id = wt.wag_tr_id)
                   JOIN t_train tr
                   ON (wt.train_id = tr.train_id)
                   JOIN t_wagon w
                   ON (wt.wagon_id = w.wagon_id)
       WHERE r.reservation_id = &&num_de_reservation
                   GROUP BY r.reservation_id)
WHERE reservation_id = &num_de_reservation
/
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
<title>Rapport 17 - Paiement des réservations</title>" -
BODY "" - 
TABLE "border='1' width='90%' align='center'" -

TTITLE "- Réservation &&num_de_reservation -"

spool c://olvoyage/resa_&&num_de_reservation.htm


SELECT t.reservation_id "N° réservation", r.price "Prix réservation", c.customer_id "N° client", 
		UPPER(c.last_name) || ' ' || c.first_name "Nom client", t.ticket_id "N° ticket", ROUND((tr.price)+
                ((tr.price*NVL(w.class_pct, 0))/100)-
                (((tr.price+((tr.price*NVL(w.class_pct, 0))/100))*NVL(CASE 
									WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 1 AND 5 THEN discount_pct
									WHEN TO_CHAR(tr.departure_time, 'D') BETWEEN 6 AND 7 THEN discount_we_pct
									END, 0))/100), 2)"Prix ticket",
		p.pass_name "Abonnement", r.buy_method "Moyen de paiement", d.city || ' - ' || a.city "Trajet", w.class_type "Classe",
		CASE 
			WHEN TO_CHAR(tr.departure_time, 'D')=1 THEN 'Lundi'
			WHEN TO_CHAR(tr.departure_time, 'D')=2 THEN 'Mardi'
			WHEN TO_CHAR(tr.departure_time, 'D')=3 THEN 'Mercredi'
			WHEN TO_CHAR(tr.departure_time, 'D')=4 THEN 'Jeudi'
			WHEN TO_CHAR(tr.departure_time, 'D')=5 THEN 'Vendredi'
			WHEN TO_CHAR(tr.departure_time, 'D')=6 THEN 'Samedi'
			WHEN TO_CHAR(tr.departure_time, 'D')=7 THEN 'Dimanche'
		END "Jour"
FROM t_reservation r
JOIN t_ticket t
ON r.reservation_id = t.reservation_id
JOIN t_customer c
ON t.customer_id = c.customer_id
FULL OUTER JOIN t_pass p
ON c.pass_id = p.pass_id
JOIN t_wagon_train wt
ON t.wag_tr_id = wt.wag_tr_id
JOIN t_wagon w
ON wt.wagon_id = w.wagon_id
JOIN t_train tr
ON wt.train_id = tr.train_id
JOIN t_station d
ON tr.departure_station_id = d.station_id
JOIN t_station a
ON tr.arrival_station_id = a.station_id
AND r.reservation_id = &&num_de_reservation
ORDER BY r.reservation_id
/

TTITLE OFF 
SET markup html off spool off
spool off



