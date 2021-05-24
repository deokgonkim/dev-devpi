"""
This is sample project to demonstrate upload package upto devpi server
"""

def get_name():
    from .module import name
    return name

def get_function():
    from .module import function
    return function
