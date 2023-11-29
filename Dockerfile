FROM debian:bookworm AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install sudo
# RUN apt update && \
#     apt upgrade -y && \
    # apt install -y software-properties-common curl wget gpg git build-essential sudo && \
    # wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg && \
    # echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu jammy main" | tee /etc/apt/sources.list.d/ansible.list && \
    # apt update && \
    # apt install -y ansible && \
    # apt clean autoclean && \
    # apt autoremove --yes

FROM base AS davis
RUN mkdir -p /etc/sudoers.d
RUN addgroup --gid 1000 davis
RUN adduser --gecos davis --uid 1000 --gid 1000 --disabled-password davis
RUN echo "davis ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/davis
RUN chmod 0440 /etc/sudoers.d/davis
USER davis
WORKDIR /home/davis

FROM davis
COPY . .
CMD ["sh", "-c", "ansible-playbook main.yml"]