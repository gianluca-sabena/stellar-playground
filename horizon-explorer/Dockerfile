#
#   Docker for stellar horizon
#

FROM centos:centos7.1.1503

MAINTAINER https://github.com/gianluca-sabena

# --- --- ---  Update OS --- --- ---
RUN yum -y install epel-release; yum -y update
RUN yum -y install git tar nodejs npm make
RUN npm -g install npm bower

# --- --- --- Stellar webapps --- --- ---
RUN cd /opt && git clone https://github.com/stellar/stellar-tutorials.git && cd stellar-tutorials/network-explorer && npm install && bower install --allow-root

# --- --- --- Start --- --- ---
ADD build/start.sh /opt/start.sh
CMD /opt/start.sh


