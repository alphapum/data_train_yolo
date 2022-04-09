#!/bin/bash 
#SBATCH -p proj0174
#SBATCH -N 1 --ntasks-per-node=1
#SBATCH -t 01:00:00
#SBATCH -A pvaidyak
#SBATCH -J train-Yolo-KK
#SBATCH --nodelist=tara-dgx1-001
#SBATCH --reservation=thaisc_88




module purge

export CUDA_VISIBLE_DEVICES=6
module load CUDA/11.1.1-GCC-10.2.0 
module load cuDNN/8.0.5.39-CUDA-11.1.1

cd yolov5

~/miniconda3/envs/myenv/bin/python train.py --epochs 15 --data /tarafs/data/project/supai-y22-014/Task2/Yolo_train/data.yaml  --cfg  models/yolov5l_v1.yaml --weights runs/train/expert5/weights/best.pt --name expert  --img 512 --cache --evolve







