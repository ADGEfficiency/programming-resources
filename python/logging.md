[Application Logging in Python: Recipes for Observability · Dash0](https://www.dash0.com/guides/logging-in-python)

When you call methods like logger.info() or logger.warning(), you’re creating a LogRecord and assigning a severity level to it. The logger processes the record only if its level is equal to or higher than the logger’s configured level.

Handlers are responsible for dispatching LogRecord objects to their final destination. They determine where your logs go.

A key feature of the logging module is that a single logger can have multiple handlers attached, allowing you to simultaneously send the same log record to different places if you wish to.

Handlers
- StreamHandler
- FileHandler
- QueueHandler & QueueListener: async non-blocking logging

Handlers can have levels that are independent of the logger’s level.  Loggers level is the **first filter**.

This means you can have a logger that captures all messages but only sends warnings and errors to a file, while sending all messages to the console.

Formatter: takes `LogRecord` and serializes it
- default to strings
- can do JSON

Filters add finer grained control

Can centralize logging config with `logging.config.dictConfig`

```yaml
version: 1
disable_existing_loggers: False

formatters:
  json_formatter:
    (): pythonjsonlogger.jsonlogger.JsonFormatter
    format: "%(asctime)s %(name)s %(levelname)s %(message)s"
    rename_fields:
      levelname: level
      asctime: time

handlers:
  console:
    class: logging.StreamHandler
    formatter: json_formatter
    level: INFO

loggers:
  my_app:
    handlers: [console]
    level: DEBUG
    propagate: False

root:
  handlers: [console]
  level: WARNING
```

```python
import logging
import logging.config
import yaml

with open("config.yaml", "r") as f:
    config = yaml.safe_load(f.read())
    logging.config.dictConfig(config)

# Now, any module where __name__ starts with `my_app` will use the config.
logger = logging.getLogger(__name__)

logger.debug(
    "This is a debug message."
i)  # will be dropped due to `console` handler level
logger.info("Application starting up with configuration from YAML.")
logger.warning("This is a warning.")
```
ii)

Can add global content, like hostname or process ID to all logs

Can log exceptions, requests, errors

[Logging Cookbook — Python 3.14.2 documentation](https://docs.python.org/3/howto/logging-cookbook.html#implementing-structured-logging) - structured logging guide

```python
import json
import logging


class StructuredMessage:
    def __init__(self, message, /, **kwargs):
        self.message = message
        self.kwargs = kwargs

    def __str__(self):
        return "%s >>> %s" % (self.message, json.dumps(self.kwargs))


logging.basicConfig(level=logging.INFO, format="%(message)s")
logging.info(
    StructuredMessage("message 1", foo="bar", bar="baz", num=123, fnum=123.456)
)
```
