FROM archlinux:latest

RUN pacman --noconfirm -Syu archiso

CMD /usr/bin/mkarchiso -v -o /out/ /profile
