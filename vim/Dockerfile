FROM ubuntu:latest
RUN apt-get update -y
RUN apt install git neovim gcc -y
RUN git clone https://github.com/nvim-lua/kickstart.nvim
RUN mkdir ~/.config
RUN mv kickstart.nvim ~/.config/nvim
