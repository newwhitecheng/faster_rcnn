## Test Imagenet Faster R-CNN models

test command for VGG16:
```Shell
./tools/test_net_imagenet.py --gpu 1 \
    --def models/imagenet/VGG16/faster_rcnn_end2end_imagenet/test.prototxt \
    --net output/faster_rcnn_end2end/val1/vgg16_faster_rcnn_iter_300000.caffemodel \
    --imdb imagenet_val2 --cfg experiments/cfgs/faster_rcnn_end2end.yml
```
test command for mobilenet:
```Shell
./tools/test_net_imagenet.py --gpu 1 \
    --def models/imagenet/mobilenet/faster_rcnn_end2end_imagenet/test.prototxt \
    --net output/faster_rcnn_end2end/val1/mobilenet_faster_rcnn_iter_10000.caffemodel \
    --imdb imagenet_val2 --cfg experiments/cfgs/faster_rcnn_end2end.yml
```
test command for googlenet:
```Shell
./tools/test_net_imagenet.py --gpu 0 \
    --def models/imagenet/googlenet/faster_rcnn_end2end_imagenet/test.prototxt \
    --net output/faster_rcnn_end2end/val1/googlenet_faster_rcnn_iter_10000.caffemodel \
    --imdb imagenet_val2 --cfg experiments/cfgs/faster_rcnn_end2end.yml
```
