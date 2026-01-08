# ConfigurationManagement_Ansible_Terraform
This Project automate the provisioning of infrastructure and configuring it with integration of Terraform and Ansible.

**Real-time scenario:** Royal Hotel is a globally leading chain of hotels. Recently, as part of scaling up operations, they aim to automate every operation in the hotel. For this, multiple applications are onboarded within all the hotel’s main server. To keep these applications up and running and to scale them appropriately, they need fully managed virtual machines on AWS.
They want to have an automated provisioned infrastructure through which they can create a new developer VM and manage some developer configurations on that server.

**Major Tools Used in This Project:**
- Ansible: Ansible automates IT tasks, streamlining configuration management, application deployment, and orchestration. It uses simple, human-readable YAML files called playbooks.
- Terraform: Terraform automates the provisioning and management of infrastructure using declarative configuration files. It supports multiple cloud providers and services, enabling consistent infrastructure deployment and scaling.
Supporting Package/Plugins/Server/Provider Resources used in Project:
- AWS: It is a comprehensive cloud computing platform providing on demand compute power, database storage, content delivery, and other functionalities to help businesses scale and grow.
- AWS EC2 (Amazon Linux 2023): 5 VMs (5 EC2 Instances)
- AWS VPC, Subnets, Route Table, Security Group, Key Pair
- Java: java-21-amazon-corretto.x86_64 (as task of Ansible Playbook)
- Apache Tomcat-9 Server (as task of Ansible Playbook)
  
**High Level Diagram:**

