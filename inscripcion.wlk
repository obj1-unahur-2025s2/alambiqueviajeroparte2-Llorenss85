import elAlambiqueViajero.*
import vehiculos.*
object centroDeInscripcion {
    const inscriptos=[]
    const rechazados=[]
    var sitioDeCarrera=buenosAires
    method inscriptos() =inscriptos
    method rechazados() =rechazados  
    method inscribirORechazar(unVehiculo) {
      if(sitioDeCarrera.puedeLlegar(unVehiculo)){
        inscriptos.add(unVehiculo)
      }
      else{
        rechazados.add(unVehiculo)
      }
    }
    method estaInscriptoVehiculo(unVehiculo) =inscriptos.any({i=> i==unVehiculo}) 
    method puedeCompetirCiudad(unVehiculo) {
        if(!self.estaInscriptoVehiculo(unVehiculo)){
            self.inscribirORechazar(unVehiculo)
        }
    }
    method vehiculosADescartar() =inscriptos.filter({v => !sitioDeCarrera.puedeLlegar(v)}) 
    method reEvaluarVehiculos() {
        if(!self.vehiculosADescartar().isEmpty()){
            inscriptos.removeAll({i=> self.existeVehiculoADescartar(i)})
        }
    }
    method vehiculosAIncorporar() =rechazados.filter({r=> sitioDeCarrera.puedeLlegar(r)}) 
    method incorporarRechazados() {
      if(!self.vehiculosAIncorporar().isEmpty()){
        inscriptos.addAll(self.vehiculosAIncorporar())
      }
    }
    method existeVehiculoADescartar(unVehiculo) =self.vehiculosADescartar().any({v=> v == unVehiculo})
    method replanificación(unaCiudad) {
      sitioDeCarrera=unaCiudad
      self.reEvaluarVehiculos()
    }
}

object realizacionCarrera {
  const vehiculosAnotados=[]
  var juegoIniciado=false
  method juegoInició() =juegoIniciado 
  method iniciarCarrera() {
    juegoIniciado=true
    vehiculosAnotados.addAll(centroDeInscripcion.inscriptos())

  }
}