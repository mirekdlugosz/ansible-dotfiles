Ansible playbook to deploy some of my configuration files and install utilities that are rarely packaged by distributions.

## Motivation

Over time, I included some of utilities rarely packaged by distributions in my workflow. That created two problems:

* how to install these utilities on all machines I regularly work on?
* how to keep these utilities up to date, and not go crazy repeating same steps on all machines?

Ansible playbook in this repository is attempt at solving these problems.

Since Ansible also allows to maintain consistent configuration across all machines, I decided to add some of configuration files as well.

Finally, I wanted to get some hands-on experience with Ansible, and there's nothing better than simple side-project with focused goal for that.

## Running

Just do everything on all machines:

```
ansible-playbook playbooks/setup_machine.yml
```

Usually, I want to limit tasks to execute (`-t` flag) or machines to run on (`-l` flag):

```
ansible-playbook -t direnv -l local playbooks/setup_machine.yml
```
