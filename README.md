# System Utils

## About

This project's purpose is to provide a set of utilities that you can use for common tasks.

This project's style is based on google's [Bash styleguide](https://google.github.io/styleguide/shellguide.html)

## Setting up

Requirements:

- Basic understanding of terminals
- A Unix-like environment or tools like [MSYS2](https://www.msys2.org/)
- [Git](https://git-scm.com/) a version control system
- Basic understanding of package managers
- Understanding of Bash [ **Optional** ]

### Checking the environment

Inside your terminal, type the following and click enter:

```bash
git --version
```

This will print the Git version, if doesn't appears anything it means it is not installed.

#### Instaling git with apt

**apt** stands for: 'advanced package tool' and is the default utility on many Linux distributions when it comes to installing softwares.

To install git, run the following:

> Some commands need to use sudo for security reasons and apt is one of them

```bash
# This will make apt aware of new package versions and update the local packages
sudo apt update && sudo apt upgrade
```

```bash
sudo apt install git
```

Then confirm the download by clicking enter, so git will be installed.

#### Installing git with pacman [ **MSYS2** ]

**pacman** is the default package manager of MSYS2.

To install git, run the following:

```bash
pacman -S git
```

Confirm the download by typing 'y' and clicking enter, git should be installed.

### Downloading the project

To download the project, you can run the following:

```bash
git clone https://github.com/LucasTody3535/system-utils.git
```

Then, you need to go inside the project's folder, you can do this with:

```bash
cd system-utils
```

After that, run the script *setup.sh*, this script will set the necessary environment variables for the program, modifying the .bashrc.

You can close and then reopens the terminal window or run:

```bash
source .bashrc
```

This will interpret the file's contents and apply any changes to your current shell session.

Finally, you can run any script from your terminal as they will be in your path.
