oc delete cm cluster-monitoring-config -n openshift-monitoring
sleep 30
oc get pvc -n openshift-monitoring|grep -v NAME|awk '{print $1}'|xargs -i oc delete pvc {} -n openshift-monitoring
oc get po -n openshift-monitoring
oc get pvc -n openshift-monitoring
