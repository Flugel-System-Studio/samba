# ###########################################################
# 
# ベースイメージを指定
# 
# ###########################################################
FROM alpine:3.12.0


# ###########################################################
# 
# Label
# 
# ###########################################################
LABEL maintainer= "akihiro.toda <akihiro.toda.fss@gmail.com>"
LABEL description="Samba docker container, based on Alpone Linux."
LABEL version="0.1"

# ###########################################################
# 
#  package導入
# 
# ###########################################################
RUN apk update && apk --no-cache upgrade && apk --no-cache add samba

ENTRYPOINT [ "/bin/ash" ]

CMD [ "/usr/local/bin/start_samba.sh" ]