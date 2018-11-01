pipeline {
    agent any
        parameters {
            choice(
                name: 'tf_state',
                choices:"planned\npresent\nabsent",
                description: "Choose appropriate!")
            string(
                name: 'tf_plan_file_path',
		    defaultValue:"aws.tfplan",
                description: "Path of the plan file")
            string(
                name: 'projectpath',
		    defaultValue:"aws",
                description: "Project Path")
    }
    stages {
        stage("Ansible Playbook Execution") {
            steps {
         
          sh('echo Ansible Playbook Execution')

          wrap([$class:'AnsiColorBuildWrapper', 'colorMapName': 'XTerm']) {

            sh "export ANSIBLE_FORCE_COLOR=true; "

               ansiblePlaybook(

                 installation: 'Ansible2.7.1',

                 playbook: 'terraform.yml',
                   
                 limit: 'localhost',  

                 colorized: 'true',

                 tags: 'terraform',

                 extras: '-e projectpath=${projectpath} -e tf_state=${tf_state} -e tf_plan_file_path=${tf_plan_file_path} -vvv'

               )

          }

       }
        }
    }

	
}
