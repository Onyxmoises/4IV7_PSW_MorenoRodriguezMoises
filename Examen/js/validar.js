function plus(){
    var valor = parseFloat(document.getElementById("valor").value);
    var cuota = parseFloat(document.getElementById("cuota").value);
    var periodo = parseFloat(document.getElementById("periodo").value);
    var interes
    var pago
    var mensual
    if (valor >= 100000) {
        if (valor <= 1000000) {
            if (cuota >= (valor * .10)) {
                interes = periodo * (valor * 0.0394)
                pago = (valor + interes) - cuota
                mensual = pago / periodo
            }
            else{
                alert("La cuota debe ser como minimo el 10% del valor")
            }
        }
        else{
            alert("El valor debe ser menor a 1,000,000")
        }
    }
    else{
        alert("El valor debe ser mayor a 100,000")
    }
    deci = interes.toFixed(2)
    men = mensual.toFixed(2)
    pag = pago.toFixed(2)
    document.getElementById('interes').innerHTML = deci;
    document.getElementById('pago').innerHTML = pag;
    document.getElementById('mensual').innerHTML = men;
}
function borar(){
    document.getElementById('mensual').innerHTML = "";
    document.getElementById('interes').innerHTML = "";
    document.getElementById('pago').innerHTML = "";
    document.getElementById("valor").value = "";
    document.getElementById("cuota").value = "";
}