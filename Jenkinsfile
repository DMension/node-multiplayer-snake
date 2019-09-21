node ('master'){  
    def app
    stage('Cloning Git') {
        /* Let's make sure we have the repository cloned to our workspace */
       checkout scm
    }  
    stage('Build-and-Tag') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        sh "echo Hi"
        //app = docker.build("amrit96/snake")
    }
    stage('Post-to-dockerhub') {
   
     /* docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("latest")
        			}*/
        sh "echo hi"
         }
    stage('Pull-image-server') {

        /* 		sh "docker-compose down"
        		sh "docker-compose up -d"		*/
        echo "Hi"
      }
}
