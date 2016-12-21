# **Infrastructure bootstraping, application deployment and monitoring**

## Overview

This repo have configured for running two VM's (monitoring system and application server). All provisioning tasks are done using Ansible playbooks 

### From where to start

To start provisioning process this repo should be cloned locally.
Command:
```
git clone  https://github.com/agubagu/vm-deploy.git
```

### VM's booting up

To bootstrap VM's, just run vagrant up command inside vm-deply forlder.

### Monitoring system provisioning

For monitoring system provisioning you need to connect to monitoring VM and run Ansible playbooks

Command:
```
vagrant ssh monitoring
ansible-playbook /vagrant/monitoring.yml --connection=local
```
#### For Windows users: 
If you don't have ssh.exe installed, you can connect to monitoring machine through Putty.
IP: 127.0.0.1 Port: 2222. User: vagrant Password: vagrant2016

### Application server provsioning

Now you need to connect to application server and run appropriate playbook on it

Command:
```
vagrant ssh deploy
ansible-playbook /vagrant/client_install.yml --connection=local
```
#### For Windows users: 
If you don't have ssh.exe installed, you can connect to deploy machine through Putty.
IP: 127.0.0.1 Port: 2200. User: vagrant Password: vagrant2016

### Checklist

After successful provisioning:

 1. Monitoring system should be accessible on http://127.0.0.1:8870/icingaweb2/authentication/login
	User: icingaadmin Password: icingaadmin
 2. Application should be accessible on http://127.0.0.1/test:8880 (HTTP) and https://127.0.0.1/test:4443 (HTTPS)
 
### Stress test
For stress testing we will need to run siege command from monitoring server
Command:
```
   siege -c 20 -b -i 192.168.49.11/test
```
Warning alarm will be raised on 50 req/s limit.
Critical alarm  will be raised on 100 req/a limit



 
 
 

