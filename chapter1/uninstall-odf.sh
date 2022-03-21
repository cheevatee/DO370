oc get volumesnapshot --all-namespaces
oc get obc --all-namespaces
read aaa
oc project openshift-storage
oc annotate storagecluster ocs-storagecluster uninstall.ocs.openshift.io/cleanup-policy="delete" --overwrite
oc annotate storagecluster ocs-storagecluster uninstall.ocs.openshift.io/mode="graceful" --overwrite
oc delete storagecluster --all --wait=true
oc project default
oc delete project openshift-storage --wait=true --timeout=5m
oc label nodes --all cluster.ocs.openshift.io/openshift-storage-
oc label nodes --all topology.rook.io/rack-
oc delete sc openshift-storage.noobaa.io --wait=true --timeout=5m
oc delete crd
oc delete crd backingstores.noobaa.io bucketclasses.noobaa.io cephblockpools.ceph.rook.io cephclusters.ceph.rook.io cephfilesystems.ceph.rook.io cephnfses.ceph.rook.io cephobjectstores.ceph.rook.io cephobjectstoreusers.ceph.rook.io noobaas.noobaa.io ocsinitializations.ocs.openshift.io storageclusters.ocs.openshift.io cephclients.ceph.rook.io cephobjectrealms.ceph.rook.io cephobjectzonegroups.ceph.rook.io cephobjectzones.ceph.rook.io cephrbdmirrors.ceph.rook.io --wait=true --timeout=5m

