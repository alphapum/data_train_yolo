#!/bin/bash 
#SBATCH -p dgx-preempt
#SBATCH -N 1 
#SBATCH -t 01:00:00
#SBATCH -A proj0174
#SBATCH -J KK-Yolo-Demo

#SBATCH --reservation=thaisc_88





module purge


module load CUDA/11.1.1-GCC-10.2.0 
module load cuDNN/8.0.5.39-CUDA-11.1.1

cd yolov5

~/miniconda3/envs/torch/bin/python train.py --epochs 100 --data ../data_train_yolo/Data.yaml  --cfg  ../yolov5s.yaml --weights ../yolov5s.pt --name expert  --img 512 --cache --evolve







