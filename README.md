# Foundry Classroom Project

This repository is a foundational setup for **Foundry** (a blazing-fast Ethereum development framework). It includes the initial project structure, dependencies, and essential configuration files.

## Project Structure

Here’s an overview of the directory and file structure:

- **`.github/workflows/`**  
  Contains GitHub Actions for CI/CD integration using Foundry.

- **`lib/`**  
  A directory for library dependencies used in the project.

- **`node_modules/`**  
  Auto-generated folder for Node.js dependencies (used in development or tools).

- **`script/`**  
  Contains scripts for deployment or other automation tasks. (e.g., deployment scripts).

- **`src/`**  
  Source code folder where your smart contracts reside.

- **`test/`**  
  Directory for test files to write unit and integration tests for your contracts.

- **`.gitignore`**  
  Specifies intentionally untracked files to ignore in the repository.

- **`.gitmodules`**  
  Used to define Git submodules if any are included in this project.

- **`README.md`**  
  This file! Provides information about the project.

- **`foundry.toml`**  
  The Foundry configuration file. Customize settings for the project here.

- **`package-lock.json` & `package.json`**  
  Dependency management files for any JavaScript/Node.js tools or libraries used.

- **`remappings.txt`**  
  Contains remappings for imports in Foundry to resolve library paths.

## Getting Started

Follow these steps to set up and run this project locally:

### Prerequisites

1. Install Foundry by following the [official installation guide](https://book.getfoundry.sh/getting-started/installation).

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo-url/foundry-live.git
   ```

2. Install Node.js dependencies:
   ```bash
   npm install
   ```

3. Build the Foundry project:
   ```bash
   forge build
   ```

### Running Tests

Write your tests in the `test/` directory and execute them using Foundry:

```bash
forge test
```

### Deployment Scripts

Scripts to deploy smart contracts can be found in the `script/` directory. Run them using:

```bash
forge script <script_name>
```

## Learning Goals

- Understand the basics of **Foundry** as an Ethereum development framework.
- Learn to write secure and efficient **smart contracts**.
- Practice unit and integration **testing** for smart contracts.
- Explore **deployment workflows** using Foundry scripts.
