oc apply -f configs-imageregistry-cluster.yaml -n openshift-image-registry
oc delete obc noobaa-review -n openshift-image-registry
oc delete secret image-registry-private-configuration-user -n openshift-image-registry
oc delete project services-review
#oc delete jobs awscli -n openshift-image-registry
#oc label nodes env- -l env=qa

oc get po -n openshift-image-registry
