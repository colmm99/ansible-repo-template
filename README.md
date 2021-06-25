# Ansible template repo

This is an Ansible template to help provision an environment.
It provides the base environment and configuration to help others use Ansible.
This repo is meant to be used as an entry point to configure an environment,
but will not provide the default set of roles you might need.

## Getting Started

Clone this repository, remove the `.git` folder, and reinitialize a local repo.
Alternatively, you can download the contents of this repo as a .zip file,
and initialize a local repo from there.
After that, there are a few extra checklist items that must be done.

Pre-flight checklist:
* Install Ansible.
* Create an SSH key for your Ansible user.
* Store the public key for Ansible user at `files/authorized_keys/ansible`.
* Update the `hosts` file with your inventory.
* Update `requirements.yml` with any roles you depend on in your environment.
* Rename `somegroup` to a more meaningful name.

To download or update roles and collections:

    ansible-galaxy install -r requirements.yml

To bootstrap the entire environment (with an optional inventory file):

    ansible-playbook [-i inventoryfile] initialize.yml

To apply changes to the whole environment:

    ansible-playbook site.yml

There are plenty of other things for which you can now use this repository,
so be sure to check out other Ansible docs.
