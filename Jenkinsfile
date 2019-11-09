pipeline {
  agent any
  environment {
    IMAGE = 'utahpipeline'
  }
  stages {
    stage('Build') {
      steps {
          sh 'docker info'
        }
      }


    stage('Build and Publish Image') {
      when {
        branch 'master'
      }
      steps {
        sh "docker build -t ${IMAGE}"
      }
    }
  }
}
