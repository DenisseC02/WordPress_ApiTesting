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
    stage('Smoke Testing') {
      steps {
            script {
                load "/var/jenkins_home/envfile.groovy"
            }
            sh 'if [ ! -d "wp_api/reports/smoke" ]; then mkdir -p wp_api/reports/smoke; fi'
            sh 'robot -d wp_api/reports/smoke --loglevel TRACE -i smoke wp_api/tests'
    }
        post {
            always {

                archiveArtifacts artifacts: 'wp_api/reports/smoke/log.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/smoke/report.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/smoke/output.xml', fingerprint: true
                sh 'robotmetrics -I wp_api/reports/smoke'
            }
        }
    }
    stage('Regression Testing') {
      steps {
            script {
                load "/var/jenkins_home/envfile.groovy"
            }
            sh 'if [ ! -d "wp_api/reports/regression" ]; then mkdir -p wp_api/reports/regression; fi'
            sh 'robot -d wp_api/reports --loglevel TRACE wp_api/tests'
      }
        post {
            always {
                archiveArtifacts artifacts: 'wp_api/reports/regression/log.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/regression/report.html', fingerprint: true
                archiveArtifacts artifacts: 'wp_api/reports/regression/output.xml', fingerprint: true
                sh 'robotmetrics -I wp_api/reports/regression'
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
