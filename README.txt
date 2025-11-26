Step 1:
Created a clean project structure
made a GitHub repo and added four folders:

frontend/ → React app

backend/ → Node.js API

scripts/ → small tools for security/scanning

.github/workflows/ → GitHub Actions pipeline files

Step 2:
Inside the scripts folder, created a file "check-hardcoded-passwords.sh" to script scans your project for: passwords , API keys, secrets , AWS keys

If it finds any, it stops the build so secrets never get pushed to GitHub.

Step 3:
Inside .github/workflows/ci.yml, made a workflow that runs automatically whenever you push code.

It does two jobs:

- Runs the secret-scanner script
- Runs lint checks (only if frontend / backend has code)

Step 4:
Created a Dockerfile for frontend and backend files
- Backend Dockerfile
  Runs Node.js
  Installs only production dependencies

- Frontend Dockerfile
  Builds React into a static website
  Serves it using NGINX (industry standard)
  NGINX? Because React must be compiled into static HTML/CSS/JS and NGINX is the best for serving static files
  
Step 5: 
  Added a second script for security: Trivy image scan
  This script scans any Docker image for:
  HIGH vulnerabilities
  CRITICAL vulnerabilities
 - To prevent deploying insecure images.