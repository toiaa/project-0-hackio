
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.

select min("Milliseconds") as min_duration
from "Track";

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select max("Milliseconds") as max_duration
from "Track";

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
select min("UnitPrice") as min_price
from "Track";

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
select max("UnitPrice") as max_price
from "Track";   

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
select min("InvoiceDate") as min_invoice_date
from "Invoice";

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
select max("InvoiceDate") as max_invoice_date
from "Invoice";

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.

select count(*) as total_tracks
from "Track";

-- Ejercicio 8: Contar el número de clientes en Brasil.
select count(*) as total_customers_in_brazil
from "Customer"
where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
select sum("Milliseconds") as total_duration_ml
from "Track";

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select count(*) as total_sales_support_agents
from "Employee"
where "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select sum("Total") as total_invoice
from "Invoice";





/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select round(avg("Milliseconds"),2) as media_mls_duration
from "Track";

-- Ejercicio 13: Calcular el precio medio de las pistas.
select round(avg("UnitPrice"),2) as media_price
from "Track";

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select round(stddev("Milliseconds"),2) as desviacion_mls_duration
from "Track";

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select round(variance("Milliseconds"),2) as variance_mls_duration
from "Track";

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select round(stddev("UnitPrice"), 2) as desviacion_price
from "Track";




/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select concat("FirstName" , ' ' , "LastName") as full_name
from "Customer";


