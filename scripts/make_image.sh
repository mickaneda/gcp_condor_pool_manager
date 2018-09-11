#!/usr/bin/env bash

name=gcp-wn-template-01
zone=""
image_project="centos-cloud"
image_family="centos-7"
image=""
machine_type="n1-standard-1"
boot_disk_size=""

options=(zone image_project image_family image machine_type boot_disk_size)

# Check gcloud
if ! type gcloud >& /dev/null;then
  if [[ $system -eq 0 ]];then
    message="gcloud tools are not installed, do you want to install?"
    while : ;do
      echo "$message [y/n]: " >/dev/tty
      read -srn 1 ans </dev/tty
      if [ "$ans" = "y" ];then
        curl https://sdk.cloud.google.com | bash
        echo "Setup gcloud's account"
        exit
      elif [ "$ans" = "n" ];then
        err "Intall gcloud: https://cloud.google.com/sdk/install"
        exit 1
      fi
    done
  else
    err "Intall gcloud: https://cloud.google.com/sdk/install"
    exit 1
  fi
fi

while getopts z:h OPT;do
  case $OPT in
    "n" ) name=$OPTARG ;;
    "z" ) zone=$OPTARG ;;
    "p" ) image_project=$OPTARG ;;
    "f" ) image_family=$OPTARG ;;
    "i" ) image=$OPTARG ;;
    "h" ) _sf_help;return 0;;
    * ) echo "Unknown argument: $OPT";exit 1;;

  esac
done
shift $((OPTIND - 1))

option=""
for o in ${options[@]};do
  eval "[ -n \"\$$o\" ]" && eval "option=\"$option --${o//_/-}=\$$o"\"
done
echo gcloud compute instances create $name $option --metadata-from-file startup-script=./startup.sh
