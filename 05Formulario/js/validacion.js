/*
Javascript es un lenguaje que posee un paragigma 
orientada a objetos y a funciones, por tal motivo 
presenta una particularidad la cual es:
NO TIPADO
no existe in, float, string, ni char, ni nada
TODO ES VAR -> variable
De acuerdo al estandar ES6 se manejan 3 tipos de variable
VAR
LET : es un a variable de tipo "protected"
CONST
*/

function validar(formulario){
    //obtener datos y discriminar a los que tienen 3 letras
    if(formulario.nombre.value.length < 5){
        alert("Escriba por lo menos 5 caracteres en nombre");
        formulario.nombre.focus();
        return false;
    }
    var checkOk = "QWERTYUIOPASDFGHJKLÑZXCVBNM"
    + "qwertyuiopasdfghjklñzxcvbnm";
    var checkStr = formulario.nombre.value;
    var todovalido = true;
    for(var i = 0; i < checkStr.lenght; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOk.length; j++){
            if(ch == checkOk.charAt(j)){
                break;
            }
        }
        if(j == checkOk.length){
            todovalido = false;
            break;
        }
    }
    if (!todovalido){
        alert("Escriba solo letras en el campo Nombre");
        formulario.nombre.focus();
        return false;
    }
    var checkOk ="0123456789";
    var checkStr = formulario.edad.value;
    var todovalido = true;
    for(var i =0; i < checkStr.lenght; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOk.length; j++){
            if(ch == checkOk.charAt(j)){
                break;
            }
        }
        if(j == checkOk.length){
            todovalido = false;
            break;
        }
    }
    if (!todovalido){
        alert("Escriba solo numeros en el campo Edad");
        formulario.edad.focus();
        return false;
    }
    var txt = formulario.email.value;
    //coreo mi expresion regular
    // [^@\s] = algo@algo
    // [^@^\.\s] = algo@algo.algo
    var b = /^[^@\s]+[^@\.\s]+(\.[^@\.\s]+)+$/;
    alert("Email " + (b.test(txt)?" ":" no ")+" valido");
    return b.test;

}