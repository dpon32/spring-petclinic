#!/bin/env groovy

//library('ldop-shared-library@fd16602cad0f97ca1b04090f93a0540ddc871b45') _

pipeline {
  agent none

  environment {
    IMAGE = "dpon32/petclinic-tomcat"
  }

  stages {
    stage('Build container') {
      agent any
      steps {
        script {
          if ( env.BRANCH_NAME == 'develop' ) {
            pom = readMavenPom file: 'pom.xml'
            TAG = pom.version
          } else {
            TAG = env.BRANCH_NAME
          }
          sh "docker build -t ${env.IMAGE}:${TAG} ."
        }
      }
    }

    stage('Run local container') {
      agent any
      steps {
        sh 'docker rm -f petclinic-tomcat-temp || true'
        sh "docker run -d --network=dev --name petclinic-tomcat-temp ${env.IMAGE}:${TAG}"
      }
    }
  }
}
