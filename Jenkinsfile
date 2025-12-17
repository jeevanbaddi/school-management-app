pipeline {
    agent any

    stages{
        stage('checkout scm'){
            steps{
                git branch: 'main',
                    url: 'https://github.com/jeevanbaddi/school-management-app.git'
            }
        }
        stage('Install Dependencies'){
            steps{
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Pytest'){
            steps{
                sh 'python3 -m pytest -v'
            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t school-app:ci .'
            }
        }
        }
    }