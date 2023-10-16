In this lecture , wwe will discuss the initial setup, for puppet enviroment,
There are ways we can deploy the puppet enviroment
The first is for use in production enviroment. we use a master agent-based eployment. the seond is self-contained-model

# puppet resource --types | grep -i user

# puppet descrive <resource-name>

# puppet parser validate

# puppet apply --noop

# puppet apply

# puppet agent -tv

# puppet cert list --all

- puppet config print | grep -i module
  cd /etc/puppetlabs/code/environments/production/modules
- puppet module --help
- puppet module generate abdullah-ntpmodule
