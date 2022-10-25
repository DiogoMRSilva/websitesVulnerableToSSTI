FROM python:3
COPY src/ /home
WORKDIR /home
RUN pip3 install flask mako
CMD ["python3", "server.py"]