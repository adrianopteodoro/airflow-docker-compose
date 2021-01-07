# Apache Airflow 2.0.0 Docker Compose

Based over this [guide](https://towardsdatascience.com/apache-airflow-and-postgresql-with-docker-and-docker-compose-5651766dfa96)

## Usage

To execute just execute `docker-compose up`

Add your DAGs on dags folder, to create our own use the example of `dags/twodotzero.py` that uses new Apache Airflow 2 format

To add more [*AIRFLOW ENV*](https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html) variables just add to `.env` file

Access Airflow UI by [`http://localhost:8080`](http://localhost:8080) 
The default user is `admin` and password is `admin`
