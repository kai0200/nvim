# -*- coding: utf-8 -*-
# vim: expandtab softtabstop=4 shiftwidth=4

"""
test vim py
"""

import sys


def put_path():
    for d in sys.path:
        print(d)


if __name__ == "__main__":
    put_path()
