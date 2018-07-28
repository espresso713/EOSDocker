FROM eosio/eos-dev

USER root

RUN  apt-get update && apt-get install tree && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN mkdir /eos_log
RUN mkdir -p /work/sample

ADD ./shell /work
ADD ./sample /work/sample
RUN sed -i 's/\r$//' /work/start.sh
RUN sed -i 's/\r$//' /work/sample/tutorial/tutorial.sh
RUN sed -i 's/\r$//' /work/sample/tic_tac_toe/tic_tac_toe.sh
RUN sed -i 's/\r$//' /work/sample/oasis/oasis.sh

RUN echo "alias cleos='/opt/eosio/bin/cleos --wallet-url http://127.0.0.1:8899'" >> ~/.bashrc




