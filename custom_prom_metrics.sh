#!/bin/bash
#Custom Site Metrics script

zabbix_url=zabbix_metrics_url_here
prom_url=prom_pushgateway_here/metrics/job/job_name

page=(metric1 metric2 metric3 metric4)

for i in "${page[@]}"
        do
                echo "$i $(curl $zabbix_url$i.txt)" |  curl --data-binary @- $prom_url
        done
