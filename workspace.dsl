workspace "Video on Demand" "Architecture for the Video on Demand streaming service" {

    model {
        user = person "User" "A viewer of videos"
        
        softwareSystem = softwareSystem "Video On Demand System" "Provides video streaming services" {
            ingest = container "Ingest Service" "Handles video uploads and basic metadata" "Go"
            transcode = container "Transcode Service" "Processes video files into multiple bitrates" "Go"
            packaging = container "Packaging Service" "Segments videos for HLS/DASH" "Go"
            distribution = container "Distribution Service" "Serves segments to users (CDN/Origin)" "Go"
            app = container "Streaming App" "The client application (Web/Mobile)" "TypeScript/React"
            
            user -> app "Uses"
            app -> distribution "Requests stream from"
            ingest -> transcode "Triggers transcoding"
            transcode -> packaging "Triggers packaging"
            packaging -> distribution "Push to storage/CDN"
        }
    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }

        theme default
    }

}
