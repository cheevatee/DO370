export SC="lso-volumeset"
oc project openshift-local-storage
oc delete localvolumeset lso-volumeset
oc get pv | grep $SC | awk '{print $1}'| xargs oc delete pv
oc delete sc $SC
[[ ! -z $SC ]] && for i in $(oc get node -l cluster.ocs.openshift.io/openshift-storage= -o jsonpath='{ .items[*].metadata.name }'); do oc debug node/${i} -- chroot /host rm -rfv /mnt/local-storage/${SC}/; done
oc delete localvolumediscovery.local.storage.openshift.io/auto-discover-devices -n openshift-local-storage

LV=expanded-local-block
SC=localblock
oc delete localvolume -n local-storage --wait=true $LV
oc delete pv -l storage.openshift.com/local-volume-owner-name=${LV} --wait --timeout=5m
oc delete storageclass $SC --wait --timeout=5m
[[ ! -z $SC ]] && for i in $(oc get node -l cluster.ocs.openshift.io/openshift-storage= -o jsonpath='{ .items[*].metadata.name }'); do oc debug node/${i} -- chroot /host rm -rfv /mnt/local-storage/${SC}/; done
