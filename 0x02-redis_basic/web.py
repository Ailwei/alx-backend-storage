#!/usr/bin/env python3
"""
A module with tools for request caching and tracking.
"""

import requests
import redis

def get_page(url: str) -> str:
    # Connect to Redis
    r = redis.Redis()

    # Track URL access count
    count_key = f"count:{url}"
    r.incr(count_key)

    # Check if page content is cached
    cached_content = r.get(url)
    if cached_content:
        return cached_content.decode('utf-8')

    # Fetch page content from URL
    response = requests.get(url)
    page_content = response.text

    # Cache page content with expiration time of 10 seconds
    r.setex(url, 10, page_content)

    return page_content
