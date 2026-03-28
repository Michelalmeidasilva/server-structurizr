fonteVideoIngestao = softwareSystem "Fonte de Vídeo (Ingestão)" "Fonte externa ou usuário que envia o vídeo bruto."

moduloIngestao = softwareSystem "Módulo de Ingestão (File-Based)" "Sistema responsável por receber os arquivos de vídeo para iniciar o processamento." {
    pastaMonitorada = container "Pasta Monitorada" "Diretório ou bucket cujo conteúdo é monitorado em busca de novos arquivos."
    gatilhoInteligente = container "Gatilho Inteligente" "Mecanismo que capta o evento de criação de arquivo e aciona o pipeline de forma automatizada."
    iniciarPipeline = container "Iniciar Pipeline" "Inicia a etapa seguinte sem intervenção manual."

    pastaMonitorada -> gatilhoInteligente "2. Detecta novo item"
    gatilhoInteligente -> iniciarPipeline "3. Disparo Automático (Sem intervenção manual)"
}

fonteVideoIngestao -> moduloIngestao.pastaMonitorada "1. Deposita arquivo"
