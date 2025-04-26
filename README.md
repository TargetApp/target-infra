# target-infra

This repository contains infrastructure setups for **TargetApp**, a web application designed for diagnosing biotic stress in coffee leaves through advanced image analysis. The setups define the necessary configurations for databases, queues, and storage systems required by the application.

## Available Setups

- **v0**: Initial setup using MySQL for database, queue, and storage components. See the [v0 README](setups/v0/README.md) for details.

## How to Use

1. Navigate to the desired setup directory (e.g., `setups/v0`).
2. Follow the instructions in the specific setup's `README.md` file.

## Project Structure

- `setups/`: Contains different versions of the infrastructure setups.
  - `v0/`: Setup using only MySQL.
- `components/`: Contains reusable components for the setups.
  - `database/`: Database setup component.
  - `queue/`: Queue setup component.
  - `storage/`: Storage setup component.

## Contributing
Feel free to contribute with new components, setups, or improvements to the existing ones. Please follow the existing structure and conventions used in the repository.