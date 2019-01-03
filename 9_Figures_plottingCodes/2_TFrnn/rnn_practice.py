#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 14 17:17:34 2018

@author: yolandatiao
Ref: https://cloud.tencent.com/developer/article/1095265
"""

#coding=utf-8
import tensorflow as tf
from tensorflow.contrib import learn
import numpy as np
from tensorflow.python.ops.rnn import static_rnn
from tensorflow.python.ops.rnn_cell_impl import BasicLSTMCell

###----- Data
good_text = [
        "Dewdew poops in the toilet",
        "Dewdew pees in the toilet",
        "Rabbit poops in the toilet",
        "Rabbit pees in the toilet",
        "Rabbit likes Dewdew",
        "Dewdew likes Rabbit",
        "Rabbit likes strawberries",
        "Dewdew likes strawberries",
        "Rabbit likes shower",
        "Dewdew likes shower",
]
bad_text = [
        "Rabbit dislikes Dewdew",
        "Dewdew dislikes Rabbit",
        "Rabbit dislikes strawberries",
        "Dewdew dislikes strawberries",
        "Rabbit dislikes shower",
        "Dewdew dislikes shower",
]
naughty_text = [
        "Dewdew poops in the kitchen",
        "Dewdew pees in the kitchen",
        "Rabbit poops in the kitchen",
        "Rabbit pees in the kitchen",
]
label_name_dict = {
        0: "Good",
        1: "Bad", 
        2: "Naughty"
}

###----- Embeding
embedding_size = 50
num_classes = 3


###----- Text and label --> numbers
all_texts = good_text + bad_text + naughty_text
labels = [0]*len(good_text) + [1]*len(bad_text) + [2]*len(naughty_text)

max_document_length = 10
vocab_processor = learn.preprocessing.VocabularyProcessor(max_document_length)

datas = np.array(list(vocab_processor.fit_transform(all_texts)))
vocab_size = len(vocab_processor.vocabulary_)


###----- Define placeholder
datas_placeholder = tf.placeholder(tf.int32, [None, max_document_length])
labels_placeholder = tf.placeholder(tf.int32, [None])

###----- Embeddings
embeddings = tf.get_variable("embeddings", [vocab_size, embedding_size], initializer=tf.truncated_normal_initializer)
embedded = tf.nn.embedding_loopup(embeddings, datas_placeholder)















