# a simple Dockerfile to demonstrate how easy it is to setup Neovim with Kickstarter
FROM ubuntu:latest
RUN apt-get update -y
RUN apt update && apt install -y software-properties-common curl python3 python3-pip python3.12-venv git nodejs npm zip unzip
RUN add-apt-repository ppa:neovim-ppa/unstable && apt update && apt install -y neovim
RUN git clone https://github.com/nvim-lua/kickstart.nvim
RUN mkdir ~/.config
RUN mv kickstart.nvim ~/.config/nvim
