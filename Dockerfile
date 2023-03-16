FROM python:3.10-slim-bullseye

RUN apt-get -y update && apt-get install -y wget gnupg
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install ./google-chrome-stable_current_amd64.deb -y

# Install snapsht and run setup
RUN pip install snapsht && snapsht setup

# Set the work directory
WORKDIR /app

# Copy the GitHub Action script
COPY entrypoint.sh /app

# Set execute permissions for the entrypoint script
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]