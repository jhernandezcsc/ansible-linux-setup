Ansible Playbook VyOS
=====================

This playbook is used to deploy configuration to target devices running VyOS.

Tested on VyOS 1.1.7, patches are welcome.

## Installation

Clone this repo to your Ansible roles directory

    git clone git://github.com/gregfaust/ansible-vyos.git vyos

Install the role requirements using ansible-galaxy

    ansible-galaxy install -r requirements.yml -p roles --force --ignore-errors --ignore-certs

## Usage

The user must have root permissions in order to copy keys and set permissions.

Example Playbook:

     ---
     - hosts: vyos
       become: root
       roles:
         - { role: gregfaust.vyos,
             vyos_configuration: "vyos_configurations/vyos_configuration_{{ ansible_hostname }}.j2"
           }
       tasks:
         - name: install OpenVPN Key
           copy: src="vyos_configurations/{{ ansible_hostname }}.key" dest="/config/auth/{{ ansible_hostname }}.key" owner=root group=vyattacfg mode=0775

## Important notes

This role has been tested on a local VyOS environment using VyOS 1.1.7

This playbook assumes that the VyOS appliance is accessible via SSH (This means that the IP,
login and ssh service need to be set).  It is a good idea to reboot the appliance after running
this playbook for the first time to ensure that the default vyos/vyos login has been removed.

After running this playbook, you will no longer be able to make ANY local changes to the
VyOS appliance.  Any attempt to adjust a configuration manually will result in "Set Failed".
There should never be a reason to make local configuraiton changes manually, but if a
situation arises that requires making local configuration changes the VyOS appliance must be
rebooted before it will once again allow local configuration changes.

Example Playbook run:

A typical run of this playbook might look like this, but could vary based on your local ~/.ssh/config and DNS.

     ansible-playbook --inventory=inventory-vyos --ask-vault-pass playbook-vyos.yml

## License

Licensed under the GPLv3 License. See the LICENSE file for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
