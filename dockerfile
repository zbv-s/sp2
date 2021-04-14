FROM ubuntu
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY 7171_jab.s . 
RUN apt-get update  
RUN apt-get install build-essential gdb gcc-multilib nano -y
RUN gcc -m32 -fno-pie 7171_jab.s -o 7171_jab -g
CMD ./7171_jab
