pipeline {
  agent {
    label 'ubuntu'
  }

 // tools {nodejs "node"}

  stages {

    stage('Cloning Git') {
      steps {
        git 'https://github.com/amritsql/node-multiplayer-snake.git'
      }
    }

    stage('SAST') {
      steps {
        echo '#### sast scan started #########'
        echo '#### sast scan end #############'
  }
    }

    stage('Build-and-Tag') {
      steps {
         sh "docker build . -t amrit96/snake"
         echo 'build & tagging completed'
      }
    }
     stage('post-to-dockerhub') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
        sh "docker push amrit96/snake"
        }
      }
    }
    stage('pull-image-server') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
         sh "docker-compose down"
         sh "docker-compose up -d"
        }
      }
    }
    stage('DAST') {
      steps {
         echo 'successfully posted to dockerhub'
      }
    }

  }
}
