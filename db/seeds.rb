# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Station.create(name: "Calle 26", bicicletas: 0, servidores: 1)
Station.create(name: "Calle 45", bicicletas: 0, servidores: 1)
Station.create(name: "Calle 53", bicicletas: 0, servidores: 1)
Station.create(name: "CyT", bicicletas: 0, servidores: 1)
Station.create(name: "Uriel Gutierrez", bicicletas: 0, servidores: 1)


# Calle 26 - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Calle 26 - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Calle 26 - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)

# Calle 26 - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 1)



# Calle 45 - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 2)

# Calle 45 - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 2)

# Calle 45 - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 2)

# Calle 45 - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 2)


# Calle 53 - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 3)

# Calle 53 - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 3)

# Calle 53 - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 3)

# Calle 53 - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 3)


# CyT - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 4)

# CyT - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 4)

# CyT - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 4)

# CyT - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 4)


# Uriel Guitierrez - 7:00
FranjaGlobal.create(horaInicio: "7:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 5)

# Uriel Guitierrez - 7:20
FranjaGlobal.create(horaInicio: "7:20 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 5)

# Uriel Guitierrez - 7:40
FranjaGlobal.create(horaInicio: "7:40 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 5)

# Uriel Guitierrez - 8:00
FranjaGlobal.create(horaInicio: "8:00 am", horaFinal: "", tiempoServicioPromedio: 0.5, tiempoLlegadaPromedio: 5.0,
                    existenciaCiclasPromedio: 10, idStation: 5)

#EsperaActual.create(duracionEspera: 5.0, idStation: 1)
