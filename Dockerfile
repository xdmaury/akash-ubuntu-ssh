FROM ubuntu:latest

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    software-properties-common \
    wget \
    ssh \
    nano \
    screen \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add deadsnakes PPA repository to install Python 3.9
RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.9.6
RUN apt-get update && \
    apt-get install -y \
    python3.9 \
    python3.9-dev \
    python3.9-distutils \
    python3.9-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pip for Python 3.9
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3.9 get-pip.py && \
    rm get-pip.py


# Unset noninteractive mode
ENV DEBIAN_FRONTEND=


# Define the working directory
WORKDIR /home

# Copy the startup script
COPY start.sh /home/start.sh

# Expose necessary ports
EXPOSE 22
EXPOSE 5000

# Set permissions for the startup script
RUN chmod +x /home/start.sh

# Define the entrypoint command
ENTRYPOINT ["/home/start.sh"]