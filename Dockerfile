FROM python:3.6-alpine
RUN pip install pipenv
RUN mkdir /app
COPY ./hello.py /app
COPY ./Pipfile /app
COPY ./Pipfile.lock /app
WORKDIR /app
RUN pipenv install
ENV FLASK_APP=hello.py
ENTRYPOINT ["pipenv", "run"]
EXPOSE 5000
CMD ["python", "hello.py"]
