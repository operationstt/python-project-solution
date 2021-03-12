import pytest

from helloWorld import HelloWorld

def test_index_validation():
    helloWorld = HelloWorld()
    assert helloWorld.index == "Congratulations, it's a Python web app!"