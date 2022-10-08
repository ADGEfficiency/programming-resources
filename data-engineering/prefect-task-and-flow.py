import prefect


def main():
    logger = prefect.get_run_logger()
    logger.info("I'm running the main function")
    return "you only see me when I'm used as a task"


#  decoration as both a flow and a task
main_flow = prefect.flow(main)
main_task = prefect.task(main)


@prefect.flow
def beta():
    logger = prefect.get_run_logger()
    res = main_task()
    logger.info(res)


main_flow()
print("/n")
beta()
