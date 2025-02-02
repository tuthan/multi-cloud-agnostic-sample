# Multi-Cloud Agnostic Sample using Terraform, Kubernetes, Argocd & Helm  

This repository demonstrates a multi-cloud agnostic sample project designed to work with major cloud providers like **Google Cloud Platform (GCP)**, **Microsoft Azure**, and **Amazon Web Services (AWS)**. The setup uses **Terraform** for infrastructure provisioning, **Kubernetes (K8s)** for container orchestration, and **Helm** for template & package management. The sample can also be tested locally using **Minikube**.  

---

## 📜 **Overview**  

This project aims to showcase how to design and deploy a multi-cloud agnostic solution using widely adopted tools. It enables seamless provisioning, deployment, and management of infrastructure and applications across different cloud platforms.  

### **Key Features**  
- **Cloud Agnostic Design**: Support for GCP, Azure, and AWS.  
- **Local Testing**: Fully functional local development and testing using Minikube.  
- **Infrastructure as Code (IaC)**: Provision infrastructure using Terraform modules.  
- **Application Deployment**: Use Kubernetes, Argocd and Helm to deploy applications.  
- **Extensible**: Easy to extend for additional cloud providers or custom configurations.  

---

## 🛠️ **Components**  

### **1. Terraform**  
- Cloud-agnostic IaC setup using Terraform.  
- Modular structure for scalability and reusability.  

### **2. Kubernetes**  
- Cluster orchestration and workload management.  
- Deployment configurations compatible with Minikube and major cloud Kubernetes services.  

### **3. Helm**  
- Helm charts for managing Kubernetes applications.  
- Parameterized and reusable Helm templates.  

---

## 🖼️ **High-Level Architecture**  

![Alt text](diagrams/Cloud_Agnostic.png?raw=true "Diagram")

---

## 🚀 **Getting Started**  

### **Prerequisites**  
- Terraform/OpenTofu  
- Kubernetes CLI (kubectl)  
- Helm (v3 or later)  
- Minikube (for local testing)  
- Cloud CLI tools (e.g., gcloud, az, aws-cli)  

### **1. Clone the Repository**  
```bash
git clone https://github.com/tuthan/multi-cloud-agnostic-sample.git
cd multi-cloud-agnostic-sample/iac
```

### **2. Local Testing with Minikube**  

1. Start Minikube:  
   ```bash
   minikube start
   ```
2. Apply configurations and deploy using tofu.
   ```bash
   chmod +x tofu.sh
   #Run plan
   ./tofu.sh -v envs/local.tfvars -t module.argocd
   #Apply
   ./tofu.sh -v envs/local.tfvars -t module.argocd -a true
   #Apply all if argocd already installed
   ./tofu.sh -v envs/local.tfvars -a true
   ```
3. Apply configurations and deploy using terraform via makefile.
   ```bash
   #Deploy argocd
   make VAR_FILE=envs/local.tfvars TARGET=module.argocd
   #Deploy all if argocd already installed
   make VAR_FILE=envs/local.tfvars
   ```
4. Access argocd
   ```bash
   kubectl port-forward svc/argocd-server -n argocd 8080:80
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
   ```
---

## 🌐 **Multi-Cloud Support**  

### **1. GCP**  
- Configure `google` provider in Terraform.  
- Deploy to GKE (Google Kubernetes Engine).  
- Karpenter provider is not yet supported on GKE

### **2. Azure**  
- Configure `azurerm` provider in Terraform.  
- Deploy to AKS (Azure Kubernetes Service).  

### **3. AWS**  
- Configure `aws` provider in Terraform.  
- Deploy to EKS (Elastic Kubernetes Service).  

---

## 📁 **Directory Structure**  

```plaintext
multi-cloud-agnostic-sample/
├── iac/            # Infrastructure provisioning files
├── k8s/                  # Kubernetes manifests and Helm charts
├── diagrams/             # High-level diagrams
├── README.md             # Project documentation
└── .gitignore            # Git ignore rules
```

---

## 🔧 **Configuration**  

- All configurations are parameterized through environment variables and input files.  
- Refer to `terraform/variables.tf` and `k8s/values.yaml` for customization options.  

---

## 📄 **License**  
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.  

---

## 🤝 **Contributing**  
We welcome contributions! Please read the [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute.  

---

## 🧑‍💻 **Author**  
Created by [Hung Vo](https://github.com/tuthan/).  

Feel free to open issues or contact me for any questions!  

--- 

Enjoy deploying your multi-cloud applications effortlessly! 🎉