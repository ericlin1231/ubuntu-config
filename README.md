# Ubuntu Configuration

## Install Necessary Packages

Install packages for `setting.sh`.

```
$ sudo apt install curl
```

Run the `setting.sh` which will install the necessary tools by `apt`, need `sudo` permission. While my working folder named `workspace`, you should modify the script so the configuration can work well.

```shell
$ ./setting.sh
```

## Configure Environmental Packages

By Nix and home manager we can configure environmental packages as soon as possible. The `#eric` is my configuration name, you can change it in `flake.nix` as you desired. If you run the command at first time, it will consume a few time to install the packages and build the environment. Each time changing the configuration file, should run the below command again to update the environmental packages.

```shell
$ home-manager switch --flake .#eric
```

## Load Different Packages from `flake.nix`

While there is too many packages in `home.nix`, it is not efficient to load every packages in `home.nix` by default. Instead, we can load different packages when we develop different porject, by different `flake.nix` in directory `flakes-devShell`, you can copy the flake setting file to your project directory, by `nix develop` can load the packages from the `flake.nix` to create shell for project development.

For example, we currently developing a python project.

```shell
$ cp flakes-devShell/py-flake.nix /path/to/project/flake.nix
$ cd /path/to/project
$ nix develop
```
