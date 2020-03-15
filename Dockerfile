FROM python:3

RUN pip install checkdmarc

CMD [ "python", "./gather.sh" ]
