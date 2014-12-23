FROM phusion/passenger-ruby21:0.9.14
ENV HOME /root

CMD ["/sbin/my_init"]

RUN /build/utilities.sh

ADD config/vhost.conf /etc/nginx/sites-enabled/docker_demo.conf
RUN rm -f /etc/service/nginx/down

RUN apt-get install sqlite3 wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /home/app/docker_demo
COPY . /home/app/docker_demo
RUN chown -R app:app /home/app
WORKDIR /home/app/docker_demo

RUN usermod -u 1000 app
RUN su - app /home/app/docker_demo/build/setup.sh
