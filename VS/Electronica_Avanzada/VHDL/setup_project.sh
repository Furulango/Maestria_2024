#!/bin/bash

# Solicitar al usuario el nombre del proyecto, el archivo de diseño y el testbench
read -p "Ingrese el nombre del proyecto: " PROJECT_NAME
read -p "Ingrese el nombre del archivo de diseño (sin extensión): " DESIGN_FILE
read -p "Ingrese el nombre del archivo del testbench (sin extensión): " TESTBENCH_FILE

# Crear el directorio del proyecto si no existe
PROJECT_DIR="./$PROJECT_NAME"
mkdir -p "$PROJECT_DIR/.vscode"

# Crear archivos VHDL vacíos
touch "$PROJECT_DIR/$DESIGN_FILE.vhd"
touch "$PROJECT_DIR/$TESTBENCH_FILE.vhd"

# Crear o sobrescribir el archivo tasks.json
cat <<EOL > "$PROJECT_DIR/.vscode/tasks.json"
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compile VHDL",
            "type": "shell",
            "command": "ghdl",
            "args": [
                "-a",
                "$DESIGN_FILE.vhd",
                "$TESTBENCH_FILE.vhd"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": []
        },
        {
            "label": "Elaborate VHDL",
            "type": "shell",
            "command": "ghdl",
            "args": [
                "-e",
                "$TESTBENCH_FILE"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": []
        },
        {
            "label": "Simulate VHDL",
            "type": "shell",
            "command": "ghdl",
            "args": [
                "-r",
                "$TESTBENCH_FILE",
                "--vcd=$TESTBENCH_FILE.vcd",
                "--stop-time=500ns"
            ],
            "group": {
                "kind": "test",
                "isDefault": true
            },
            "problemMatcher": []
        }
    ]
}
EOL

# Crear o sobrescribir el archivo launch.json (si es necesario para depuración)
cat <<EOL > "$PROJECT_DIR/.vscode/launch.json"
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Simular VHDL",
            "type": "vhdl",
            "request": "launch",
            "program": "\${workspaceFolder}/${TESTBENCH_FILE}",
            "args": ["--vcd=${TESTBENCH_FILE}.vcd", "--stop-time=500ns"]
        }
    ]
}
EOL

# Crear o sobrescribir el archivo settings.json
cat <<EOL > "$PROJECT_DIR/.vscode/settings.json"
{
    "vhdl.simulator": "ghdl",
    "vhdl.linting.enabled": true
}
EOL

echo "Archivos de configuración de VS Code creados en $PROJECT_DIR/.vscode/"
