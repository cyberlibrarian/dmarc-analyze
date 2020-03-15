FROM python:3

RUN apt update && apt -y dist-upgrade

RUN pip install checkdmarc

CMD [ "python", "./gather.sh" ]
