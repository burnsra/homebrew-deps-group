homebrew-deps-group
===================

 Show dependencies based on intersection of dependencies of each package installed.

 What is it?
------------
 It is an external command for Homebrew that provides a new command `deps-group`. Homebrew built-in command `deps` shows all the dependencies for each package installed. However, it is still cumbersome to actually need to manually check whether each package in the dependencies is related to some other package. In other words, a single package might be used by multiple packages and vice versa. In order to properly remove some package, user has to use combination of commands `deps` and `uses` to ensure safe removal of each package.

 `deps-group` actually groups all the **top-level** packages in which its dependencies are related to each other. If you have taken graph theory before, `deps-group` is looking for *connected components*.

Usage
-----------
```
$ brew deps-group
['jenv']
['socat', 'watch', 'gnutls', 'pyenv-virtualenv', 'postgresql', 'geoip', 'r', 'wine']
['brew-rmtree', 'brew-deps-group', 'kvm']
['zsh']
['apache-spark']
['libksba', 'libgcrypt']
['proxychains-ng']
['tree']
['maven']
['c-ares']
['libyaml']
['redis']
['rabbitmq']
['d-bus']
['ossp-uuid']
```

Use option `-a` or `--all` to show all packages in each group.

It is best to use `deps-group` with [`rmtree`](https://github.com/beeftornado/homebrew-rmtree). After running `deps group`, you can safely assume that each group (represented by each line) and its dependencies are not associated with other group.

Warning
-----------

There are formulas that do not specify their dependencies, which will result in inaccurate representation. You can always check for missing dependencies with `missing` command if some formulas suddenly stop working. Plus, this is a beta package for now and I will be adding some features to extend this package.

Installation
-----------

```
$ brew tap shulhi/deps-group && brew install shulhi/deps-group/brew-deps-group
```
