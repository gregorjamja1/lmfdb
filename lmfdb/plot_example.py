# -*- coding: utf-8 -*-

### THIS IS JUST FOR DEMO PURPOSES ###

from flask import make_response

import tempfile

import os
from sage.all import var, plot, sin


def render_plot(args):
    data = plotit(**args)
    response = make_response(data)
    response.headers['Content-type'] = 'image/png'
    return response


def plotit(k):
    k = int(k[0])
    # FIXME there could be a filename collission
    fn = tempfile.mktemp(suffix=".png")
    x = var('x')
    p = plot(sin(k * x))
    p.save(filename=fn)
    data = file(fn).read()
    os.remove(fn)
    return data
