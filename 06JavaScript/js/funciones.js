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
    if(document.formulario.cantidad.value != "", document.formulario.meses.value != "" ){
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
    else{
        alert("Ninguno de los campos puede estar vacio")
    }
}
function borrarI(){
    document.formulario.cantidad.value = ""
    document.formulario.meses.value = ""
    document.formulario.sueldoI.value = ""
}

/*problema 02*/
function comision(){
    if(document.formulario2.sueldo.value != "", document.formulario2.venta.value != ""){
        var valor = document.formulario2.sueldo.value;
        var valor2 = document.formulario2.venta.value;
        var suel = parseFloat(valor);
        var vent = parseInt(valor2)
        var comi = suel * 0.10;
        var total = (comi * vent) + suel;
        document.formulario2.total.value = "$" + total;
    }
    else{
        alert("Ninguno de los campos puede estar vacio");
    }
}
function borrarC(){
    document.formulario2.sueldo.value = ""
    document.formulario2.venta.value = ""
    document.formulario2.total.value = ""
}

/*problema 03*/
function descuento(){
    if(document.formulario3.compra.value != ""){
        var valor = document.formulario3.compra.value
        var comp = parseFloat(valor)
        var desc = comp * 0.15
        var ToCoDe = comp - desc
        document.formulario3.descuentoT.value = "$" + ToCoDe
    }
    else{
        alert("El campo de la compra no puede estar vacio"); 
    }
}
function borrarD(){
    document.formulario3.compra.value = ""
    document.formulario3.descuentoT.value = ""
}

/*problema 04*/
function calificacion(){
    if(document.formulario4.p1.value != "", document.formulario4.p2.value != "", document.formulario4.p3.value != "",
       document.formulario4.examen.value != "", document.formulario4.tf.value != ""){
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
    else{
        alert("Ninguno de los campos puede estar vacio"); 
    }
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
function porcentaje(){
    if(document.formulario5.mujeres.value != "", document.formulario5.hombres.value != ""){
        var valor1 = document.formulario5.mujeres.value;
        var valor2 = document.formulario5.hombres.value;
        var mu = parseInt(valor1)
        var ho = parseInt(valor2)
        var total = mu + ho
        var pormu = (mu * 100) / total
        var porho = (ho * 100) / total
        document.formulario5.pormujeres.value = pormu + "%"
        document.formulario5.porhombres.value = porho + "%"
    }
    else{
        alert("Ninguno de los campos puede estar vacio");
    }
}
function borrarP(){
    document.formulario5.mujeres.value = ""
    document.formulario5.hombres.value = ""
    document.formulario5.pormujeres.value = ""
    document.formulario5.porhombres.value = ""
}

/*problema 06*/
function edad(){
    var aa = document.formulario6.añoA.value;
    var an = document.formulario6.añoN.value;
    var ma = document.formulario6.mesA.value;
    var mn = document.formulario6.mesN.value;
    var da = document.formulario6.diaA.value;
    var dn = document.formulario6.diaN.value;
    var añoAc = parseInt(aa);
    var añoNa = parseInt(an);
    var mesAc = parseInt(ma);
    var mesNa = parseInt(mn);
    var diaAc = parseInt(da);
    var diaNa = parseInt(dn);
    var bi = 1;
    var años = 0;
    var meses = 0;
    var dias = 0;
    if(diaAc <= 31 && diaNa <= 31 && diaAc >= 1 && diaNa >= 1){
        if(mesAc <= 12 && mesNa <= 12 && mesAc >= 1 && mesNa >= 1){
            while(añoNa != añoAc || mesAc != mesNa){
                if(mesNa == 1 || mesNa == 3 || mesNa == 5 || mesNa == 7 || mesNa == 8 || mesNa == 10 || mesNa == 12){
                    dias += 31
                    if(mesNa == 12){
                        mesNa = 0
                        añoNa += 1
                    }
                }
                if(mesNa == 4 || mesNa == 6 || mesNa == 9 || mesNa == 10){
                    dias += 30
                }
                if(mesNa == 2){
                    if(bi <= 3){
                        dias += 28
                        bi += 1
                    }
                    else{
                        dias += 29
                        bi = 1
                    }
                }
                mesNa += 1
            }
            dias -= diaNa
            dias += diaAc
            total = dias
            años = Math.trunc(dias / 365.25)
            meses = Math.trunc(((dias / 365.25) - años) * 12)
            dias = Math.trunc(((((dias / 365.25) - años) * 12) - meses) * 31)
            document.formulario6.años.value = años;
            document.formulario6.meses.value = meses;
            document.formulario6.dias.value = dias;
            document.formulario6.total.value = total;
        }
        else{
            alert("Los meses no pueden ser menor a 1 ni mayor a 12")
        }
    }
    else{
        alert("Los dias no pueden ser menor que 1 ni mayor a 31")
    }
    /*while(añoNa != añoAc || mesAc != mesNa){
        if(mesNa == 1 || mesNa == 3 || mesNa == 5 || mesNa == 7 || mesNa == 8 || mesNa == 10 || mesNa == 12){
            dias += 31
            if(mesNa == 12){
                mesNa = 0
                añoNa += 1
            }
        }
        if(mesNa == 4 || mesNa == 6 || mesNa == 9 || mesNa == 10){
            dias += 30
        }
        if(mesNa == 2){
            if(bi <= 3){
                dias += 28
                bi += 1
            }
            else{
                dias += 29
                bi = 1
            }
        }
        mesNa += 1
    }
    dias -= diaNa
    dias += diaAc
    total = dias
    años = Math.trunc(dias / 365.25)
    meses = Math.trunc(((dias / 365.25) - años) * 12)
    dias = Math.trunc(((((dias / 365.25) - años) * 12) - meses) * 31)
    document.formulario6.años.value = años;
    document.formulario6.meses.value = meses;
    document.formulario6.dias.value = dias;
    document.formulario6.total.value = total;*/
}
function borrarE(){
    document.formulario6.añoA.value = "";
    document.formulario6.añoN.value = "";
    document.formulario6.mesA.value = "";
    document.formulario6.mesN.value = "";
    document.formulario6.diaA.value = "";
    document.formulario6.diaN.value = "";
    document.formulario6.años.value = "";
    document.formulario6.meses.value = "";
    document.formulario6.dias.value = "";
    document.formulario6.total.value = "";
}