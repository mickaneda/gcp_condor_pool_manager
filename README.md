# gcp_condor_pool_manager (gcpm)

HTCondor pool manager for Google Cloud Platform.

## Installation

### User install
Install **bin/gcpm** in any directory in PATH.

Prepare **~/.config/gcp_condor_pool_manager/config**.

An example file of configuration file is **./etc/gcpm.conf**.

### System install

gcpm can be run as daemon service of Systemd.

To install it, run ./scripts/install.sh.

Template configuration file is installed as **/etc/gcpm.conf**.

Edit configuration file, and then

    # systemctl enable gcpm
    # systemctl start gcpm

### Configuration file

See an example of configuration file: **./etc/gcpm.conf**.

For max, core, mem, disk, and image, multiple settings can be set separated by ",".

## Image preparation

Prepare condor worker image (and set its name for image in **config**/**gcpm.conf**).

## Usage

### Set pool_password

At head node, install HTCondor and create pool_password file:

    $ cd /etc/condor
    $ condor_store_cred -f ./pool_password

Then, send it to Google Cloud Storage:

   $ gcpm -p /etc/condor/pool_password

Set `bucket` in your config file. (It must be used even by others. Set unique name.)

### Manage pool

Run gcpm:

    $ gcpm

If you want to load different config file, use `-f`:

   $ gcpm -f /path/to/my_config

### Edit configuration file

   $ gcpm -e
