#!/bin/bash
set -eux

apt-get update
apt-get install -y apache2

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
  <title>GCP Terraform Demo</title>
</head>
<body>
  <h1>Hello World!</h1>
  <p>Apache deployed successfully using Terraform on GCP.</p>
</body>
</html>
EOF

systemctl enable apache2
systemctl restart apache2
