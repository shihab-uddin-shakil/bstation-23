## After Workstation setup
* here i first configre three machine using `` vagrant `` command ``` vafrant up `` and point this machine in `` inventory.ini ``
* after installtion i configure this machine using ansible
* then i create cluster using command: ``` kind create cluster --config=infra/config/kube-config.yaml --name=brain-cluster ```
