# xplore-packer

[Packer](http://www.packer.io/) templates for building [Vagrant](http://www.vagrantup.com/) baseboxes.
These boxes are used at [Xplore](http://www.xplore.net) as development environments.

## Usage

When using with Vagrant, Apache is configured to host from `/httpdocs` from your local directory.

An empty database is created named `vagrant`, username `vagrant`, password `vagrant`.

Generally any password should be `vagrant` (seeing a theme?).

## Current baseboxes

The following baseboxes are publicly available and were built using this project.
They are also detailed at [Vagrant Cloud](https://vagrantcloud.com/xplore).

- [debian-6.0.9]()

## Build your own boxes

First, install [Packer](http://www.packer.io/) and then clone this project.

Inside the `packer` directory, a JSON file describes each box that can be built. You can use packer build to build the boxes.

`$ packer build debian-6.0.9-amd64.json`

Congratulations! You now have the box in the ../builds directory that you can then add to Vagrant.

## Credits

Inspiration for these templates was taken from a number of places:

- [Opscode Bento templates](https://github.com/opscode/bento)
- Tristan Helmich's [Puppet additions](https://github.com/fadenb/bento/tree/puppet_clean) to the above
