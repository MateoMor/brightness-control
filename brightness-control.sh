#!/bin/bash

# How to run: ~/scripts/brightness-control.sh value0-1

# Obtener el identificador de la pantalla
display=$(xrandr | grep " connected" | awk '{print $1}') 

# Obtener el brillo actual
current_brightness=$(xrandr --verbose | grep -i brightness | awk '{print $2}')

# Verificar si se pudo obtener el brillo actual
if [ -z "$current_brightness" ]; then
    echo "No se pudo obtener el brillo actual. Saliendo."
    exit 1
fi

# Verificar si se proporciona un valor de brillo como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 [cantidad_de_brillo_a_sumar_o_restar]"
    exit 1
fi

# Obtener la cantidad de brillo a sumar o restar del primer argumento
brightness_change=$1

# Calcular el nuevo brillo sumando o restando la cantidad proporcionada
new_brightness=$(echo "$current_brightness + $brightness_change" | bc)

# Verificar si el nuevo brillo está por encima de 1.0
if (( $(echo "$new_brightness > 1.0" | bc -l) )); then
    new_brightness=1.0
fi

# Verificar si el nuevo brillo está por debajo de 0.3
if (( $(echo "$new_brightness < 0.3" | bc -l) )); then
    new_brightness=0.3
fi

# Establecer el nuevo valor de brillo
xrandr --output $display --brightness $new_brightness

echo "Brillo ajustado a $new_brightness"