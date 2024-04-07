// @Library('hipstershop-shared-library') _

// def configMap = [ // variable creation
//     application: "goApp", // jenkins-shared-library nodejsVm name
//     component: "frontend"
// ]

pipeline {
    agent any
    // {
    //     node{
    //         label 'GO-AGENT'
    //     }
    // }
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
                script{
                    def fileContents = readFile 'main.go' // Read the content of main.go
                    // Extract the application version from the file content
                    packageVersion = fileContents.AppVersion
                    echo "application version: $packageVersion"
                   
                    
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