# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.11.6
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install apt requirements
RUN apt update -y && apt upgrade -y && \ 
    apt install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/* 

# Cloning the repository
RUN git clone https://github.com/Rajbhaiya1/mangabot/ app

WORKDIR /app

# Install pip requirements
RUN pip install -r requirements.txt

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["bash", "start.sh"]
