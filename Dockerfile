FROM ubuntu
ENV HOME=/root
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install apache2 -y
WORKDIR /
RUN git clone https://github.com/buildmystartupio/basicwebapp
WORKDIR /basicwebapp/
#RUN git checkout -b newfeature
#RUN git pull origin newfeature
RUN cp index.html /var/www/html/
RUN service apache2 restart
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
