#!/bin/sh

# We run Telegraf and the Grafana web dashboard
telegraf &
cd ./grafana/bin/ && ./grafana-server