pipeline {
    agent any

    environment {
        PROJECT_ID = "velvety-maker-480912-u3"
        REGION = "us-central1"
        REPO = "school-app-repo"
        IMAGE_NAME = "school-app"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/jeevanbaddi/school-management-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Pytest') {
            steps {
                sh 'python3 -m pytest -v'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                """
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh """
                docker tag ${IMAGE_NAME}:${BUILD_NUMBER} \
                ${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE_NAME}:${BUILD_NUMBER}
                """
            }
        }

        stage('Push Image to Artifact Registry') {
            steps {
                sh """
                docker push \
                ${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/${IMAGE_NAME}:${BUILD_NUMBER}
                """
            }
        }
    }
}
