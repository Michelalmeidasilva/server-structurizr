workspace "Video on Demand Architecture" {

    !identifiers hierarchical

    model {
        !include model_architecture_streaming.dsl
        !include model_modulo_ingestao.dsl
        !include model_modulo_transcodificacao.dsl
        !include model_modulo_distribuicao.dsl
        !include model_modulo_empacotamento.dsl
        !include model_modulo_monitoramento.dsl
        !include model_modulo_reproducao.dsl
    }

    views {
        !include views_architecture_streaming.dsl
        !include views_modulo_ingestao.dsl
        !include views_modulo_transcodificacao.dsl
        !include views_modulo_distribuicao.dsl
        !include views_modulo_empacotamento.dsl
        !include views_modulo_monitoramento.dsl
        !include views_modulo_reproducao.dsl
        
        theme default
        
        styles {
            element "Element" {
                shape RoundedBox
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }
}
