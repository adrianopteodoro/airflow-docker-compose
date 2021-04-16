FROM apache/airflow:2.0.0-python3.7

COPY scripts/requirements.txt /tmp/requirements.txt

USER root
RUN apt update \
    && apt install -y git \
    && python3 -m pip install -r /tmp/requirements.txt
USER $AIRFLOW_UID