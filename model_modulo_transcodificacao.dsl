videoBruto = softwareSystem "Vídeo Bruto" "O vídeo bruto proveniente da ingestão."

moduloTranscodificacao = softwareSystem "Módulo de Transcodificação" "Converte os vídeos originais para diversos formatos e resoluções." {
    ffmpeg = container "FFmpeg" "Ferramenta de conversão e processamento de vídeo."
    
    ladder = container "Bitrate Ladder" "Conjunto de resoluções para streaming adaptativo." {
        res360p = component "360p" "Resolução: 360p (Redes Móveis)"
        res480p = component "480p" "Resolução: 480p (Redes Móveis)"
        res720p = component "720p" "Resolução: 720p HD (Banda Larga)"
        res1080p = component "1080p" "Resolução: 1080p Full HD (Banda Larga)"
        res1440p = component "1440p" "Resolução: 1440p QHD (Fibra Óptica)"
        res2160p = component "2160p 4K" "Resolução: 2160p 4K UHD (Fibra Óptica)"
    }
}

armazenamento = softwareSystem "Armazenamento" "Destino seguro onde as várias versões do arquivo são guardadas."

videoBruto -> moduloTranscodificacao.ffmpeg "É processado por"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res360p "Gera"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res480p "Gera"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res720p "Gera"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res1080p "Gera"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res1440p "Gera"
moduloTranscodificacao.ffmpeg -> moduloTranscodificacao.ladder.res2160p "Gera"

moduloTranscodificacao.ladder.res360p -> armazenamento "Salva em"
moduloTranscodificacao.ladder.res480p -> armazenamento "Salva em"
moduloTranscodificacao.ladder.res720p -> armazenamento "Salva em"
moduloTranscodificacao.ladder.res1080p -> armazenamento "Salva em"
moduloTranscodificacao.ladder.res1440p -> armazenamento "Salva em"
moduloTranscodificacao.ladder.res2160p -> armazenamento "Salva em"
