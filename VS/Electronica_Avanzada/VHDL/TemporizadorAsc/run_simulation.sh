#!/bin/bash

# Compilar  archivos
echo "Compilando archivos VHDL..."
ghdl -a TemporizadorAsc.vhd
ghdl -a tb_TemporizadorAsc.vhd

# Diseno
echo "Elaborando diseño..."
ghdl -e tb_TemporizadorAsc

#S Imulacion
echo "Ejecutando simulación y generando archivo VCD..."
ghdl -r tb_TemporizadorAsc --vcd=Wave_TemporizadorAsc.vcd --stop-time=800ns

echo "Simulación completa. Archivo VCD generado: Wave_TemporizadorAsc.vcd"