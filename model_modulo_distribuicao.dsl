moduloDistribuicao = softwareSystem "Módulo de Distribuição" "Simulação de CDN Nginx para distribuir os vídeos aos usuários." {
    camadaOrigem = container "Camada de Origem" "A camada que contém os vídeos originais." {
        nginxOrigin = component "Nginx Origin Server" "Alta Performance - Serve como a origem dos arquivos de mídia empacotados."
    }
    cacheControl = container "Cache-Control" "Políticas de cache para otimização da entrega."
    camadaBorda = container "Camada de Borda (Edge)" "Camada de borda para entrega rápida." {
        nginxEdge = component "Nginx Edge Server" "Servidor de borda que entrega o conteúdo aos clientes."
        cors = component "CORS Habilitado" "Permite acesso de diferentes domínios."
    }
}

playerDistribuicao = softwareSystem "Player" "Cliente que consome o vídeo (dispositivos móveis, web, smart TVs)."

moduloDistribuicao.camadaOrigem.nginxOrigin -> moduloDistribuicao.cacheControl "Define políticas para"
moduloDistribuicao.cacheControl -> moduloDistribuicao.camadaBorda.nginxEdge "Aplica regras em"
moduloDistribuicao.camadaBorda.nginxEdge -> moduloDistribuicao.camadaBorda.cors "Habilita acesso cruzado usando"

moduloDistribuicao.camadaBorda.nginxEdge -> playerDistribuicao "Entrega vídeo via HTTP/2"
moduloDistribuicao.camadaBorda.nginxEdge -> playerDistribuicao "Entrega vídeo via HTTP/3 (QUIC)"
