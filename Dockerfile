FROM python:3
MAINTAINER Michael McDonnell

ENV PROJECT_DIR /opt/dmarc-gather

# Update debian packages
RUN apt update && apt -y dist-upgrade

# Install the checkdmarc python system
RUN pip install checkdmarc

# Prepare the project files
RUN mkdir ${PROJECT_DIR} ${PROJECT_DIR}/bin ${PROJECT_DIR}/lib ${PROJECT_DIR}/share

# Get the Alexa Top 1 Millions
ADD gather.sh ${PROJECT}/bin/gather.sh
ADD domains.txt ${PROJECT}/share/domains.txt

# Open port 22 for SSH remote access and monitoring
EXPOSE 22

# Start the gathering process
CMD [ "/bin/bash", "${PROJECT_DIR}/gather.sh", "${PROJECT_DIR}/share/top1m.csv ]
