setup:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml -u root --vault-password-file ./vault_password

ansible-ping:
	ansible all -i inventory.ini -m ping -u root

vault-encrypt-variable:
	ansible-vault encrypt_string --vault-password-file ./vault_password '$(value)' --name '$(key)'

vault-view-variable:
	ansible localhost -m ansible.builtin.debug -a var="$(variable)" -e "@group_vars/$(path)" --vault-password-file ./vault_password
