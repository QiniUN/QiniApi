# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Station.create(name: "Calle 26", bicicletas: 0, servidores: 2)
FranjaGlobal.create(horaInicio: Time.now, horaFinal: Time.now, tiempoServicioPromedio: 2.0, tiempoColaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)
EsperaActual.create(duracionEspera: 5.0, idStation: 1)
