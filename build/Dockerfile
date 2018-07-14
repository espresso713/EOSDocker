FROM eosio/eos

USER root
RUN mkdir /work
ADD ./shell/start.sh /work
RUN sed -i 's/\r$//' /work/start.sh
RUN echo "alias cleos='/opt/eosio/bin/cleos --wallet-url http://localhost:8888'" >> ~/.bashrc