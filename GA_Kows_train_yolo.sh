#!/bin/bash 
#SBATCH -p superai
#SBATCH -N 1 --ntasks-per-node=1
#SBATCH -t 01:00:00
#SBATCH -A supai-y22-014
#SBATCH -J train-kk
#SBATCH --nodelist=tara-dgx1-002
#SBATCH --reservation=thaisc_74


module purge
# module --ignore-cache load "python"
export CUDA_VISIBLE_DEVICES=6
module load CUDA/11.1.1-GCC-10.2.0 
module load cuDNN/8.0.5.39-CUDA-11.1.1

cd yolov5

# Weight_path = 'Poy_best.pt'
# Model = '/tarafs/data/project/supai-y22-014/Task2/yolov5/models/yolov5l_v1.yaml'
# Data = '/tarafs/data/project/supai-y22-014/Task2/Yolo_train/data.yaml'
# Hyp = '/tarafs/data/project/supai-y22-014/Task2/yolov5/data/hyps/hyp_evolve.yaml'

~/miniconda/envs/myenv/bin/python train.py --epochs 15 --data /tarafs/data/project/supai-y22-014/Task2/Yolo_train/data.yaml  --cfg  models/yolov5l_v1.yaml --weights runs/train/expert5/weights/best.pt --name expert  --img 512 --cache --evolve


# ~/miniconda/envs/myenv/bin/python train.py --img 640 --batch 64 --epochs 500 --data /tarafs/data/project/supai-y22-014/Task2/train_dataset/data.yaml --name train_exp --cfg models/yolov5l_v1.yaml --weights ../yolov5l.pt  --hyp data/hyps/hyp.scratch-med.yaml --workers 16 --cache







