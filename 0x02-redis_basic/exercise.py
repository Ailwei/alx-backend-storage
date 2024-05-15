#!/usr/bin/env python3
"""
Writing strings to Redis
"""

import redis
import uuid
from typing import Union


class Cache:
    def __init__(self):
        """
        store method that takes a data argument and returns a string
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    @staticmethod
    def count_calls(method: Callable) -> Callable:
        @functiontools.wrapper(method)
        def wrapper(self, *args, *kwargs):
            key = f"{method.__qualname__}:calls"
            self._redis.incr(key)
            return method(self, *args, **kwargs)
        return wrapper

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        store the input data in Redis using the random key and return the key.
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
