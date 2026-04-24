# 🚀 Development Environment Setup

This script was created to configure the development environment in **WSL2 or Ubuntu**, perfect if you are transitioning from Windows.

## 🛠️ What will be installed?

The script will install the following tools:

* **System:** Package updates (`apt update`) and essential tools (`curl`, `git`, `unzip`, `build-essential`).
* **Java Stack:** [SDKMAN!](https://sdkman.io/) (SDKs Manager).
    * **Java 21** (Temurin LTS).
    * **Maven** (Java Dependency Manager).
* **Web Stack:**
    * [NVM](https://github.com/nvm-sh/nvm) (Node Version Manager).
    * **Node.js** (LTS Version).
    * **Angular CLI 21** (Frontend Framework).

## 🚀 How to execute

Follow these steps:

### 1. Clone the repository
```bash
git clone [https://github.com/FelipeStefan0/setup-script.git](https://github.com/FelipeStefan0/setup-script.git)
cd setup-script
````

### 2. Set permission in the file
```bash
chmod +x setup-script.sh
````

### 3. Update the terminal
```bash
source ~/.bashrc
```


---
<br>

# 🐋 Docker Containers Workflow

| Action | Command | Description |
| :--- | :--- | :--- |
| **Spin Up** | `docker compose up -d` | Creates and starts the containers in the background. Use this for the first run or after modifying the `.yml` file. |
| **Stop** | `docker compose stop` | Gracefully shuts down the containers (recommended before turning off your PC). |
| **Start** | `docker compose start` | Restarts containers that were previously created and stopped. |
| **Remove** | `docker compose down` | Stops and removes containers and networks (does **not** delete database data). |
| **Status** | `docker ps` | Lists all active containers and their mapped ports. |

To keep your environment healthy and manage your system resources efficiently, follow this simple flow:

### 1. Start your session
```bash
docker compose start
```

### 2. Verify services are running
```bash
docker ps
```

### 3. End your session (before shutdown)
```bash
docker compose stop
```

---
<br>

# ⬆️ Update tools version

