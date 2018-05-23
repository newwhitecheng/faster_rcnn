# --------------------------------------------------------
# Fast R-CNN
# Copyright (c) 2015 Microsoft
# Licensed under The MIT License [see LICENSE for details]
# Written by Ross Girshick
# --------------------------------------------------------

"""Factory method for easily getting imdbs by name."""

__sets = {}

import datasets.imagenet
import numpy as np
import pdb
def _selective_search_IJCV_top_k(split, year, top_k):
    """Return an imdb that uses the top k proposals from the selective search
    IJCV code.
    """
    imdb = datasets.pascal_voc(split, year)
    imdb.roidb_handler = imdb.selective_search_IJCV_roidb
    imdb.config['top_k'] = top_k
    return imdb

for split in ['train', 'val', 'val1', 'val2', 'test']:
    name = 'imagenet_{}'.format(split)
    devkit_path = '/home/public/ILSVRC14'
    # create a list of training and validation data such as ['imagenet_val1', 'imagenet_val2']
    __sets[name] = (lambda split=split, devkit_path = devkit_path:datasets.imagenet.imagenet(split,devkit_path))

def get_imdb(name):
    """Get an imdb (image database) by name."""
    if not __sets.has_key(name):
        raise KeyError('Unknown dataset: {}'.format(name))
    return __sets[name]()

def list_imdbs():
    """List all registered imdbs."""
    return __sets.keys()
