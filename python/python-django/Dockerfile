FROM python:3
COPY src/ /home
WORKDIR /home
RUN pip3 install django
CMD ["python3", "site/manage.py", "runserver", "0.0.0.0:5003"]