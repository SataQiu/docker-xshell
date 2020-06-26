FROM xshell:base-tmp

MAINTAINER "SataQiu <1527062125@qq.com>"

WORKDIR /home/wine/.wine/drive_c/'Program Files'/NetSarang/'Xshell 4'

CMD ["wine", "Xshell.exe"]
