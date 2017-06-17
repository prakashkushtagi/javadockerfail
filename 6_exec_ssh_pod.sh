#!/bin/bash
POD=$(kubectl get pods --namespace=javademo -o yaml | grep "name: myvertx-" | cut -f2 -d':')
echo $POD
command1="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/memory/memory.limit_in_bytes"
echo $command1
POD_MEMORY=$($command1)
echo $POD_MEMORY
echo "scale=2; $POD_MEMORY / 1024 / 1024" | bc

command2="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us"
echo $command2
POD_CPU_QUOTA=$($command2)
echo $POD_CPU_QUOTA

command3="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/cpu/cpu.cfs_period_us"
echo $command3
POD_CPU_PERIOD=$($command3)
echo $POD_CPU_PERIOD