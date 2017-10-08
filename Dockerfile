FROM scratch

EXPOSE 8080

COPY bin/main /

CMD ["/main"]