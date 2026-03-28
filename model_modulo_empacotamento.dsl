fonteVideoEmpacotamento = softwareSystem "Fonte de Vídeo (Empacotamento)" "A origem do conteúdo de vídeo pre-transcodificado."

servidorEmpacotamento = softwareSystem "Servidor de Empacotamento" "Servidor responsável por empacotar o vídeo." {
    media = container "Media" "Conteúdo de mídia empacotado." {
        segmento1 = component "Segmento 1" "Pedaço do vídeo."
        segmento2 = component "Segmento 2" "Pedaço do vídeo."
        segmento3 = component "Segmento 3" "Pedaço do vídeo."
        segmento4 = component "Segmento 4" "Pedaço do vídeo."
        segmento5 = component "Segmento 5" "Pedaço do vídeo."
        arquivoManifesto = component "Arquivo manifesto" "Manifesto (ex: m3u8 ou mpd) que descreve os segmentos e representações de qualidade disponíveis (BANDWIDTH, RESOLUTION, CODECS)."
    }
}

videoPlayer = softwareSystem "Video player" "O player do usuário consumindo o vídeo."
logicaAdaptacao = softwareSystem "Lógica de adaptação" "Lógica no player que decide qual segmento baixar baseado na rede."
dispositivo = softwareSystem "Dispositivo" "Aparelho do usuário (computador, smartphone, etc.) que decodifica e mostra o vídeo."

fonteVideoEmpacotamento -> servidorEmpacotamento.media "Envia vídeo para"

videoPlayer -> logicaAdaptacao "Utiliza"
logicaAdaptacao -> dispositivo "Controla o"

dispositivo -> servidorEmpacotamento.media.arquivoManifesto "Baixa manifesto inicial (1. Cliente pede vídeo)"
dispositivo -> servidorEmpacotamento.media.segmento1 "Baixa segmento (2. Baixa segmentos)"
dispositivo -> servidorEmpacotamento.media.segmento2 "Baixa segmento"
dispositivo -> servidorEmpacotamento.media.segmento3 "Baixa segmento"
dispositivo -> servidorEmpacotamento.media.arquivoManifesto "Atinge Playback contínuo (3. Playback contínuo)"
