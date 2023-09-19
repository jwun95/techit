FROM python:3.11.5

WORKDIR /home/

RUN git clone https://github.com/noeul1114/techit.git

WORKDIR /home/techit/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=techit.settings.deploy && python manage.py migrate --settings=techit.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=techit.settings.deploy techit.wsgi --bind 0.0.0.0:8000"]


