FROM archlinux:latest as mirrorlist
RUN pacman --noconfirm -Syu reflector
RUN /usr/bin/reflector --ipv4 -p https --save /etc/pacman.d/mirrorlist

FROM archlinux:latest
COPY --from=mirrorlist /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist
RUN pacman --noconfirm -Syu archiso

CMD /usr/bin/mkarchiso -v -o /out /profile
