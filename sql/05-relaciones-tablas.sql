
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select "Name" as song_name , a."Title" as "album_titule"
from "Track" as t 
inner join "Album" as a
on t."AlbumId" = a."AlbumId" 
order  by "album_titule";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select "Name" as artist_name, alb."Title" 
from "Artist" as a
inner join "Album" as alb 
on a."ArtistId" = alb."ArtistId" 
order by artist_name;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select concat(c."FirstName", ' ', c."LastName") as customer_name, sum(i."Total") as total_billed
from "Invoice" as i
left join "Customer" as c
on i."CustomerId" = c."CustomerId"
group by customer_name
order by total_billed desc
limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

select concat(c."FirstName", ' ', c."LastName") as client_name , 
concat(e."FirstName", ' ', e."LastName") as employee_name
from "Customer" as c
inner join "Employee" as e 
on c."SupportRepId"= e."EmployeeId"
order by employee_name;


-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select  inl."InvoiceLineId" , 
		t."Name"
from "InvoiceLine" as inl
inner join "Track" as t 
on inl."TrackId" = t."TrackId" 
order by inl."InvoiceLineId";



-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select distinct ar."Name" as artist_name, g."Name" as genre_name
from "Artist" ar
inner join "Album" al on ar."ArtistId" = al."ArtistId"
inner join "Track" t on al."AlbumId" = t."AlbumId"
inner join "Genre" g on t."GenreId" = g."GenreId"
order by artist_name, genre_name;



--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as song_name , mt."Name" as media_type
from "Track" as t
inner join "MediaType" as mt
on t."MediaTypeId" = mt."MediaTypeId"
order by media_type;


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select t."Name" as track_name , g."Name" as genre_name
from "Track" as t
left join "Genre" as g
on t."GenreId" = g."GenreId"
order by genre_name desc ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

select concat("FirstName",' ', "LastName") as client_full_name , i."InvoiceId" 
from "Customer" c 
left join "Invoice" i 
on c."CustomerId" = i."CustomerId" 
order by client_full_name ;


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que 
-- no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select al."Title" as album_title, ar."Name" as artist_name
from "Album" al
left join "Artist" ar on al."ArtistId" = ar."ArtistId"
order by album_title;



-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

select g."Name" as genre_name, 
count(t."TrackId") as num_tracks
from "Genre" as g
inner join "Track" as t 
on g."GenreId" = t."GenreId"
group by g."Name"
order by num_tracks desc;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

select al."Title" as album , 
sum(t."Milliseconds") duration_songs_total
from "Album" as al
right join "Track" as t
on al."AlbumId" = t."AlbumId"
group by album
order by album;




-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

select sum(i."Total") as total_client_spent , 
concat(c."FirstName",' ', c."LastName") as client_name, 
c."CustomerId" as client_id
from "Invoice" i
inner join "Customer" c 
on i."CustomerId" = c."CustomerId"
group by client_id
order by client_id;



-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select 
concat(e."FirstName",' ', e."LastName") as employee_name,
e."EmployeeId" employee_id,
concat(c."FirstName",' ', c."LastName") as client_name
from "Employee" e 
full join "Customer" c 
on e."EmployeeId" = c."SupportRepId" 
order by client_name;




