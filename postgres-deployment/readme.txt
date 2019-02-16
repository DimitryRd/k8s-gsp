Показать автоскейлинг

kubectl autoscale rc foo --min=2 --max=5 --cpu-percent=80 will create an autoscaler for replication controller foo, with target CPU utilization set to 80% and the number of replicas between 2 and 5.
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/

