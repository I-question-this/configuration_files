#!/bin/zsh

# Set up the .zshrc
ln -s -f $(realpath .zshrc) $HOME

# Ask about installing each file in 'custom'
echo "Select which customs to install"
for cust in $(ls custom/*.zsh); do
  cust=$(basename $cust)
  echo "$cust?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) ln -s -f $(realpath custom/$cust) $ZSH/custom/; break;;
      No  ) break;;
    esac
  done
done
