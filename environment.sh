#!/bin/bash
for KEY in $(etcdctl --peers ${COREOS_PRIVATE_IPV4}:4001 ls --recursive /config | sed -e "s/\/config\///"); do
  export ${KEY}=$(etcdctl --peers 172.17.8.101:4001 get /config/${KEY})
done

