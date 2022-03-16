/*validar*/
function validarn(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[0-9\d .]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}

/*problema 01*/
function interes(){
    var valor = document.formulario.cantidad.value;
    var valor2 = document.formulario.meses.value;
    var resul = parseFloat(valor);
    var mes = parseInt(valor2)
    if(mes <= 48){
        var interes = resul * 0.02;
        var total = resul + (interes * mes);
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

/*problema 02*/
function comision(){
    var valor = document.formulario2.sueldo.value;
    var valor2 = document.formulario2.venta.value;
    var suel = parseFloat(valor);
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

/*problema 03*/
function descuento(){
    var valor = document.formulario3.compra.value
    var comp = parseFloat(valor)
    var desc = comp * 0.15
    var ToCoDe = comp - desc
    document.formulario3.descuentoT.value = "$" + ToCoDe
}
function borrarD(){
    document.formulario3.compra.value = ""
    document.formulario3.descuentoT.value = ""
}

/*problema 04*/
function calificacion(){
    var valor1 = document.formulario4.p1.value;
    var valor2 = document.formulario4.p2.value;
    var valor3 = document.formulario4.p3.value;
    var P1 = parseFloat(valor1);
    var P2 = parseFloat(valor2);
    var P3 = parseFloat(valor3);
    var pro = (P1 + P2 + P3) / 3;
    var CalPar = pro * 0.55
    var valor4 = document.formulario4.examen.value;
    var Ex = parseFloat(valor4)
    var CalEx = Ex * 0.3
    var valor5 = document.formulario4.tf.value;
    var TF = parseFloat(valor5)
    var CalT = TF * 0.15
    var CalFin = CalPar + CalEx + CalT
    CalFin = CalFin.toFixed(2)
    document.formulario4.final.value = CalFin;
}
function borrarF(){
    document.formulario4.p1.value = ""
    document.formulario4.p2.value = ""
    document.formulario4.p3.value = ""
    document.formulario4.examen.value = ""
    document.formulario4.tf.value = ""
    document.formulario4.final.value = ""
}

/*problema 05*/