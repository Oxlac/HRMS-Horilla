FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y libcairo2-dev gcc
WORKDIR /ems
COPY . /ems
RUN pip install -r requirements.txt
COPY media/ /media
RUN rm -rf ./media

EXPOSE 8000
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]