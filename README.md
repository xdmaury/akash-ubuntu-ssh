
# Image for Akash | Docker - Python Development Environment

This Docker image is optimized for use with Akash or Docker and provides a pre-configured environment suitable for Python application development.

## Included Software Packages:
- `ssh`: OpenSSH server for remote access.
- `nano`: Nano text editor for easy file editing.
- `screen`: GNU Screen for terminal multiplexing.
- `git`: Git version control system for source code management.

## Python Environment:
- Python 3.9.6 and related development tools (`python3.9`, `python3.9-dev`, `python3.9-distutils`, `python3.9-venv`) are pre-installed.
- `pip` is included for managing Python packages.

## Customization:
- OpenSSH server is configured to allow root login for easy setup.
- Ports 22 (SSH) and 5000 are exposed for potential services.

## Usage:
Ideal for setting up Python development environments on the Akash cloud platform.
Users can easily build containers based on this image to kickstart Python development projects.
