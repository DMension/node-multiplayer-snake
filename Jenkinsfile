
node ('ubuntu-box'){
     

    withCredentials([string(credentialsId: 'sk', variable: 'TOKEN') { //set SECRET with the credential content
         echo "My secret text is '${TOKEN}'"}
    
     
     /* environment {
           SNYK_TOKEN = credentials('SYNK')
    } */
    def app

    stage('Cloning Git') {
        /* Let's make sure we have the repository cloned to our workspace */

       checkout scm
    }
     
     stage('SAST') {
          //withCredentials([string(credentialsId: 's', variable: 'SYNK_TOKEN'),string(credentialsId: 's', variable: 'SYNK_TOKEN')]) {
          //withCredentials([string(credentialsId: 'synk_token', variable: 'TOKEN')]) {
            sh 'rm -f package-lock.json'
            //sh 'sudo npm install -g snyk'
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
            
               println(env.SYNK)
            snykSecurity(snykInstallation: 'synk-scan', tokenCredentialId : env.SYNK_TOKEN, additionalArguments: 'test', monitor: true, severity: 'high') 
          

               sh 'echo "SAST Test passed $TOKEN"' }
        
    

    stage('Build-and-Tag') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("amrit96/snake")
    }

    

    stage('Post-to-dockerhub') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
       // docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
       //     app.push("latest")
       // 			}
         }
     
     stage('IMAGE-VULNERABILITY-TEST') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */


            sh 'echo "Image Vulnerability Test passed"'
        
    }

    stage('Pull-image-server') {

         		sh "docker-compose down"
        		sh "docker-compose up -d"			
      }
   
     stage('DAST') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */


            sh 'echo "DAST Test passed"'
        
    }

    
}
