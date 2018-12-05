FROM centos:7
RUN \
  yum update -y && \
  yum install -y openssl openssh-server

RUN \
	adduser linho && \ 
	/usr/bin/ssh-keygen -A && \
	echo "embms1234" | passwd --stdin linho

ENTRYPOINT ["/usr/sbin/sshd","-D"] 