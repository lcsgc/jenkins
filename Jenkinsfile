pipeline {
  agent any
  environment {
    IMAGE = 'utahpipeline'
    PORT = '80'
  }
  stages {
    stage('Build') {
      steps {
        sh "docker build -t ${IMAGE} ."
        }
      }


    stage('Test') {
      when {
        branch 'master'
      }
      steps {
        sh "docker run -d --name ${IMAGE}-container -p 8089:${PORT} ${IMAGE}"
      }
      post {
        success {
           sh "curl http://localhost:8089"
        }
      }
    }
  }
}
