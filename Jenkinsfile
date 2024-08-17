pipeline {
    agent any

    stages{
        stage("Docker Build"){
            steps{
                script{
                    sh "docker build -t fajarsujai/servic2:${GIT_COMMIT} --build-arg PORT=3002 ."
                }
            }
        }


        stage("Docker Push"){
            steps{
                script{
                    sh "docker push fajarsujai/service2:${GIT_COMMIT}"
                }
            }
        }


        stage("Finish"){
            steps{
                script{
                    echo("berhsil push image docker")
                }
            }
        }

        // stage("Run ansible playbook"){
        //     steps{
        //         script{
        //            sh "docker run ansible ansible-playbook -i inventory/inventory.yaml -e 'proj_env=develop' playbook.yaml"
        //         }
        //     }
        // }

        // stage("Docker version"){
        //     steps{
        //         script{
        //             sh "docker version"
        //         }
        //     }
        // }
    }
}