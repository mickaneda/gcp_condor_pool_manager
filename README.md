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

Prepare condor worker image (and set its name for image in config).
