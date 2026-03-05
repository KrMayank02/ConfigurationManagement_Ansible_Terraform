# ConfigurationManagement_Ansible_Terraform

**Objective:** This Project automate the provisioning of infrastructure and configuring it with integration of Terraform and Ansible.

**Real-time Scenario:** Royal Hotel is a globally leading chain of hotels. Recently, as part of scaling up operations, they aim to automate every operation in the hotel. For this, multiple applications are onboarded within all the hotel’s main server. To keep these applications up and running and to scale them appropriately, they need fully managed virtual machines on AWS.
They want to have an automated provisioned infrastructure through which they can create a new developer VM and manage some developer configurations on that server.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Major Tools Used in This Project:

- **Ansible:** Ansible automates IT tasks, streamlining configuration management, application deployment, and orchestration. It uses simple, human-readable YAML files called playbooks.
- **Terraform:** Terraform automates the provisioning and management of infrastructure using declarative configuration files. It supports multiple cloud providers and services, enabling consistent infrastructure deployment and scaling.

  
## Supporting Package/Plugins/Server/Provider Resources used in Project:
  
- AWS EC2 (Amazon Linux 2023): 5 VMs (5 EC2 Instances)
- AWS VPC, Subnets, Route Table, Security Group, Key Pair
- Java: java-21-amazon-corretto.x86_64 (as task of Ansible Playbook)
- Apache Tomcat-9 Server (as task of Ansible Playbook)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
## High Level Project Diagram:

<img width="934" height="560" alt="image" src="https://github.com/user-attachments/assets/adb015d5-0698-488f-ac1a-34c632786ace" />

----------------------------------------------------------------------------------------------------------------------------------------

## High Level Tasks/Steps:

- Install Ansible and Terraform on Master machine of Linux distribution.
- Create a directory as “terraform-multi-instances” and create these files: tomcat-playbook.yaml, ansible.cfg & terraform.tf
- Run the terraform workflow and Ansible playbook commands in sequence.
- Destroy/delete the provisioned resources in the AWS Cloud Infrastructure.

-----------------------------------------------------------------------------------------------------------------------------------------


## Output Result Screenshots:

Install Ansible and Terraform on Master machine of Linux distribution

<img width="942" height="279" alt="image" src="https://github.com/user-attachments/assets/c2a2602f-17dd-4878-9353-a2c1d9713ecc" />

--------------------------------------------------------------------------------------------------------------------------------

<img width="888" height="209" alt="image" src="https://github.com/user-attachments/assets/ad6f94b5-bf7c-400b-885c-392bc83a98f6" />

--------------------------------------------------------------------------------------------------------------------------------

Create an Ansible Playbook with name “tomcat-playbook.yaml” to define tasks for installing Java and then Tomcat-9 on 5 - EC2 Instances

<img width="933" height="602" alt="image" src="https://github.com/user-attachments/assets/13cb6704-c46e-468b-b8f9-8795f7851a77" />

----------------------------------------------------------------------------------------------------------------------------------

Create Ansible Config file “ansible.cfg”

vi ansible.cfg

<img width="884" height="226" alt="image" src="https://github.com/user-attachments/assets/a09f795e-237c-49a7-b628-51d8c8c8b0f3" />

-----------------------------------------------------------------------------------------------------------------------------------

Create Terraform Configuration file “terraform.tf”

<img width="950" height="539" alt="image" src="https://github.com/user-attachments/assets/2f726a7c-6231-4703-b3c6-e3a7c33b86cf" />

-------------------------------------------------------------------------------------------------------------------------------------

<img width="944" height="986" alt="image" src="https://github.com/user-attachments/assets/bce56896-c805-40d0-89b8-8f541f0096a3" />

-------------------------------------------------------------------------------------------------------------------------------------

<img width="975" height="869" alt="image" src="https://github.com/user-attachments/assets/2b6ddfe5-11b5-4169-88c6-3f68ea0c74d2" />

------------------------------------------------------------------------------------------------------------------------------------

<img width="952" height="958" alt="image" src="https://github.com/user-attachments/assets/ee6e4803-678d-4b1e-98bb-3b1d5d292ce6" />









