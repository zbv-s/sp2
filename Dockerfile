FROM ubuntu
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get install build-essential gdb gcc-multilib nano -y
WORKDIR /home
COPY task.c .
COPY task.s .
CMD ["/bin/bash"]
