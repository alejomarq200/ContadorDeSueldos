<?php

// Prueba validacióne efectiva de campos
function validarCamposConClaves()
{
    $valores =
        [
            'nombre' => [
                'valor' => '',
                'requerido' => true,
            ],
            'apellido' => [
                'valor' => '',
                'requerido' => true,
            ],
            'cedula' => [
                'valor' => '',
                'requerido' => true,
            ]
        ];

    $errores = [];
    foreach ($valores as $campo => $valor) {

        if (empty($valor['valor']) && $valor['requerido'] == true) {
            $errores[] = '<br> El campo ' . $campo . ' se encuentra vacio</br>';
        }
    }
    return $errores;
}

// $campos = validarCamposConClaves();
// if (!$campos) {
//     echo 'Los campo se validaron correctamente';
// } else {
//     foreach ($campos as $key => $valor) {
//         echo $key . '=>' . $valor;
//     }
// }


function validarCamposConClaves2()
{
    $valores = [
        'nombre' => [
            'valor' => 'ALE',
            'tipo' => 'texto',
            'ejemplo' => 'Jose Alejandro'
        ],
        'cedula' => [
            'valor' => '12345678',
            'tipo' => 'numero',
            'ejemplo' => 'V12345678'
        ]
    ];

    $retornado = [];
    foreach ($valores as $campo => $valor) {
        if (empty($valor['valor'])) {
            $retornado[] = 'El campo ' . $campo . ' se encuentra vacío';
        } elseif ($valor['tipo'] == 'texto' && !preg_match('/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/u', $valor['valor'])) {
            $retornado[] = 'Formato incorrecto de ' . $campo . '. Formato admitido ej: "' . $valor['ejemplo'] . '"';
        } elseif ($valor['tipo'] == 'numero' && !preg_match('/^[0-9]+$/', $valor['valor'])) {
            $retornado[] = 'Formato incorrecto de ' . $campo . '. Formato admitido ej: "' . $valor['ejemplo'] . '"';
        }
    }

    return $retornado;
}

// $campos = validarCamposConClaves2();
// var_dump($campos);

// if (!empty($campos)) {
//     foreach ($campos as $key) {
//         echo "<br>" . $key . "</br>";
//     }
// } else {
//     echo 'Datos validados correctamente';
// }
