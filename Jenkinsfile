pipeline {
    agent {
        docker { 
            image 'python:3.8.16-bullseye'
            args '-u root'
        }
    }
  environment {
    DOCKERHUBPASS=credentials('dockerusrpass')
    REPO_NAME="${GIT_URL.split('/')[-2]}/${GIT_URL.split('/')[-1].replace('.git', '')}"
    PYTHONPATH='/var/jenkins_home/workspace/ApiTesting_feature_ci_jenkins_dv'
    HOST='http://192.168.0.21'
  }
  stages {
    stage('Setup Environment') {
      steps {
        sh 'python -m pip install --upgrade pip'
        sh 'pip install -r requirements.txt --no-cache'
      }
    }
    // stage('Code Inspection') {
    //   environment {
    //     SONAR_TOKEN = credentials('SONAR_TOKEN')
    //   }
    //   agent { 
    //     docker {  image 'danisku/sonarqube:1.3' 
    //               args '--entrypoint=""' 
    //     }
    //   }
    //   steps {
    //     withSonarQubeEnv('SonarQube') {
    //       sh '~/sonar-scanner/bin/sonar-scanner \
    //             -Dsonar.organization=at19org \
    //             -Dsonar.projectKey=at19org_devops \
    //             -Dsonar.sources=. \
    //             -Dsonar.branch.name=${BRANCH_NAME} \
    //             -Dsonar.host.url=https://sonarcloud.io \
    //             -Dsonar.language=python'
    //     }
    //   }
    //   post {
    //       always {
    //         archiveArtifacts artifacts: '.scannerwork/report-task.txt', fingerprint: true
    //       }
    //       success {
    //         sh 'STAGE_INFO_FOR_MAIL="<br>${STAGE_INFO_FOR_MAIL}<br>Stage: Test - status: passed"'
    //       }
    //       failure {
    //         sh 'STAGE_INFO_FOR_MAIL="<br>${STAGE_INFO_FOR_MAIL}<br>Stage: Test - status: failed"'
    //       }
    //   }
    // }
    // stage("Quality Gate") {
    //   steps {
    //     timeout(time: 5, unit: 'MINUTES') {
    //       waitForQualityGate abortPipeline: true
    //     }
    //   }
    // } 
    stage('Smoke Testing') {
      steps {
            script {
                load "/var/jenkins_home/envfile.groovy"
            }
            sh 'echo $PYTHONPATH'
            sh 'robot -d wp_api/reports --loglevel TRACE -i smoke wp_api/tests'
      }
        post {
            always {
                archiveArtifacts artifacts: 'wp_api/reports/log.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/report.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/output.xml', fingerprint: true
                sh 'robotmetrics -I wp_api/reports'

            }
        }
    }
    stage('Regression Testing') {
      steps {
            script {
                load "/var/jenkins_home/envfile.groovy"
            }
            sh 'echo $PYTHONPATH'
            sh 'robot -d wp_api/reports --loglevel TRACE wp_api/tests'
      }
        post {
            always {
                archiveArtifacts artifacts: 'wp_api/reports/log.html', fingerprint: true
            }
        }
    }
  }
  post{
    always{
      sh 'echo docker system prune -a --volumes -f'
      emailext( 
          to: 'danielv.quarksocial@gmail.com',
          subject: "Deployment of ${REPO_NAME} - Build #${currentBuild.number} - Pipeline: ${env.JOB_NAME} - Status: ${currentBuild.currentResult}",
          body: "The deployment of ${REPO_NAME} is complete.<br> \
                  Details:<br>Build Number: ${currentBuild.number}<br> \
                  // echo ${env.STAGE_INFO_FOR_MAIL}<br> \
                  Pipeline Name: ${env.JOB_NAME}<br> \
                  Status: ${currentBuild.currentResult}<br> \
                  Commit #${GIT_COMMIT}<br> \
                  Please review: ${env.BUILD_URL}",
          mimeType: 'text/html',
          recipientProviders: [[$class: 'DevelopersRecipientProvider']]
      )
    }
  }
}
