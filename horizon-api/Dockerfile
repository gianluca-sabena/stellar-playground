#
#   Docker for stellar horizon
#

FROM centos:centos7.1.1503

MAINTAINER https://github.com/gianluca-sabena

# --- --- ---  Update OS --- --- ---
RUN yum -y install epel-release; yum -y update
RUN yum -y install git tar

# --- --- --- Install Go --- --- ---
RUN curl -fsSL https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz| tar xzf - -C /usr/local
ENV GOPATH /opt/gocode
ENV PATH $PATH:/usr/local/go/bin:/opt/gocode/bin/

# --- --- --- Stellar horizon --- --- ---
RUN go get github.com/constabulary/gb/...
RUN go get -u github.com/jteeuwen/go-bindata/...
RUN cd /opt && git clone https://github.com/nullstyle/go-codegen.git && cd /opt/go-codegen && /opt/gocode/bin/gb build && cp /opt/go-codegen/bin/go-codegen /usr/local/bin
RUN cd /opt && git clone https://github.com/stellar/horizon.git && cd /opt/horizon && /opt/gocode/bin/gb build

# --- --- --- Start --- --- ---
ADD build/start.sh /opt/start.sh
CMD /opt/start.sh


