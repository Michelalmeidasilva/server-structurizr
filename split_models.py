import os
import re

files = [
    "workspace_architecture_streaming.dsl",
    "workspace_modulo_distribuicao.dsl",
    "workspace_modulo_empacotamento.dsl",
    "workspace_modulo_ingestao.dsl",
    "workspace_modulo_monitoramento.dsl",
    "workspace_modulo_reproducao.dsl",
    "workspace_modulo_transcodificacao.dsl"
]

for f in files:
    if not os.path.exists(f):
        continue
    with open(f, 'r') as file:
        content = file.read()
    
    # Extract model content
    model_match = re.search(r'model\s*\{([\s\S]*?)^\s*\}', content, re.MULTILINE)
    if model_match:
        with open('model_' + f[10:], 'w') as mf:
            mf.write(model_match.group(1).strip() + '\n')
            
    # Extract views content
    views_match = re.search(r'views\s*\{([\s\S]*?)^\s*\}', content, re.MULTILINE)
    if views_match:
        with open('views_' + f[10:], 'w') as vf:
            vf.write(views_match.group(1).strip() + '\n')
            
    # Remove original file
    os.remove(f)

# Write master workspace.dsl
with open('workspace.dsl', 'w') as wf:
    wf.write('workspace "Video on Demand Architecture" {\n\n')
    wf.write('    model {\n')
    for f in files:
        name = f[10:]
        wf.write(f'        !include model_{name}\n')
    wf.write('    }\n\n')
    
    wf.write('    views {\n')
    for f in files:
        name = f[10:]
        wf.write(f'        !include views_{name}\n')
    wf.write('        theme default\n')
    wf.write('    }\n\n')
    wf.write('}\n')
print("Done splitting and creating workspace.dsl")
