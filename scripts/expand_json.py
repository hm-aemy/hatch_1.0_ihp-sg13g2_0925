import json
import glob
import os

# Cargar el JSON base
with open('config.json') as f:
    data = json.load(f)

base_dir = '/workspaces/hatch_1.0_ihp-sg13g2_0925/'  # Cambia esto al path base de tu repo
verilog_files_flat = []

for file_entry in data['VERILOG_FILES']:
    if file_entry.startswith('dir::'):
        relative_path = file_entry.replace('dir::', '')
        absolute_path = os.path.join(base_dir, relative_path)
        
        # Expandir wildcards
        matched_files = glob.glob(absolute_path)
        if matched_files:
            # Reemplazar el path base por dir:: nuevamente para mantener formato
            matched_files_relative = [
                'dir::' + os.path.relpath(path, base_dir) for path in matched_files
            ]
            verilog_files_flat.extend(matched_files_relative)
        else:
            verilog_files_flat.append(file_entry)
    else:
        verilog_files_flat.append(file_entry)

# Sobrescribir la lista en el JSON
data['VERILOG_FILES'] = verilog_files_flat

# Guardar el JSON resultante
with open('flattened_config.json', 'w') as f:
    json.dump(data, f, indent=4)

print("Archivo JSON con VERILOG_FILES aplanado generado: flattened_config.json")