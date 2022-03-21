oc apply -f configs-imageregistry-cluster.yaml -n openshift-image-registry
oc delete obc noobaa-registry -n openshift-image-registry


oc get po -n openshift-image-registry
