#!/bin/bash

# Compilar  archivos
echo "Compilando archivos VHDL..."
ghdl -a contador.vhd
ghdl -a tb_ContDes.vhd

# Diseno
echo "Elaborando diseño..."
ghdl -e tb_ContDes

#S Imulacion
echo "Ejecutando simulación y generando archivo VCD..."
ghdl -r tb_ContDes --vcd=tb_ContDes.vcd --stop-time=800ns

echo "Simulación completa. Archivo VCD generado: tb_ContDes.vcd"
