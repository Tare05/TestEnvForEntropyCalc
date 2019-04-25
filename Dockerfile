# Use official ubuntu image
FROM ubuntu:18.10

# Set workdir
WORKDIR /app

# Copy the files from the current folder to docker
COPY . /app

RUN apt update
RUN apt -y install curl
RUN apt -y install libvips
RUN apt -y install python
RUN apt -y install python-pip
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN mkdir -p instance/uploads
RUN chmod +x restart.sh

EXPOSE 8085

CMD ["./restart.sh"]
