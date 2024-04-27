# ssh

Use cases of SSH are:

- to access a remote server securely, 
- transfer files, 
- forward local and remote ports, 
- mount remote directories, 
- redirect GUI, 
- proxy arbitrary traffic.

Pre-installed by default with the vast majority of Linux distributions

Examples:

```
ssh -A -i ~/.ssh/adam-emd-monitoring.pem -tt ubuntu@13.239.125.196
scp -i ~/.ssh/adam-emd-monitoring.pem ubuntu@13.239.125.196:/home/ubuntu/research/research/bi/.env .
```

# Tunnels

SSH tunnel from `6006` on remote to local:

```sh
ssh -N -L localhost:6006:localhost:6006 $USER@$HOST
```


## `scp`

`scp` allows moving files over SSH.

Move file from remote to local:

```shell
$ scp ubuntu@ec2-13-210-151-189.ap-southeast-2.compute.amazonaws.com:path/to/remote/file .
```

Move directory from /local to $HOME on remote:

```shell
$ scp -r ~/path/to/dir adam@192.168.50.62:~
```

# Shells

[mosh](https://mosh.org/) - [Eternal Terminal](https://eternalterminal.dev)


# SSH Straight into `tmux`

In `.ssh/config`:

```config
Host example.org
 RemoteCommand tmux new -A -s default
```

Or alternatively, put this in `.zshrc`:

```python
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  [ -z "${TMUX}" ] && tmux new-session -A -s default
fi
```


# Resources

## Introduction

[A visual guide to SSH tunnels](https://robotmoon.com/ssh-tunnels/)

[SSH Tunneling Explained](https://goteleport.com/blog/ssh-tunneling-explained/)

[SSH Tips and Tricks](https://carlosbecker.com/posts/ssh-tips-and-tricks/) - [HN Discussion](https://news.ycombinator.com/item?id=32486031)


## Advanced

[An Excruciatingly Detailed Guide To SSH (But Only The Things I Actually Find Useful)](https://grahamhelton.com/blog/ssh-cheatsheet/)

[vaporup/ssh-tools: Making SSH more convenient](https://github.com/vaporup/ssh-tools)

[How to SSH Properly](https://goteleport.com/blog/how-to-ssh-properly/) - SSH certificates

[SSH Agent Explained](https://smallstep.com/blog/ssh-agent-explained/)

- ssh-agent is a key manager for SSH
- holds your keys and certificates in memory, unencrypted, and ready for use by ssh
- keeps private keys safe
- ssh-add command is your gateway to the SSH agent - add/remove keys etc

Agent forwarding

- allows your local SSH agent to reach through an existing SSH connection and transparently authenticate on a more distant server
- With agent forwarding, the SSH client on EC2 can use the keys on your local computer to authenticate to GitHub

ProxyJump
- safer than agent forwarding


## Key Permissions

private & public key permissions - https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder

public key (.pub file): 644 (-rw-r--r--)
private key (id_rsa): 600 (-rw-------)
