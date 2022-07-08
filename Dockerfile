FROM openeuler/openeuler:21.03

RUN yum update && \
yum install -y vim wget git python3-pip

RUN pip3 install -r requirements.txt

RUN pip3 install uwsgi

WORKDIR /work/ci_projects_builders

COPY . /work/ci_projects_builders

ENV LANG=en.US_UTF-8

EXPOSE 8080

ENTRYPOINT ["uwsgi", "--ini", "/work/ci_projects_builders/deploy/production/uwsgi.ini"]
