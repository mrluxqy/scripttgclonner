#!/bin/bash

# Definir colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # Sin color

# Función para actualizar e instalar paquetes
actualizar_e_instalar() {
    echo -e "${VERDE}Actualizando el índice de paquetes...${NC}"
    sudo apt update -qq > /dev/null

    echo -e "${VERDE}Instalando Python 3 y pip...${NC}"
    sudo apt install -y python3 python3-pip > /dev/null

    echo -e "${VERDE}Instalando bibliotecas de Python...${NC}"
    pip3 install telethon python-telegram-bot colorama > /dev/null

    echo -e "${VERDE}Instalación completada.${NC}"
    
    # Mostrar opciones después de la instalación
    echo -e "${VERDE}1. Volver al menú${NC}"
    echo -e "${VERDE}2. Detener script${NC}"
    echo -e "Elige una opción (1 o 2):"
    
    # Leer la opción del usuario
    read opcion
    
    case $opcion in
        1)
            mostrar_menu
            ;;
        2)
            echo -e "${VERDE}Deteniendo el script.${NC}"
            exit 0
            ;;
        *)
            echo -e "${ROJO}Opción no válida. Por favor, elige 1 o 2.${NC}"
            actualizar_e_instalar
            ;;
    esac
}

# Función para mostrar el menú
mostrar_menu() {
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
            # Cambiar al directorio dist y ejecutar download.py
            if [ -f "dist/download.py" ]; then
                (cd dist && python3 download.py)
            else
                echo -e "${ROJO}Archivo dist/download.py no encontrado.${NC}"
            fi
            ;;
        2)
            echo -e "${VERDE}Ejecutando reenviador...${NC}"
            # Cambiar al directorio dist2 y ejecutar reenviar.py
            if [ -f "dist2/reenviar.py" ]; then
                (cd dist2 && python3 reenviar.py)
            else
                echo -e "${ROJO}Archivo dist2/reenviar.py no encontrado.${NC}"
            fi
            ;;
        3)
            echo -e "${VERDE}Actualizando e instalando dependencias...${NC}"
            actualizar_e_instalar
            ;;
        *)
            echo -e "${ROJO}Opción no válida. Por favor, elige 1, 2 o 3.${NC}"
            mostrar_menu
            ;;
    esac
}

# Llamar a la función de menú
mostrar_menu
