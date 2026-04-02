# 🚀 3-Tier Infrastructure Deployment Using Terraform & Ansible

## 📌 Project Overview

This project demonstrates the deployment of a **production-ready 3-tier web application architecture** on AWS using:

* **Terraform** (Infrastructure as Code)
* **Ansible** (Configuration Management)

The architecture consists of:

* Web Tier (Public Subnet)
* Application Tier (Private Subnet)
* Database Tier (RDS in Private Subnet)

---

## 🏗️ Architecture Diagram

```
User → Web Server (Nginx - Public Subnet)
     → App Server (PHP - Private Subnet)
     → RDS Database (MySQL - Private Subnet)
```

---

## ⚙️ Technologies Used

* AWS (EC2, VPC, RDS, NAT Gateway)
* Terraform (Modules)
* Ansible (Automation)
* Nginx (Web Server)
* PHP (Application Layer)
* MySQL (Database)

---

## 📁 Project Structure

```
3-Tier-Terraform/
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── rds/
│
├── env/dev/
│   ├── main.tf
│   ├── variables.tf
│   └── terraform.tfvars
│
├── ansible/
│   ├── inventory.ini
│   ├── web.yml
│   └── app.yml
│
└── README.md
```

---

## 🔧 Prerequisites

Before running this project, ensure you have:

* AWS Account
* IAM User with permissions
* AWS CLI configured
* Terraform installed
* Ansible installed
* SSH key pair (.pem file)

---

## 🚀 Deployment Steps

### 1️⃣ Clone Repository

```bash
git clone <your-repo-url>
cd 3-Tier-Terraform/env/dev
```

---

### 2️⃣ Initialize Terraform

```bash
terraform init
```

---

### 3️⃣ Plan Infrastructure

```bash
terraform plan
```

---

### 4️⃣ Apply Infrastructure

```bash
terraform apply
```

👉 Note down outputs:

* `web_ip`
* `app_ip`
* `db_endpoint`

---

### 5️⃣ Configure Ansible Inventory

Edit:

```
ansible/inventory.ini
```

```ini
[web]
<WEB_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem

[app]
<APP_PRIVATE_IP> ansible_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem \
ansible_ssh_common_args='-o ProxyCommand="ssh -i /path/to/key.pem ubuntu@<WEB_PUBLIC_IP> -W %h:%p"'
```

---

### 6️⃣ Test Connectivity

```bash
ansible -i inventory.ini all -m ping
```

---

### 7️⃣ Configure Web Server

```bash
ansible-playbook -i inventory.ini web.yml
```

---

### 8️⃣ Configure Application Server

```bash
ansible-playbook -i inventory.ini app.yml
```

---

### 9️⃣ Setup Database

SSH into App Server:

```bash
ssh ubuntu@<APP_PRIVATE_IP>
```

Connect to RDS:

```bash
mysql -h <DB_ENDPOINT> -u admin -p
```

Run:

```sql
CREATE DATABASE testdb;

USE testdb;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);
```

---

## 🌐 Access Application

Open browser:

```
http://<WEB_PUBLIC_IP>
```

✔ Enter name
✔ Submit form
✔ Data stored in database

---

## 🔐 Security Design

* Web Server → Public access (HTTP, SSH)
* App Server → Private subnet (SSH via Bastion)
* DB → Accessible only from App Server
* NAT Gateway → Internet access for private subnet

---

## 🔄 Automation

* Terraform → Infrastructure provisioning
* Ansible → Server configuration
* Dynamic inventory usage (no hardcoding)

---

## 📸 Deliverables

* ✔ Terraform code (modular)
* ✔ Ansible playbooks
* ✔ Architecture diagram
* ✔ Working demo screenshots/video
* ✔ GitHub repository

---

## 🎯 Key Features

* Modular Terraform design
* Secure 3-tier architecture
* Private subnet isolation
* Bastion-based access
* Fully automated setup

---

## 💡 Future Improvements

* Add Load Balancer
* Use Auto Scaling Group
* Add CI/CD pipeline
* Use Terraform remote backend (S3 + DynamoDB)

---

## 🧠 Learning Outcomes

* Infrastructure as Code (IaC)
* AWS networking (VPC, NAT, IGW)
* Configuration automation (Ansible)
* Secure architecture design
* Debugging real-world DevOps issues

---

## 👨‍💻 Author

**Sudarshan Mane**

---


Give it a ⭐ on GitHub!
