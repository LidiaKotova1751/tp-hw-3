FROM python:3.11-alpine

WORKDIR /app

COPY generate.py /app/

ENTRYPOINT [ "python", "/app/generate.py" ]

CMD [ "/data" ]