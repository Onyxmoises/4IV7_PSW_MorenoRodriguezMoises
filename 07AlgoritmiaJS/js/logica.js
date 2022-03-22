//problema 1
function problema1(){
    var p1_input = document.querySelector('#p1-input').value;
    var p1_palabra = p1_input.split(' ');
    var reverso = p1_palabra.reverse();
    document.querySelector('#p1-output').textContent = reverso;
}

//problema 2
function problema2(){
    var p2_x1 = document.querySelector('#p2-x1').value;
    var p2_x2 = document.querySelector('#p2-x2').value;
    var p2_x3 = document.querySelector('#p2-x3').value;
    var p2_x4 = document.querySelector('#p2-x4').value;
    var p2_x5 = document.querySelector('#p2-x5').value;
    var p2_y1 = document.querySelector('#p2-y1').value;
    var p2_y2 = document.querySelector('#p2-y2').value;
    var p2_y3 = document.querySelector('#p2-y3').value;
    var p2_y4 = document.querySelector('#p2-y4').value;
    var p2_y5 = document.querySelector('#p2-y5').value; 
    var res = (p2_x1 * p2_y1) + (p2_x2 * p2_y2) + (p2_x3 * p2_y3) + (p2_x4 * p2_y4) + (p2_x5 * p2_y5)
    document.querySelector('#p2-output').textContent = res;
}

//problema 3
function problema3(){
    //definir alfabeto para comparar y no puede ser en desorden
    var alfabeto = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
                    'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S', 
                    'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
    //Obtener la cadena del input y separar por comas
    var p3_input = document.querySelector('#p3-input').value;
    //Separar en las comas
    var p3_palabras = p3_input.split(',')
    //Eliminar el espacio entre las palabras
    p3_palabras = p3_palabras.map(function (palabra){
        return palabra.replace(/\s/g, '').toUpperCase();//.toUpperCase cambia todas las letras a mayusculas
    });
    //Calcular los caracteres unicos de las palabras
    var p3_res = '';
    //Iterar en cada palabra
    p3_palabras.forEach(function (palabra, i){
        //Separar las palabras en un array para leer cada letra
        var letra_unicas = [];
        var palabra_array = palabra.split('');
        //Iterar al alfabeto
        alfabeto.forEach(function (letra, j){
            //Iterar por palabra
            palabra_array.forEach(function (letra_palabra, k){
                //comprobar que la letra esta dentro del alfabeto
                if(letra_palabra == letra){
                    //Si la letra no la hemos contado, la agregamos a un array
                    // para contar las letras unicas
                    if(letra_unicas.indexOf(letra) < 0){
                        letra_unicas.push(letra);
                    }
                }
            });
        });
        p3_res += 'Palabra ' + palabra + ' = ' + letra_unicas.length + '\n';
    });
    document.querySelector('#p3-output').textContent = p3_res;
}