object gimenez {
	// la linea que sigue es equivalente a todo lo que está debajo.
	// le agrega al objeto: un atributo, el método para acceder, y el método para modificar.
//	var property sueldo = 15000

	var sueldo = 15000
	var dinero = 0
	
	// FIX: devuelvo la propiedad sueldo en vez de 15000
	method sueldo() = sueldo 
	
	method sueldo(nuevoValor) { sueldo = nuevoValor }

  // Metodo agregado para que no se rompa pagarA de Galvan	
	method cobrarSueldo() {
	  dinero += self.sueldo()
	}
	
	method totalCobrado() { return dinero }
}

object baigorria {
	var cantidadEmpanadasVendidas = 1000
	var montoPorEmpanada = 15
	var dinero = 0
	var deuda = 0
	
	method venderEmpanada() {
		cantidadEmpanadasVendidas += 1
	}
 	
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
	
	// Metodo agregado para que no se rompa pagarA de Galvan	
	method cobrarSueldo() {
	  var excedente = self.sueldo() - deuda
	  
	  if (excedente < 0) {
	    deuda -= self.sueldo()
	  } else {
	    deuda = 0
	    dinero += excedente
	  }	  
	}
	
	method totalDinero() { return dinero }
	
	method gastar(cuanto) {
	  if (cuanto > dinero) {
	    deuda += cuanto - dinero
	    dinero = 0
	  } else {
	    dinero -= cuanto
	  } 
	}
	
	method totalDeuda() { return deuda }
}

object galvan {
	var dinero = 300000
	
	method dinero() { return dinero }
	
	method pagarA(empleado) {
	  dinero -= empleado.sueldo()
	  empleado.cobrarSueldo()
	}
}
