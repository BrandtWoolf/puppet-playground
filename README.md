# Puppet Playground

Lab project containing Vagrant and Ansible code to easily standup a puppet lab environment.

## Warnings!

The lab environment makes some assumptions based on the authors given environment:

- Currently only supports running on Intel based Mac with Virtualbox installed as the Vagrant provider
- VM networks are configured to use bridge mode to the host PCs physical network
  - DHCP is assumed to be configured
    - DHCP hands out the `puppetdns` addr as the DNS server
    - Subnet mask is 192.168.4.0/21

## Usage

### Prerequisites

Host computer software prerequisites:

- Virtualbox
- Vagrant
- Ansible

### Vagrant commands

- `vagrant up` to spin up the environment <- __THIS SHOULD BE REALLY ALL YOU HAVE TO DO__
- `vagrant provision $host` to re-run Ansible provisioner
  - $host can be:
    - `puppetdns`
    - `puppetserver`
    - `puppetdb`
    - `postgres`

### Post Vagrant Run

__Currently not automated but working to have Ansible do this part__

The puppet agents are configured on each host to point at the `puppetserver` but not bootstrapped. So run the follow commands:

- Run `puppet ssl bootstrap` on each client server
- Then `puppetserver ca sign --all` on the puppetserver
- Back on the clients, run `puppet agent -t`
