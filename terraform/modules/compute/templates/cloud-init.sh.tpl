#!//bin/bash

amazon-linux-extras install -y nginx1.12 docker python3

yum update -y

yum install -y git curl wget

pip3 install --user awscli docker-compose

cat << 'EOF' > /usr/share/nginx/html/index.html
<HTML>
<HEAD> <TITLE>DEMO TIME!</TITLE> </HEAD>
<BODY>
  <IMG SRC="http://www.reactiongifs.com/r/mgc.gif">
</BODY>
</HTML>
EOF

chmod 0755 /usr/share/nginx/html/index.html

systemctl enable nginx.service
systemctl start nginx.service