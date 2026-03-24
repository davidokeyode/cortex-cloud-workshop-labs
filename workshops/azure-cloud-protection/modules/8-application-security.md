# Module 8 — Application Security

## Overview

In this module you explore Cortex Cloud's Application Security capabilities, including Software Composition Analysis (SCA), secrets scanning and software supply chain visibility.

## Steps

### 8.1 — Connect Code Repositories

1. Navigate to **Application Security → Repositories**.
2. Connect your GitHub and/or Azure DevOps repositories.
3. Cortex Cloud automatically scans for:
   * IaC misconfigurations (covered in Module 5)
   * Open-source vulnerabilities (SCA)
   * Hardcoded secrets
   * License compliance

### 8.2 — Software Composition Analysis (SCA)

1. Navigate to **Application Security → SCA**.
2. Review open-source package vulnerabilities:
   * **Package name** and version
   * **CVE** with CVSS score and severity
   * **Fix version** (if available)
   * **Dependency path** (direct vs. transitive)

### 8.3 — Secrets Scanning

1. Navigate to **Application Security → Secrets**.
2. Review detected secrets such as:
   * API keys and tokens
   * Database connection strings
   * Cloud provider credentials
   * SSH private keys
3. For each finding, see the file path, line number and commit history.

### 8.4 — Supply Chain Graph

1. Navigate to **Application Security → Supply Chain**.
2. Review the visual supply chain graph showing:
   * Code repositories
   * CI/CD pipelines
   * Container registries
   * Cloud deployment targets
3. Identify risky paths from code to production.

### 8.5 — CI/CD Security

1. Navigate to **Application Security → CI/CD Risks**.
2. Review pipeline configuration risks:
   * Overly permissive pipeline permissions
   * Unprotected branches
   * Missing code review requirements
   * Pipeline injection risks

### 8.6 — Enforcement Rules

1. Navigate to **Application Security → Enforcement**.
2. Configure enforcement rules:
   * **Hard fail**: Block the build for critical/high severity findings
   * **Soft fail**: Warning for medium severity findings
   * **Skip**: Informational for low severity findings

## Supported Languages (SCA)

| Language | Package Manager |
|---|---|
| Python | pip, pipenv, poetry |
| Node.js | npm, yarn, pnpm |
| Java | Maven, Gradle |
| .NET | NuGet |
| Go | Go modules |
| Ruby | Bundler |
| PHP | Composer |
| Rust | Cargo |

## Key Concepts

| Concept | Description |
|---|---|
| **SCA** | Software Composition Analysis — identifies vulnerable open-source packages |
| **Secrets Scanning** | Detects hardcoded credentials and sensitive data in code |
| **Supply Chain** | Visual mapping of the software delivery pipeline |
| **Enforcement Rules** | Controls determining build pass/fail based on security findings |

## Next Steps

Proceed to [Module 9 — Container Apps Protection](9-container-apps-protection.md).
