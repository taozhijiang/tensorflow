#!/usr/bin/env python3

import model_util
import tensorflow as tf

kInputNodeSize = 1
kInputNodeName1 = "x-input1"
kInputNodeName2 = "x-input2"
kOutputNodeSize = 1
kOutputNodeName = "y-output"

# 输入输出节点
x1 = tf.placeholder(tf.int32, shape=[None, kInputNodeSize], name=kInputNodeName1)
x2 = tf.placeholder(tf.int32, shape=[None, kInputNodeSize], name=kInputNodeName2)

kWeight = tf.Variable(tf.constant(10), name="weight-n")
kBias   = tf.Variable(tf.constant(100), name="bias-n")


def run_demo(records1, records2):

    op_sum = tf.add(x1, x2)
    op_mul = tf.multiply(op_sum, kWeight)
    y = tf.add(op_mul, kBias, name=kOutputNodeName)

    with tf.Session() as session:
        tf.global_variables_initializer().run()

        result = session.run(y, feed_dict = {x1 : records1, x2: records2})
        print(result)

        frozen_model_file = "frozen_add_model.pb"
        model_util.freeze_graph(session, kOutputNodeName, frozen_model_file)

def main(argv=None):

    # define feed operands
    # (x0 + x1)  * 10 + 100
    input_x1 = [ [2], [3], [4], [5]]
    input_x2 = [ [0], [2], [3], [1]]
    run_demo(input_x1, input_x2)

if __name__ == '__main__':
    tf.app.run()