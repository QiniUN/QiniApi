# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Station.create(name: "Calle 26", bicicletas: 0, servidores: 2)

# Estacion 26 - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoColaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Estacion 26 - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoColaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Estacion 26 - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoColaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Estacion 26 - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoColaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

#EsperaActual.create(duracionEspera: 5.0, idStation: 1)
