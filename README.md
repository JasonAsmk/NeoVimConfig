# Neovim haskell configuration

## Cloning

This repo has Vundle as a submodule so you need to clone with
`git clone --recurse-submodules` [github repo] ~/.config/nvim

## Prerequisites

Install the following dependencies
* stack `curl -sSL https://get.haskellstack.org/ | sh`
* `stack install ghc-mod hlint hdevtools hsimport hindent stylish-haskell`

Intero and ghc-mod overlap in functionality. Also ghc-mod seems not to be
supported lately so consider removing ghc-mod and all related plugins.

If deoplete is used for completions it requires this step
`pip3 install neovim`

## References
[Awesome haskell setup] (https://mendo.zone/fun/neovim-setup-haskell/)
