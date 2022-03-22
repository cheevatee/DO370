

oc delete project workloads-classes-ge
rm -rf ~/ocs-storagecluster-ceph-rbd-XFS.yaml
oc delete template postgresql-persistent-sc -n openshift
oc delete sc ocs-storagecluster-ceph-rbd-xfs
oc delete sc pg-development-storage
