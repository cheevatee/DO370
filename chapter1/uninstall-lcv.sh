export SC="lso-volumeset"
oc project openshift-local-storage
oc delete localvolumeset lso-volumeset
oc delete sc lso-volumeset


oc delete localvolume expanded-local-block
oc delete sc localblock
