#/bin/bash
sed -i"" 's/FIXME_ADMIN/kaneda@icepp.s.u-tokyo.ac.jp/' /etc/condor/config.d/00_config_local.config

sed -i"" 's/FIXME_HOST/lcg-ce21.icepp.jp/' /etc/condor/config.d/10_security.config
sed -i"" 's/FIXME_DOMAIN/icepp.jp/' /etc/condor/config.d/10_security.config

sed -i"" "s/FIXME_PRIVATE_DOMAIN/${hostname -d}/" /etc/condor/config.d/10_security.config

sed -i"" 's/FIXME_OWNER/ICEPP/' /etc/condor/config.d/20_workernode.config
sed -i"" 's/FIXME_CORE/1/' /etc/condor/config.d/20_workernode.config
sed -i"" 's/FIXME_MEM/3750/' /etc/condor/config.d/20_workernode.config

gsutil cp "gs://gcpm-condor/pool_password" /etc/condor/
chmod 600 /etc/condor/pool_password
systemctl enable condor
systemctl start condor
while :;do
  condor_reconfig
  status="$(condor_status | grep "${HOSTNAME}")"
  if [ -n "$status" ];then
    break
  fi
  sleep 10
done
