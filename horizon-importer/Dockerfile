#
#   Docker for stellar horizon
#

FROM centos:centos7.1.1503

MAINTAINER https://github.com/gianluca-sabena

# --- --- ---  Update OS --- --- ---
RUN yum -y install epel-release; yum -y update
RUN yum -y install git tar

# --- --- --- Install ruby --- --- ---
RUN yum -y install bzip2 make
RUN curl -fsSL https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz| tar xzf - -C /opt
RUN cd /opt/ruby-install-0.5.0/ && make install
RUN ruby-install --system ruby 2.2.2

# --- --- --- Install horizon-importer (need it to create db schema) --- --- ---
RUN yum -y install http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm
RUN yum -y install postgresql94 postgresql94-devel sqlite-devel cyrus-sasl cyrus-sasl-devel libxml2-devel patch
ENV CONFIGURE_ARGS "with-pg-include=/usr/pgsql-9.4/include with-pg-config=/usr/pgsql-9.4/bin with-pg-lib=/usr/pgsql-9.4/lib"
RUN cd /opt && git clone https://github.com/stellar/horizon-importer.git
RUN cd /opt/horizon-importer && gem install bundler --conservative && bundle install

# --- --- --- Start --- --- ---
ADD build/start.sh /opt/start.sh
CMD /opt/start.sh


