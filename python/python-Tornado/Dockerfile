FROM python:3
COPY src/ /home
WORKDIR /home
RUN pip3 install flask tornado typing
CMD ["python3", "server.py"]