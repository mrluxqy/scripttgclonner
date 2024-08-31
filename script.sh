#!/bin/bash

# Definir colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # Sin color

# Función para actualizar e instalar paquetes
actualizar_e_instalar() {
    echo -e "${VERDE}Actualizando el índice de paquetes...${NC}"
    sudo apt update

    echo -e "${VERDE}Instalando Python 3 y pip...${NC}"
    sudo apt install -y python3 python3-pip

    echo -e "${VERDE}Instalando bibliotecas de Python...${NC}"
    pip3 install telethon
    pip3 install python-telegram-bot
    pip3 install colorama

    echo -e "${VERDE}Instalación completada.${NC}"
}

# Actualizar e instalar si se selecciona la opción 3
if [ "$1" == "setup" ]; then
    actualizar_e_instalar
    exit 0
fi

# Mostrar el texto ASCII "MENU" en color rojo
echo -e "${ROJO}"
echo "███    ███ ███████ ███    ██ ██    ██ "
echo "████  ████ ██      ████   ██ ██    ██ "
echo "██ ████ ██ █████   ██ ██  ██ ██    ██ "
echo "██  ██  ██ ██      ██  ██ ██ ██    ██ "
echo "██      ██ ███████ ██   ████  ██████  "
echo -e "${NC}"

# Mostrar el menú en verde
echo -e "${VERDE}1. Ejecutar clonador${NC}"
echo -e "${VERDE}2. Ejecutar reenviador${NC}"
echo -e "${VERDE}3. Actualizar e instalar dependencias${NC}"
echo -e "Elige una opción (1, 2 o 3):"

# Leer la opción del usuario
read opcion

# Ejecutar el script correspondiente según la opción
case $opcion in
    1)
        echo -e "${VERDE}Ejecutando clonador...${NC}"
        python3 dist/download.py
        ;;
    2)
        echo -e "${VERDE}Ejecutando reenviador...${NC}"
        python3 dist2/reenviar.py
        ;;
    3)
        echo -e "${VERDE}Actualizando e instalando dependencias...${NC}"
        ./script.sh setup
        ;;
    *)
        echo -e "${ROJO}Opción no válida. Por favor, elige 1, 2 o 3.${NC}"
        ;;
esac
