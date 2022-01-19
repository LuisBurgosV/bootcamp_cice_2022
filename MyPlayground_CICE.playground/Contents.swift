import UIKit

// --

/*
 Este es un comentario
 en donde puedo hacer intros
 y comentar varias cosas
 */

//MARK: - TIPOS BASICOS
var nombre: String = "Pepe" //Esta es una variable mutable
let apellido: String = "Ramirez" //Esta es una variable inmutable

nombre = "Felipe"


let profesion = "iOS Developer"
print(profesion)

print("El Sr. " + nombre + " " + apellido + " es: " + profesion)

var numeroA = 4
var numeroB = 3.8

var multiplicacion = Double(numeroA) * numeroB

var numeroC = 5
multiplicacion = multiplicacion + Double(numeroC)

var numeroH = 1, numeroG = 4.9, numeroL = 5
print(numeroG)

//MARK: - OPERADORES
var numeroD = 0
numeroD = 2 * 5 / 7

numeroD += 1
numeroD -= 10

var sino = false
    
if sino {
    debugPrint("Correcto")
}else{
    debugPrint("Incorrecto")
}

if !nombre.isEmpty || !apellido.isEmpty {
    print("Ya tienes datos")
}else{
    print("coloca datos: ")
}

if numeroD >= 7 {
    print("Correcto")
}else{
    print("Incorrecto")
}

var resultado = numeroD != 0 ? numeroA / Int(numeroB) : 0

print(resultado)

//MARK: - CHARACTERS
var emptyString = ""
var anotherEmptyString = String()
var adios = "Adios"

emptyString.isEmpty
anotherEmptyString.isEmpty
adios.isEmpty

var variableMutable = "Andres"
variableMutable += "Felipe"
variableMutable += "OCampo"
variableMutable += "Eljaiek"

for item in adios{
    print(item)
}

//MARK: - Arrays

var iPhones = ["iPhone 4", "iPhone 5", "iPhone XR"]
var iPads = ["iPad Air", "iPad Mini"]

var dispositivos = iPhones + iPads

dispositivos.append("Mac Pro")
dispositivos.insert("Watch OS", at: 0)

dispositivos.sort(by: >)

let iPhone = dispositivos[2]

var aux = dispositivos.filter { $0.contains("iP") }

print(aux)

//MARK: - Diccionarios
var diccionarioVacio: [String: Any] = [:]

var coche = ["marca": "Mazda", "modelo": "Megane", "potencia": "145 caballos"]
let marca = coche["marca"]


if coche["modelo"] != nil {
    print(coche["modelo"]!)
}

if let modelDes = coche["modelo"]{
    print(modelDes)
}

for (clave, valor) in coche {
    print("Clave" + clave + " y el valor es el " + valor)
}

for clave in coche.keys {
    print(clave)
}

for valor in coche.values {
    print(valor)
}

//MARK: - Opcionales
var numeroEntero = 34
var numeroString = "3"

var sumatoria = numeroEntero + Int(numeroString)!

var nuevaSumatoria: String = "\(sumatoria)"

var nombreAA: String? = "Andres"
nombreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreDes = nombreModA {
    print(nombreDes)
}

//MARK: - Funciones

func miSerieFavoritaEs() {
    print("Juego de Tronos")
}

miSerieFavoritaEs()

func funcionRetornaString() -> String {
    return "Hola Mundo"
}

funcionRetornaString()

func funcionConParametros(mensaje: String) {
    print(mensaje)
}

funcionConParametros(mensaje: "Hola Andres")







































