workspace "NutriBot" "C4 Model for NutriBot" {
    !identifiers hierarchical

    model {
        // Define External Elements
        user = person "User" "A person who uses NutriBot to receive personalized nutrition advice."
        diagnosticCenters = softwaresystem "Diagnostic Centers" "Provide lab reports and DNA data for analysis."
        farmers = softwaresystem "Farmers & Food Suppliers" "Connect with consumers for sustainable and healthy food options."
        biomarkerAPIs = softwaresystem "Biomarker & DNA APIs" "Third-party services that analyze biomarker and genetic data."
        paymentGateway = softwaresystem "Payment Gateway" "Handles subscription and transaction payments for NutriBot services."

        // Define NutriBot System with Containers
        nutribot = softwaresystem "NutriBot System" "AI-powered nutrition platform providing dietary recommendations based on biomarkers and DNA data." {
            
            frontend = container "Frontend" "Next.js / React Native" "User interface for NutriBot, available as a PWA and mobile app."
            
            backend = container "Backend API" "Python - FastAPI/Django" "Processes health data, runs AI models, and manages authentication." {
                authService = component "Authentication Service" "Handles user authentication via OAuth2 and JWT."
                userProfile = component "User Profile Service" "Manages user biometrics and health data."
                recommendation = component "Recommendation Engine" "Generates personalized nutrition recommendations."
                dataIngestion = component "Data Ingestion Layer" "Processes lab reports, DNA uploads, and external health data."
                apiIntegration = component "Third-Party API Integration" "Communicates with biomarker and food APIs."
            }
            
            database = container "Database" "PostgreSQL, MongoDB" "Stores user profiles, health data, and recommendations."
            aiEngine = container "AI/ML Engine" "TensorFlow/PyTorch" "Analyzes biomarkers and provides personalized meal plans."
            thirdParty = container "Third-Party Integrations" "Integrates with external biomarker, DNA, and food databases."
        }

        // Relationships
        user -> nutribot "Uses for personalized nutrition"
        nutribot -> diagnosticCenters "Retrieves biomarker and DNA data from"
        nutribot -> farmers "Promotes sustainable food choices from"
        nutribot -> biomarkerAPIs "Fetches health insights from"
        nutribot -> paymentGateway "Processes transactions through"

        // Container-Level Relationships
        user -> nutribot.frontend "Uses"
        nutribot.frontend -> nutribot.backend "Sends user requests"
        nutribot.backend -> nutribot.database "Stores and retrieves data"
        nutribot.backend -> nutribot.aiEngine "Processes AI-driven recommendations"
        nutribot.backend -> nutribot.thirdParty "Fetches biomarker & food data from"
        nutribot.backend -> paymentGateway "Handles subscription payments securely"
    }

    views {
        systemLandscape {
            include *
            autolayout lr
        }

        systemContext nutribot {
            include *
            autolayout lr
            description "NutriBot System Context Diagram - Shows interactions with external systems."
        }

        container nutribot {
            include *
            autolayout lr
            description "NutriBot Container Diagram - Shows the internal containers and their interactions."
        }

        component nutribot.backend {
            include *
            autolayout lr
            description "NutriBot Backend API Component Diagram - Breakdown of backend microservices."
        }

        styles {
            element "Person" {
                background #ffcc80
                color #000000
                shape Person
            }
            element "Software System" {
                background #42a5f5
                color #ffffff
                shape RoundedBox
            }
            element "Container" {
                background #66bb6a
                color #ffffff
                shape Box
            }
            element "Database" {
                background #ff7043
                color #ffffff
                shape Cylinder
            }
            element "Component" {
                background #ab47bc
                color #ffffff
                shape Hexagon
            }
            element "Integration" {
                background #ffa726
                color #000000
            }
            element "External" {
                background #bdbdbd
                color #000000
            }
        }
    }
}
