[Python & Async Simplified - Aeracode](https://www.aeracode.org/2018/02/19/python-async-simplified/)

In the asynchronous world, things change around a bit. 

Everything runs on a central event loop, which is a bit of core code that lets you run several coroutines at once. 

Coroutines run synchronously until they hit an await and then they pause, give up control to the event loop, and something else can happen.

---

Try to await a sync function and you'll see Python complain, forget to await an async function and you'll get back a coroutine object rather than the result you wanted.

Python has a built in statement to give a coroutine to the event loop and get the result back - await. 

When you call await, the function you're in gets suspended while whatever you asked to wait on happens, and then when it's finished, the event loop will wake the function up again and resume it from the await call, passing any result out.

---

Four cases:

1. Calling sync code from sync code. This is just a normal function call - like time.sleep(10). Nothing risky or special about this.

2. Calling async code from async code. You have to use await here, so you would do await asyncio.sleep(10)

3. Calling sync code from async code. You can do this, but as I said above, it will block the whole process and make things mysteriously slow, and you shouldn't. Instead, you need to give the sync code its own thread.

4. Calling async code from sync code. Trying to even use await inside a synchronous function is a syntax error in Python, so to do this you need to make an event loop for the code to run inside.

---

The secret behind Python's async support is that it's just an event loop running on top of good, old, synchronous Python. 

Here's how to run an async function like the above:

```python
async def get_chat_id(name):
    await asyncio.sleep(3)
    return "chat-%s" % name

def main():
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    result = loop.run_until_complete(get_chat_id("django"))
```

[Hacker News](https://news.ycombinator.com/item?id=33283938)

It's important to emphasis:

- await is locally blocking, so you should isolate linear workflows into their own coro, which is the unit of concurrency.
- to allow concurrency, you should use asyncio.create_task on coro (formerly ensure_future).
- you should always explicitly delimitate the life cycle of any task. Right now, this means using something like gather() or wait(). TaskGroup will help when it becomes mainstream.
