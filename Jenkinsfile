// @Library('hipstershop-shared-library') _

def configMap = [ // variable creation
    application: "goApp", // jenkins-shared-library nodejsVm name
    component: "frontend"
]

pipeline {
    agent {
        node{
            label 'GO-AGENT'
        }
    }
    environment { 
        packageVersion = ''
            
    }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }

    stages {
        stage('Get the version') {
            steps { 
                def fileContents = Jenkins.readFile('main.go') // Read the content of main.go
                // Extract the application version from the file content
                def packageVersion = fileContents =~ /const AppVersion = "([^"]*)"/
                // Check if the version is found
                if (packageVersion) {
                    // Access the captured version group (group 1)
                    packageVersion = packageVersion[0][1]
                    echo "Application version: $packageVersion"
                } else {
                    error "Application version not found in main.go"
                }
            }
        }
        stage('build') {
            steps {
                sh """
                    go build -o ${configMap.component}
                """
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}