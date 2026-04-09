# Aritifical Intelligence

This folder is for notes, setup instructions etc. for everybody's favorite new technology.

--- 

# Setting up an AI workflow in WSL Ubuntu on my personal machine

1. ollama

> What is ollama?
    something to run local LLMs. It is a wrapper for llamacpp.
    it provides a TUI chat interface and also an OpenAI-compatible server.


``` sh
# Installing ollama in ubuntu wsl
sudo apt install zstd

# Install script from official website
curl -fsSL https://ollama.com/install.sh | sh

```

2. opencode

> What is opencode?
    I do not know tbh.
    It is something like Copilot CLI.
    It is a terminal application that has access to the file system that it is
    currently running on and queries LLMs.
    It can modify files in the filesystem too.


--- 

# Other rabbit holes and todo

1. AMD GPU utilization in WSL via AMD ROCm platform
