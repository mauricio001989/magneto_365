# README

## POST
* 1) Se deben poder crear películas (nombre, descripción, url de la imagen y días de presentación).
https://magneto-365.herokuapp.com/api/v1/films
{ 
	"film": { 
		"name": "rapido f",
		"description": "carros",
		"url_image": "www.image",
		"start_date": "30-04-2020",
		"final_date": "30-04-2020"
	}
}

## GET
* 2) Se deben listar las películas, filtradas por un dia en particular.
https://magneto-365.herokuapp.com/api/v1/films/2015-01-31
https://magneto-365.herokuapp.com/api/v1/films (lista todas las peliculas basandose en la fecha actual)


## GET
* 4) El número de sillas es de 10, si una película ya tiene 10 reservaciones se debe bloquear la opción de reservar.
https://magneto-365.herokuapp.com/api/v1/films/2015-01-31
  "free_chair": false (resultado esperado)

## POST
* 5) Para reservar se necesita los datos de cédula, correo, nombre, phone y  id_film
https://magneto-365.herokuapp.com/api/v1/reservations
{ 
	"user": {
	  "name": "mao",
	  "email": "mao@hot",
	  "id_document": "55555",
	  "phone": "3333"
	},
	"id_film": "2"
}

## GET
* 6) Mostrar en otra vista el resumen de reservas (Pelicula, Dia, Cedula, Nombre, Correo, Celular)
https://magneto-365.herokuapp.com/api/v1/reservations
