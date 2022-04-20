FROM gcc:4.9

COPY . /HelloWorld
WORKDIR /HelloWorld/

RUN gcc -o HelloWorld helloworld.c

CMD ["./HelloWorld"]