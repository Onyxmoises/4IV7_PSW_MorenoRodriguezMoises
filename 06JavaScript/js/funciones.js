function validarn(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[0-9\d .]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}
function interes(){
    var valor = document.formulario.cantidad.value;
    var valor2 = document.formulario.meses.value;
    var resul = parseInt(valor);
    var mes = parseInt(valor2)
    if(mes <= 48){
        var interes = resul * 0.02;
        var total = (interes * mes) + resul;
        document.formulario.sueldoI.value = "$" + total;
    }
    else{
        alert("El tiempo de inversion debe ser de un maximo de 48 meses") 
    }
}
function borrarI(){
    document.formulario.cantidad.value = ""
    document.formulario.meses.value = ""
    document.formulario.sueldoI.value = ""
}
function comision(){
    var valor = document.formulario2.sueldo.value;
    var valor2 = document.formulario2.venta.value;
    var suel = parseInt(valor);
    var vent = parseInt(valor2)
    var comi = suel * 0.10;
    var total = (comi * vent) + suel;
    document.formulario2.total.value = "$" + total;
}
function borrarC(){
    document.formulario2.sueldo.value = ""
    document.formulario2.venta.value = ""
    document.formulario2.total.value = ""
}