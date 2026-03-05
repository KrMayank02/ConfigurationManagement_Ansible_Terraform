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


<img width="909" height="803" alt="image" src="https://github.com/user-attachments/assets/7228c7df-0b3d-4295-af58-56ea78a5edae" />

------------------------------------------------------------------------------------------------------------------------------------

Run the terraform workflow commands in sequence:

- terraform init
- terraform validate
- terraform plan
- terraform apply -auto-approve

<img width="933" height="552" alt="image" src="https://github.com/user-attachments/assets/e7bdd604-ca57-4494-a227-cbe3bfb62d1f" />

---------------------------------------------------------------------------------------------------------------------------------------

<img width="955" height="491" alt="image" src="https://github.com/user-attachments/assets/e3f70bdd-19ed-454f-a30e-4f56d9a59c7d" />

---------------------------------------------------------------------------------------------------------------------------------------

<img width="956" height="617" alt="image" src="https://github.com/user-attachments/assets/85dc0a39-504a-4817-b999-d8462bb6b317" />

----------------------------------------------------------------------------------------------------------------------------------------

<img width="960" height="494" alt="image" src="https://github.com/user-attachments/assets/f1cbcb53-ce87-4a6d-aefa-48ec45f12954" />

---------------------------------------------------------------------------------------------------------------------------------------

<img width="954" height="397" alt="image" src="https://github.com/user-attachments/assets/096ea740-946b-4b0f-a8f9-20eadb063b3d" />

----------------------------------------------------------------------------------------------------------------------------------------

Now navigate to AWS Cloud Infrastructure to check newly provisioned Resources:

5 AWS EC2 Instances (5 VMs) created successfully – screenshot:

<img width="942" height="565" alt="image" src="https://github.com/user-attachments/assets/10958b55-b01f-4428-a15e-de86c8111dfc" />

------------------------------------------------------------------------------------------------------------------------------------

AWS VPC got created successfully with required CIDR, Subnet, Route table, Security group:

<img width="959" height="421" alt="image" src="https://github.com/user-attachments/assets/b8682851-881f-4b43-ad21-f1ff3c4af5de" />

-------------------------------------------------------------------------------------------------------------------------------------

<img width="933" height="434" alt="image" src="https://github.com/user-attachments/assets/400abd52-2a1f-45b4-a8e2-33882075b239" />

----------------------------------------------------------------------------------------------------------------------------------

- Playbook Task: Java-21 was installed on all 5 EC2 instances.
- Playbook Task: Apache Tomcat-9 tar file was downloaded and extracted successfully.

<img width="962" height="460" alt="image" src="https://github.com/user-attachments/assets/d1ec10db-b2d5-4cf9-bef7-0bf12190b735" />

-------------------------------------------------------------------------------------------------------------------------------------

Playbook Task: Tomcat-9 server was installed and started successfully on all the 5 VMs (5 EC2 Instances):

<img width="920" height="577" alt="image" src="https://github.com/user-attachments/assets/98bebc76-a3a2-42ef-976e-589308c79fc7" />

----------------------------------------------------------------------------------------------------------------------------------------

Now destroy/delete the provisioned resources in the AWS Cloud Infrastructure

- terraform destroy -auto-approve

Command got executed successfully and all the terraform provisioned resources have been destroyed.

------------------------------------------------------------------------------------------------------------------------------------------

**The above Project with all it's Steps, Files & Settings - automated the provisioning of infrastructure on AWS, to get fully managed Virtual Machines (multiple EC2 instances) and configuring each of the VMs to install multiple applications is met, with the integration of Terraform and Ansible.**

