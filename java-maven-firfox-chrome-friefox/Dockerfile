FROM ubuntu:16.04

LABEL  linhos "linhos@126.com"

#---------------------JDK-8 MAVEN-----------------------------
ADD jdk-8u171-linux-x64.tar.gz /usr/lib/jdk
ADD apache-maven-3.5.3-bin.tar.gz /opt/maven/

ENV M2_HOME=/opt/maven/apache-maven-3.5.3
ENV JAVA_HOME=/usr/lib/jdk/jdk1.8.0_171
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$CLASSPATH:$M2_HOME/lib
ENV PATH=$PATH:$M2_HOME/bin
ENV MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
ENV PATH=$PATH:/usr/local/bin

#-----------------------FIREFOX---xvfb------------------------------
RUN apt-get update \
	&& apt-get -y install ttf-wqy-microhei ttf-wqy-zenhei \
	&& apt-get install procps -y \
	&& apt-get install firefox  -y \
	&& apt-get install curl -y \
	&& apt-get install xvfb -y\
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/ /tmp/* /var/tmp/*


# -------------------------------CHROME------------------------------------

RUN apt-get update &&apt-get install wget -y \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
	&& apt-get update \
    && apt-get install google-chrome-stable -y \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/ /tmp/* /var/tmp/*

#-----------------------------------------DRIVER----------------------
ADD geckodriver /usr/local/bin/
ADD chromedriver /usr/local/bin/
RUN chmod 755 /usr/local/bin/geckodriver \
	&& chmod 755 /usr/local/bin/chromedriver


#-----------------------xvfb init and chrome launcher-------------------------------
ENV DISPLAY :99

# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

# Allow root to execute Google Chrome by replacing launch script
ADD google-chrome-launcher /usr/bin/google-chrome
RUN chmod a+x /usr/bin/google-chrome
