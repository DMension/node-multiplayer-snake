
node ('ubuntu-box'){
     
    def app

    stage('Cloning Git') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build-and-Tag') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("amrit96/snake")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Post-to-dockerhub') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("latest")
        			}
         }

    stage('Pull-image-server') {

         app.inside {
         		sh "docker-compose down"
        		sh "docker-compose up -d"
        	}			
      }
   

    
}
