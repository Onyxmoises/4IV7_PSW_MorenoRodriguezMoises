function validarn(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}
function validarl(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[A-Z \ a-z]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}
function validarnl(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[A-Z \ a-z \ 0-9 ]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}
function validars(e){
    var teclado = (document.all)? e.keyCode : e.which;
    if(teclado == 8) return true;
    var patron = /[3-6]/;
    var codigo = String.fromCharCode(teclado);
    return patron.test(codigo);
}