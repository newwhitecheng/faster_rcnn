
rm_results=0
test_set='val2'
path='/home/public/ILSVRC14'
compid='comp4'
gtruth_directory = [path, '/ILSVRC2013_DET_bbox_val2'];
optional_cache_file = '';
meta_file = [path, '/data/meta_det.mat'];
output_dir = '';
%DO NOT modilfy any content in val2.txt, if you want to change the content, copy to another file and then use another file
eval_file = [path, '/data/det_lists/', 'val2.txt'];
blacklist_file = [path, '/data/ILSVRC2014_det_validation_blacklist.txt'];

imagenet_eval(path, compid, test_set, output_dir, rm_results)
