Ansible Playbook Ubuntu Setup
==============================

This playbook is used to deploy configuration to target devices running Ubuntu 14.04.

Tested on Ubuntu 14.04 64bits, patches are welcome.

## Installation

Clone this repo to your Ansible roles directory

    git clone https://github.com/jhernandezcsc/ansible-linux-setup.git


## Usage

The user must have root permissions in order to install system packages and start services.

Example Playbook:
```
  ---
  - hosts: gss-wks
    become: yes
    become_method: sudo

    roles:
      - { role: common, tags: common }
      - { role: teamviewer, tags: teamviewer }
```

## Important notes

This playbook has been tested on a local virutal machine environment running Ubuntu 14.04 64bits.
Installation packages and configuration are organized in roles as instalaltion steps.

To execute this playbook the destination PC should be accessible via SSH (This means that the IP,
cscadmin login and ssh service need to be set). Also **PermitRootLogin** should be added into the **sshd_config**_ file.

It is a good idea to reboot the appliance after running this playbook for the first time to ensure
that the default cscadmin password has been removed.

After running this playbook, the workstation will be deployed with the following packages:
  - Unetbootin
  - openjdk 7
  - Libreoffice 5.1
  - Teamviewer
  - Clamtk
  - SFLPhone Client
  - AdobeFlash pluggin
  - AdobeReader
  - It will also be configured with the required security settigns to comply with password and security policies..

Example Playbook run:

A typical run of this playbook might look like this, but could vary based on your local ~/.ssh/config and DNS.

     ansible-playbook -i wks-inv --ask-vault-pass linux-setup.yml

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
