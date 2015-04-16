# Jenkins Example

This example collects a default setup for Jenkins, that we use to build our hardening modules.

## Modules

The setup uses the hardening cookbooks combined with other community cookbooks to setup jenkins.

- [ntp](https://github.com/gmiranda23/ntp) best-practice, but not required for hardening projects
- [chef-os-hardening](https://github.com/TelekomLabs/chef-os-hardening)
- [chef-ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening)
- [nginx](https://github.com/miketheman/nginx)
- [jenkins-hardening](https://github.com/TelekomLabs/chef-jenkins-hardening)

## Usage with Vagrant

```bash
vagrant up
```

## Usage with `knife-solo`

Install the dependencies:

```bash
# install berkshelf
gem install berkshelf

# installs knife-solo
gem install knife-solo
```

Download the kitchen and bootstrap your server:

```bash
# download ci kitchen
git clone https://github.com/TelekomLabs/chef-jenkins-hardening.git
cd chef-jenkins-hardening/example

# update your ssh key in `data_bags/users/root.json'

# bootraps a fresh server with the cookbooks
knife solo bootstrap user@YOURIP nodes/master.json
```
