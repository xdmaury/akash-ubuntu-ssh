
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


## Run the Ubuntu

- Using the following SDL example, replace the environment variable `YOUR_PASSWORD` with your SSH access password.

- Deploy the SDL on Akash, check the logs to see a message indicating that the SSH password has been set. **During testing, I couldn't access without using the outgoing port 80, so I suggest keeping your application running to exit on this port.**

````
---
version: "2.0"
services:
  ubunut:
    image: xdmaury/akash-ubuntu-ssh:v1.0.0
    expose:
      - port: 5000
        as: 80
        to:
          - global: true
      - port: 22
        as: 22
        to:
          - global: true
    env:
      - SSH_PASS=<YOUR_PASSWORD>
profiles:
  compute:
    ubunut:
      resources:
        cpu:
          units: 1
        memory:
          size: 1024Mi
        storage:
          - size: 1024Mi
  placement:
    akash:
      pricing:
        ubunut:
          denom: uakt
          amount: 10000
deployment:
  ubunut:
    akash:
      profile: ubunut
      count: 1
