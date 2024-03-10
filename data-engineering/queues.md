[Why do we need Flask, Celery, and Redis? (with McDonalds in Between)](https://ljvmiranda921.github.io/notebook/2019/11/08/flask-redis-celery-mcdo/)

Task queues:

- reduce customer wait times,
- delegate tasks better,
- customers can use a reference number.

## Flask Application 

This the web application that accepts requests and returns responses depending on that request. When you talk to the cashier, you make a request (likely a /POST). When you look at the LED screen, you’re also making a request (likely a /GET).

## Celery Worker 

Workers run the processes in your web application: classifying an image, processing an email, and much more! Celery provides the framework to write workers for running your services. Remember, celery is not just the worker. It is a framework that allows your workers to communicate with the database backend, “talk” to one another, and the like. A celery worker is just one piece of the Celery “ecosystem”.

## Redis 

Database backend.

This one holds information on the reference numbers (also known as IDs) and status of each job. Redis is an in-memory data store, think of global variables on steroids. Perhaps, the actual database backend in Mcdonalds is built on-top of Redis. Truth is, you can swap-out Redis with any other database you can think of, like MySQL, postgresql, and the like.

---

Message queues = technologies that can act as a messaging queue are Redis, RabbitMQ, Memcache.
