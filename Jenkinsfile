node {

    def imageName = "java-tomcat-app:1.0"
    def containerName = "tomcat-app"
    def appPort = "8081"

    stage('Checkout Code') {
        git branch: 'master',
            url: 'https://github.com/NehaKyatham/onlinebookstore.git'
    }

    stage('Build WAR (Maven)') {
        sh """
        mvn -Dmaven.repo.local=/var/lib/jenkins/.m2/repository clean package -DskipTests
        """
    }

    stage('Verify WAR') {
        sh """
        ls -lh target/*.war
        """
    }

    stage('Build Docker Image') {
        sh """
        docker build -t ${imageName} .
        """
    }

    stage('Deploy Tomcat Container') {
        sh """
        docker stop ${containerName} || true
        docker rm ${containerName} || true

        docker run -d \
            --name ${containerName} \
            -p ${appPort}:8080 \
            ${imageName}
        """
    }
}

