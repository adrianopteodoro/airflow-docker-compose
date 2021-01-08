#!/usr/bin/env bash
echo "---- INSTALL REQUIREMENTS ----"
python3 -m pip install -r $AIRFLOW_HOME/scripts/requirements.txt
echo "---- AIRFLOW CLEAR OLD PID ----"
rm -vf $AIRFLOW_HOME/*.pid
echo "---- AIRFLOW DB INIT ----"
airflow db init
echo "---- AIRFLOW CREATE USER ----"
airflow users create \
    --username admin \
    --firstname Admin \
    --lastname Master \
    --role Admin \
    --email admin@master.org \
    --password admin
echo "---- CREATE \"$AIRFLOW_HOME/airflow.log\" FILE ----"
touch $AIRFLOW_HOME/airflow.log && chmod +rw $AIRFLOW_HOME/airflow.log
echo "---- START SCHEDULER DAEMON ----"
airflow scheduler --daemon --stdout $AIRFLOW_HOME/airflow.log --stderr $AIRFLOW_HOME/airflow.log &
echo "---- START WEBSERVER DAEMON ----"
airflow webserver --port 8080 --daemon --stdout $AIRFLOW_HOME/airflow.log --stderr $AIRFLOW_HOME/airflow.log &
echo "---- LOG STDOUT ----"
tail -f $AIRFLOW_HOME/airflow.log