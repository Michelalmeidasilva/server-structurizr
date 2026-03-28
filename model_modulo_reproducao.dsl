ambienteNavegador = softwareSystem "Ambiente do Navegador (Client-Side)" "A camada do cliente onde o vídeo é executado." {
    playerPrincipal = container "Player Principal" "O núcleo do reprodutor web." {
        nucleoOrquestracao = component "Núcleo de Orquestração" "1. Baixa Manifesto \n 2. Solicita Segmentos"
        mseApi = component "MSE API" "Responsável pela decodificação nativa do vídeo."
        algoritmoABr = component "Algoritmo ABR" "Estimativa de Banda & Seleção de Representação."
    }

    instrumentacao = container "Instrumentação (Coleta de QoE)" "Captura de qualidade de experiência do usuário." {
        metricasCapturadas = component "Métricas Capturadas" "Startup Time, Rebuffering Events, Bitrate Médio/Oscilações, Nível do Buffer, Throughput Estimado."
        envioPeriodico = component "Envio Periódico" "Agrupa eventos e os envia via Logs JSON."
    }
}

servidorTelemetria = softwareSystem "Servidor de Telemetria" "O backend que recebe os dados de QoE e instrumentação."

ambienteNavegador.playerPrincipal.nucleoOrquestracao -> ambienteNavegador.playerPrincipal.mseApi "Manda dados para"
ambienteNavegador.playerPrincipal.nucleoOrquestracao -> ambienteNavegador.playerPrincipal.algoritmoABr "Fornece estado para"
ambienteNavegador.playerPrincipal.algoritmoABr -> ambienteNavegador.playerPrincipal.nucleoOrquestracao "Dita quais segmentos baixar"

ambienteNavegador.playerPrincipal -> ambienteNavegador.instrumentacao "Monitoramento em Tempo Real"
ambienteNavegador.instrumentacao.metricasCapturadas -> ambienteNavegador.instrumentacao.envioPeriodico "Alimenta fila de"

ambienteNavegador.instrumentacao.envioPeriodico -> servidorTelemetria "Envia Logs JSON periodicamente para"
