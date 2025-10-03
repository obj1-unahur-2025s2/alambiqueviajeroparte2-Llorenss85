import inscripcion.*
import elAlambiqueViajero.*


object antiguallaBlindada {
  const combustible=100
  const consumoPorViaje=10
  const integrantes=["roldan","penelope","ari","mike","july","fabi","triki"]
  method bajarse(unGanster) {
    integrantes.remove(unGanster)
  }
  method subirse(unGanster) {
    integrantes.add(unGanster)
  }
  method puedeFuncionar() = combustible >= consumoPorViaje
  method velocidad() = integrantes.map({i=> i.size()}).sum()
 method rapido() = true
 method desgaste() { }
 method patenteValida() = false

}

object  vehículoPNyP{
  var rapido=true
  method esRapido() =rapido
  method hacerTrampa() {
    rapido=false
  }
  method rapido() = true
  method desgaste() { }
  method patenteValida() = false
}

object vehivuoLocovich {
  var vehiculoTransformado=vehículoPNyP
  method listaDeVehiculosPosibles() = [vehículoPNyP,antiguallaBlindada,moto] 
  method esVehiculoValido(unVehiculo) = self.listaDeVehiculosPosibles().any({l=>l ==unVehiculo})
  method transformarse(unVehiculo) {
    if(self.esVehiculoValido(unVehiculo) and !realizacionCarrera.juegoInició()){
         vehiculoTransformado=unVehiculo
    }
  }

}