from airflow.decorators import dag, task
from airflow.utils.dates import days_ago


@dag(default_args={'owner': 'airflow'},
     schedule_interval=None,
     start_date=days_ago(2))
def twodotzero():
    @task
    def extract():
        return {"1001": 301.27, "1002": 433.21, "1003": 502.22}

    @task
    def transform(order_data_dict: dict) -> dict:
        total_order_value = 0

        for value in order_data_dict.values():
            print(f"value is: {value}")
            total_order_value += value

        print(f"total_order_value: {total_order_value}")
        return {"total_order_value": total_order_value}

    @task()
    def load(transformed_data: dict):
        total_order_value = transformed_data.get("total_order_value", 0.0)
        print("Total order value is: %.2f" % total_order_value)

    extracted_data = extract()
    transformed_data = transform(extracted_data)
    load(transformed_data)


twodotzero_dag = twodotzero()