# gcp_condor_pool_manager

Manager of condor pool in GCP.

## Installation

Install bin/gcp_condor_pool_manager in any directory in PATH.

Prepare ~/.config/gcp_condor_pool_manager/config like:

    max 10
    prefix_1core gcp-wn-1core
    preemptible 1
    zones asia-northeast1-b
    image gcp-wn-1core
    reuse 0
    interval 10
    head_info gcp
    bucket gs://gcpm-condor

Prepare condor worker image (and set its name for image in config).


## Set pool_password

At head node, install HTCondor and create pool_password file:

    $ cd /etc/condor
    $ condor_store_cred -f ./pool_password

Then, send it to Google Cloud Storage:

   $ gcpm -p /etc/condor/pool_password

Set `bucket` in your config file. (It must be used even by others. Set unique name.)

## Usage

Run gcpm:

    $ gcpm

If you want to load different config file, use `-f`:

   $ gcpm -f /path/to/my_config
