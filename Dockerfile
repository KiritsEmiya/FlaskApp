# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:3.7.3-slim

# If you prefer miniconda:
#FROM continuumio/miniconda3

EXPOSE 8000

WORKDIR /app
COPY requirements.txt ./

# Using pip:
RUN python3 -m pip install -r requirements.txt -i https://pypi.douban.com/simple

COPY . .

CMD ["python3", "manage.py"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "micromovie"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m micromovie"
