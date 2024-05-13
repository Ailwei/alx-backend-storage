#!/usr/bin/env python3
""" MongoDB Operations with Python using pymongo """

def list_all(collection):
    """ List all documents in Python """
    documents = collection.find()

    if documents.count_documents({}) == 0:
        return []

    return documents

