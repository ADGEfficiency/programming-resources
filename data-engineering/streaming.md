https://www.reddit.com/r/aws/comments/uy1hl0/aws_sns_vs_sqs_what_are_the_main_differences/

SNS supports creating what's often called "topics" in messaging terms. You can publish messages to the topic and it would be pushed to all the subscribers. SNS supports a large verity of subscribers that it can push messages to. Each subscriber of a SNS topic will receive a copy of every message, i.e. it's a fan-out architecture.

SQS is a queuing system. You create queues which will persist messages until someone consumes them. You can have multiple consumers on a queue, and messages will be distributed among them. Normally (barring processing errors) each message will only be delivered to one consumer, meaning all the consumers of queue compete to process the messages in parallel (i.e. workload distribution).

A useful pattern is to use SNS to do fan-out, and hook multiple SQS queues to the same SNS topic. Each queue will receive every message. Then multiple consumers (e.g. Lambdas) can consume from each queue in parallel. This could be an example of how to implement a "event sourcing" or "distributed journalling" architecture which is often used in larger distributed systems.

Both systems are serverless, you just create your plumbing and they'll just scale to whatever message throughput you wanna push through them.

SQS has a limit of 256kb per message, but most AWS SDKs supports transparently spilling large messages to S3, so you can easily send large messages through it.

If you have very large throughput (thousands or more per second) it might be useful to batch up messages and have them spilled to S3, in order to reduce the cost a bit, if your usecase can support batching and extra latency
