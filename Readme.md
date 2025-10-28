<h1 align="center">DevOps Local + CI/CD Project</h1>

<p align="center">
  A full-stack DevOps project demonstrating Docker Compose, Terraform, Grafana monitoring, and CI/CD pipelines.
</p>

---

<h2>📂 Project Structure</h2>

<pre>
devops-project/
├── backend/
│   ├── Dockerfile
│   └── ...
├── frontend/
│   ├── Dockerfile
│   └── ...
├── monitoring/
│   └── grafana/
│       ├── provisioning/
│       │   ├── dashboards/
│       │   │   └── my_dashboard.json
│       │   ├── dashboards.yml
│       │   └── datasources.yml
├── infrastructure/
│   └── terraform/         # Docker network, volumes, or cloud-ready IaC
├── docker-compose.yml      # Base services
├── docker-compose.override.yml  # Local dev overrides
├── docker-compose.ci.yml   # CI-specific overrides
└── .github/workflows/
    └── ci.yml              # GitHub Actions CI workflow
</pre>

---

<h2>⚙️ Prerequisites</h2>

<ul>
  <li>Docker & Docker Compose</li>
  <li>.NET SDK 6.0+</li>
  <li>Node.js 18+</li>
  <li>Terraform 1.5+ (optional, for IaC)</li>
  <li>GitHub account (for CI/CD)</li>
</ul>

---

<h2>💻 Local Development</h2>

1. **Clone the repo**

<pre>
git clone https://github.com/your-username/devops-project.git
cd devops-project
</pre>

2. **Provision local infrastructure with Terraform** (optional)

<pre>
cd infrastructure/terraform
terraform init
terraform apply -auto-approve
</pre>

3. **Run the full stack locally using Docker Compose**

<pre>
docker-compose up --build
</pre>

- Services included:
  - Backend: `http://backend:5000` (inside Compose) / `http://localhost:5000` locally
  - Frontend: `http://localhost:3000`
  - Grafana: `http://localhost:3000` (default admin: admin/admin or configured in .env)


4. **Access Grafana dashboards**

- Dashboards are preloaded from `monitoring/grafana/provisioning/dashboards/`.
- Login with admin credentials.
- Any dashboard exported as JSON from Grafana can be placed there to auto-load.

---

<h2>🛠️ CI/CD Pipeline (GitHub Actions)</h2>

- CI workflow file: `.github/workflows/ci.yml`
- Features:
  - Builds backend and frontend **inside Docker containers**
  - Runs backend **unit tests** inside Docker
- CI uses `docker-compose.yml + docker-compose.ci.yml` for containerized builds.

**Trigger:**

- On push to `main`
- On pull request targeting `main`


Production can use:

Docker Compose (simplest)

Kubernetes / Docker Swarm

Cloud provider (Azure, AWS, GCP)

Grafana dashboards can be reused; environment variables or secrets should be injected securely.


<h2>📊 Monitoring</h2>
Prometheus: collects metrics from backend services.

Grafana: visualizes metrics via pre-provisioned dashboards.

Dashboards live in monitoring/grafana/provisioning/dashboards/ and load automatically on container startup.

<h2>📦 Notes & Best Practices</h2>
Local vs CI vs Prod:

docker-compose.override.yml → local dev (volumes, hot reload)

docker-compose.ci.yml → CI (no volumes, CI env variables)

Base docker-compose.yml → common definition for all environments

Infrastructure as Code (Terraform) ensures reproducibility and prepares for cloud migration.


