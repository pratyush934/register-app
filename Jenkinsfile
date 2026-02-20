pipeline {
    agent { label 'Jenkins-Agent' }

    tools {
        jdk 'jdk'
        maven 'maven'
    }

    environment {
        APP_NAME    = "register-app-pipeline"
        RELEASE     = "1.0.0"
        DOCKER_USER = "pratyush934"
        IMAGE_NAME  = "${DOCKER_USER}/${APP_NAME}"
        IMAGE_TAG   = "${RELEASE}-${BUILD_NUMBER}"
        JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
    }

    stages {

        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Source') {
            steps {
                git branch: 'master',
                    credentialsId: 'github-cred',
                    url: 'https://github.com/pratyush934/register-app'
            }
        }
        
         stage('Build Application') {
            steps {
                dir('webapp') {
                    sh 'mvn clean package -DskipTests=true'
                }
            }
        }

        stage('Test Application') {
            steps {
                dir('webapp') {
                    sh 'mvn test'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                dir('webapp') {
                    withSonarQubeEnv('sonar') {
                        withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                            sh '''
                              mvn sonar:sonar \
                              -Dsonar.login=$SONAR_TOKEN
                            '''
                        }
                    }
                }
            }
        }
        
        stage('Quality Gate') {
            steps {
                
                waitForQualityGate abortPipeline: false
                
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-cred') {
                        dockerImage.push("${IMAGE_TAG}")
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh '''
                  docker run --rm \
                    -v /var/run/docker.sock:/var/run/docker.sock \
                    aquasec/trivy:latest image \
                    ${IMAGE_NAME}:latest \
                    --no-progress \
                    --severity HIGH,CRITICAL \
                    --exit-code 0
                '''
            }
        }

        stage('Cleanup Local Images') {
            steps {
                sh '''
                  docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true
                  docker rmi ${IMAGE_NAME}:latest || true
                '''
            }
        }
        stage("Trigger CD Pipeline") {
            steps {
                script {
                    sh "curl -v -k --user admin:${JENKINS_API_TOKEN} -X POST -H 'cache-control: no-cache' -H 'content-type: application/x-www-form-urlencoded' --data 'IMAGE_TAG=${IMAGE_TAG}' 'ec2-13-203-65-70.ap-south-1.compute.amazonaws.com:8080/job/Register-One-CD/buildWithParameters?token=gitops-token'"
                }
            }
       }

    }

    post {
        success {
            echo "✅ CI Pipeline completed successfully"
        }
        failure {
            echo "❌ CI Pipeline failed"
        }
        always {
            cleanWs()
        }
    }
}
