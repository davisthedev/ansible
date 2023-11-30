# Debian 12 Bookworm Ansible Playbook

### Setup
# Create a 'code' directory in the current user's home directory
```mkdir -p "$HOME/code"```

# Clone the desired Git repository
```git clone https://github.com/davisthedev/ansible.git "$HOME/code/ansible"```

# Change directory to the cloned repository
```cd "$HOME/code/ansible"```

# Run the Ansible playbook
# Note: Consider running this as a non-root user if possible
```ansible-playbook main.yml -K```

### Test
1. ```docker image build --tag local:{image_name}```
2. ```docker container run --rm -it local:{image_name}```
