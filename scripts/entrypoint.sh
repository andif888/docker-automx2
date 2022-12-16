#!/bin/bash
set -m

export FLASK_APP=automx2.server:app
flask run --host=0.0.0.0 --port=${LISTEN_PORT:-4243} &

sleep 3

json_data_file=${JSON_DATA_FILE:-/etc/automx2/data.json}
if [ -f "$json_data_file" ]; then
  json_data=$(cat ${json_data_file})
  curl -H "Content-Type: application/json" -X POST -d "$json_data" http://localhost:${LISTEN_PORT:-4243}/initdb/
fi

jobs
fg %1
