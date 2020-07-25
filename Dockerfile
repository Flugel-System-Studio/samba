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
LABEL maintainer="akihiro.toda <akihiro.toda.fss@gmail.com>"
LABEL description="Samba docker container, based on Alpone Linux."
LABEL version="1.0"

# ###########################################################
# 
# ディレクトリ作成
# 
# ###########################################################
RUN mkdir /mnt/private
RUN mkdir /mnt/public
RUN mkdir /mnt/business

# ###########################################################
# 
# ファイルコピー
# 
# ###########################################################
COPY ./config/smb.conf /etc/samba/
COPY ./config/account.conf /usr/local/bin/account.conf
COPY ./start_samba.sh /usr/local/bin/start_samba.sh

# ###########################################################
# 
#  package導入
# 
# ###########################################################
RUN apk update && apk --no-cache upgrade && apk --no-cache add samba

ENTRYPOINT [ "/bin/ash" ]

CMD [ "/usr/local/bin/start_samba.sh" ]