ambienteServidores = softwareSystem "Ambiente de Servidores" "Componentes do servidor gerando métricas." {
    metricasServidor = container "Métricas de Servidor" "Métricas de infraestrutura."
    metricasAplicacao = container "Métricas de Aplicação" "Tempo de Transcode, Latência, Cache Hit/Miss."
    logsCentralizados = container "Logs Centralizados" "Agregação de componentes."
}

ambienteCliente = softwareSystem "Ambiente do Cliente" "Componentes no uso final." {
    telemetriaCliente = container "Telemetria do Cliente" "Métricas enviadas pelos players dos usuários."
}

servidorMonitoramento = softwareSystem "Servidor de Monitoramento (Caddy)" "Agrega e exibe métricas de todo o sistema." {
    caddyServer = container "Caddy Server (Coletor/Gateway)" "Ponto de entrada único para receber todas as métricas enviadas."
    bancoDados = container "Banco de Dados" "Armazenamento das métricas e logs coletados."
    dashboards = container "Dashboards" "Interface visual para monitoramento do sistema (ex: Grafana)."
}

ambienteServidores.metricasServidor -> servidorMonitoramento.caddyServer "Envia dados para"
ambienteServidores.metricasAplicacao -> servidorMonitoramento.caddyServer "Envia métricas de negócio para"
ambienteServidores.logsCentralizados -> servidorMonitoramento.caddyServer "Envia logs de erro/info para"
ambienteCliente.telemetriaCliente -> servidorMonitoramento.caddyServer "Envio via Endpoint de eventos do player"

servidorMonitoramento.caddyServer -> servidorMonitoramento.bancoDados "Armazena eventos em"
servidorMonitoramento.bancoDados -> servidorMonitoramento.dashboards "Provê dados para"
