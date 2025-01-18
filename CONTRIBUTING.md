# Contributing to multi-cloud-agnostic-sample

Thank you for considering contributing to multi-cloud-agnostic-sample! We appreciate your interest and effort in making this project better. Below are the guidelines to help you get started.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How Can I Contribute?](#how-can-i-contribute)
    - [Reporting Bugs](#reporting-bugs)
    - [Suggesting Features](#suggesting-features)
    - [Submitting Changes](#submitting-changes)
3. [Development Workflow](#development-workflow)
4. [Style Guidelines](#style-guidelines)
5. [License](#license)

## Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [email@example.com].

## How Can I Contribute?

### Reporting Bugs

If you find a bug, please create an issue on our [GitHub Issues page](https://github.com/tuthan/multi-cloud-agnostic-sample/issues). Include:

- A clear and descriptive title.
- Steps to reproduce the issue.
- Expected and actual behavior.
- Any relevant screenshots or logs.
- Your environment details (OS, browser, etc.).

### Suggesting Features

We welcome feature suggestions! To suggest a feature:

1. Check if the feature already exists or has been suggested in [GitHub Issues](https://github.com/tuthan/multi-cloud-agnostic-sample/issues).
2. Open a new issue with the title "Feature Request: [Your Feature]".
3. Provide a detailed description of the feature, its use case, and any examples.

### Submitting Changes

To submit changes:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/my-feature`).
3. Make your changes, following the [style guidelines](#style-guidelines).
4. Test your changes thoroughly.
5. Commit your changes with a descriptive message (`git commit -m "Add feature: my-feature"`).
6. Push to your fork (`git push origin feature/my-feature`).
7. Open a pull request on the main repository.

## Development Workflow

1. Clone the repository: `git clone https://github.com/tuthan/multi-cloud-agnostic-sample.git`
2. Install dependencies as required:
    - For Terraform or OpenTofu, install the latest version from [terraform.io](https://www.terraform.io/).
    - For Kubernetes, ensure `kubectl` is installed and configured.
    - For Helm, install the latest version from [helm.sh](https://helm.sh/).
3. Validate and test changes:
    - For Terraform or OpenTofu, run `terraform validate` and `terraform plan` to check configurations.
    - For Kubernetes manifests, use `kubectl apply --dry-run` or `kubeval` for validation.
    - For Helm charts, use `helm lint` and `helm template` to ensure correctness.
4. Follow the branching model:
    - `main`: Production-ready code.
    - `develop`: Ongoing development.
    - Feature branches: `feature/your-feature`.
5. Run project-specific tests and ensure all changes are stable before creating a pull request.

## Style Guidelines

- Follow best practices for Terraform or OpenTofu, Kubernetes (k8s), and Helm templates:
  - Use descriptive and consistent naming conventions for Terraform or OpenTofu modules, Kubernetes manifests, and Helm charts.
  - Ensure Terraform or OpenTofu configurations are modular and reusable, adhering to the principle of least privilege.
  - Validate Kubernetes manifests using tools like `kubectl apply --dry-run` or `kubeval`.
  - Lint Helm charts with tools like `helm lint` and ensure proper use of values files for configuration.
- Write clear and concise commit messages.
- Include comments for complex or non-obvious code.

## License

By contributing to this repository, you agree that your contributions will be licensed under the same license as the project. See [LICENSE](LICENSE) for details.

---

Thank you for contributing! Together, we can make multi-cloud-agnostic-sample better.
