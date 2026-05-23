# You should be ec2-user already (from 'sudo su - ec2-user')
# All sudo commands work normally
 
# Update all system packages (latest patches)
sudo dnf update -y
 
# Install Python 3, pip, git, and nginx
sudo dnf install -y python3 python3-pip git nginx
 
# Install PostgreSQL client (so we can run psql)
sudo dnf install -y postgresql15
 
# Install build tools needed by some Python packages
sudo dnf install -y gcc python3-devel libpq-devel
 
# Verify what we just installed
python3 --version       # Should show Python 3.11.x or higher
nginx -v                # Should show nginx version
psql --version          # Should show psql 15.x
git --version
psql -h rp-db.cgbagmyk2vna.us-east-1.rds.amazonaws.com -U portaladmin -d portal
# You should be ec2-user already (from 'sudo su - ec2-user')
# All sudo commands work normally
 
# Update all system packages (latest patches)
sudo dnf update -y
 
# Install Python 3, pip, git, and nginx
sudo dnf install -y python3 python3-pip git nginx
 
# Install PostgreSQL client (so we can run psql)
sudo dnf install -y postgresql15
 
# Install build tools needed by some Python packages
sudo dnf install -y gcc python3-devel libpq-devel
 
# Verify what we just installed
python3 --version       # Should show Python 3.11.x or higher
nginx -v                # Should show nginx version
psql --version          # Should show psql 15.x
git --version
psql -h rp-db.cgbagmyk2vna.us-east-1.rds.amazonaws.com -U portaladmin -d portal
# You should be ec2-user already (from 'sudo su - ec2-user')
# All sudo commands work normally
 
# Update all system packages (latest patches)
sudo dnf update -y
 
# Install Python 3, pip, git, and nginx
sudo dnf install -y python3 python3-pip git nginx
 
# Install PostgreSQL client (so we can run psql)
sudo dnf install -y postgresql15
 
# Install build tools needed by some Python packages
sudo dnf install -y gcc python3-devel libpq-devel
 
# Verify what we just installed
python3 --version       # Should show Python 3.11.x or higher
nginx -v                # Should show nginx version
psql --version          # Should show psql 15.x
git --version
psql -h rp-db.cgbagmyk2vna.us-east-1.rds.amazonaws.com -U portaladmin -d portal
# Create app directory owned by ec2-user
sudo mkdir -p /opt/rp-app
sudo chown ec2-user:ec2-user /opt/rp-app
cd /opt/rp-app
 
# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate
 
# Upgrade pip and install dependencies
pip install --upgrade pip
pip install flask boto3 psycopg2-binary gunicorn
 
# Verify
which python    # Should show /opt/rp-app/venv/bin/python
flask --version
sudo vim app.py
export RESUME_BUCKET=rp-resume-uploadef
export DB_SECRET_NAME=rp/db-credentials
export SENDER_EMAIL=efelucky024@gmail.com
export AWS_DEFAULT_REGION='us-east-1'
python app.py
sudo vim /etc/systemd/system/rp-app.service
sudo touch /var/log/rp-app-access.log /var/log/rp-app-error.log
sudo chown ec2-user:ec2-user /var/log/rp-app-*.log
 
# Tell systemd to read the new service file
sudo systemctl daemon-reload
 
# Start the service
sudo systemctl start rp-app
 
# Check it's running
sudo systemctl status rp-app
 
# Make it start on boot
sudo systemctl enable rp-app
sudo systemctl status rp-app
sudo vim /etc/systemd/system/rp-app.service
sudo systemctl daemon-reload
sudo systemctl start rp-app
sudo systemctl enable rp-app
sudo systemctl status rp-app
sudo vim /etc/systemd/system/rp-app.service
sudo systemctl daemon-reload
sudo systemctl start rp-app
sudo systemctl enable rp-app
sudo systemctl status rp-app
curl http://localhost:5000/health
curl http://localhost:5000/whoami
sudo vim /etc/nginx/conf.d/rp-app.conf
# Test config syntax
sudo nginx -t
 
# If "syntax is ok" and "test is successful", proceed:
sudo systemctl start nginx
sudo systemctl enable nginx
 
# Test from inside the instance
curl http://localhost/health
psql -h rp-db.cgbagmyk2vna.us-east-1.rds.amazonaws.com -U portaladmin -d portal
