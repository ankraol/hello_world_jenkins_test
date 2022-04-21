FROM gcc:4.9

COPY . /HelloWorld
WORKDIR /HelloWorld/

RUN gcc -o HelloWorld hello_world.c

CMD ["./HelloWorld"]