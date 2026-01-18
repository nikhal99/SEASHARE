SEASHARE: DevSecOps Infrastructure Pipeline
📌 Project Overview
SEASHARE is a professional DevSecOps implementation designed to demonstrate automated security within a cloud infrastructure lifecycle. This project focuses on containerizing a web application, provisioning AWS resources via Terraform, and orchestrating a Jenkins CI/CD pipeline that leverages AI-driven remediation to fix infrastructure vulnerabilities.

________________________________________
🛠️ Tools & Technologies
●	Cloud Provider: AWS (EC2, Security Groups).

●	CI/CD Orchestrator: Jenkins (Running locally via Docker).
●	Infrastructure as Code: Terraform.
●	Containerization: Docker & Docker Compose.

●	Security Scanning: Trivy.
●	AI Remediator: Gemini / GenAI (Used for security report analysis and code remediation).

________________________________________
📂 Directory Structure

Plaintext
SEASHARE/
├── app/
│   ├── extraction.py          # Python web application logic
│   └── requirements.txt       # App dependencies
├── jenkins/
│   └── docker-compose.yml     # Orchestration for Jenkins environment
├── terraform/
│   ├── main.tf                # AWS IaC with intentional vulnerabilities
│   ├── .terraform.lock.hcl
│   └── terraform.tfstate
├── Dockerfile                 # Web app container definition
├── docker-compose.yml         # Local application orchestration
└── README.md                  # Project documentation

________________________________________
🚀 Implementation Stages
1. Application Containerization & Local Testing
The Python application was successfully containerized to ensure environment parity. Using Docker Compose, the service was validated to run and process data correctly.

Fig 1: Terminal output showing the successful Docker build and layer exporting.
Fig 2: Application running successfully and processing JSON data payloads.
2. Infrastructure as Code (AWS & Terraform)
I used Terraform to provision an EC2 instance in the ap-south-1 region. The configuration included an intentional vulnerability: the Security Group was configured with SSH (Port 22) open to 0.0.0.0/0.

Fig 3: Initializing Terraform and validating the infrastructure configuration.
Fig 4: Verifying AWS IAM identity (devsecops-user) before deployment.
3. CI/CD Pipeline & Security Scanning
Jenkins was deployed as a container to orchestrate the DevSecOps workflow. The pipeline integrates Trivy to scan the Terraform files for misconfigurations before any cloud deployment occurs.

Fig 5: Launching the Jenkins environment using Docker Compose.
Fig 6: Jenkins dashboard fully initialized and ready for pipeline execution.
________________________________________
🛡️ AI-Driven Security Remediation
During the Infrastructure Security Scan stage, Trivy flagged the permissive security group as a critical risk.

Fig 7: Trivy 0.68.2 identifying vulnerabilities within the IaC directory.
AI Remediation Log
●	Prompt Used: "Review the Trivy scan report for main.tf. Identify the risks of open port 22 and provide a secure Terraform configuration to remediate this."
●	Risk Identified: Global SSH access allows for brute-force attacks and unauthorized entry.
●	Improvement: The AI suggested restricting ingress to a specific admin IP and ensuring all attached EBS volumes are encrypted.
●	Verification: After updating the code, the pipeline was re-run, achieving a success state with zero critical issues.

________________________________________
🔗 Repository Link
The complete source code, Docker configurations, and the final secured Terraform files are available here: 👉 GitHub: nikhal99/SEASHARE



         ![1](https://github.com/user-attachments/assets/de248566-7895-40e0-8c87-b0afe6f81c24)
![2](https://github.com/user-attachments/assets/b2ad9a66-2cde-436f-bffa-bddf88693262)
![3](https://github.com/user-attachments/assets/f5f37860-c582-4390-a014-90e4cc9b6fe5)
![4](https://github.com/user-attachments/assets/a0f084aa-fa94-4754-afca-a31c8881492f)
![5](https://github.com/user-attachments/assets/82218fe4-811b-4cac-b84b-5e97cff922bd)
![7](https://github.com/user-attachments/assets/81e29e0a-0c0f-48b3-85c0-7b05156ae7f1)
![aws-compose success](https://github.com/user-attachments/assets/bcc5c70f-fc28-43a7-baa2-bdc683c3368b)
![8](https://github.com/user-attachments/assets/e4e1f5f7-7d2a-4fb1-b384-8a0d9560fe6c)


