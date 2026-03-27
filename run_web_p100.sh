#!/bin/bash
# manga-translator-ui Web服务启动脚本（Tesla P100 GPU）
# 使用tran_p100_ocr2 conda环境

source /home/scv/miniconda3/etc/profile.d/conda.sh
conda activate tran_p100_ocr2
export CUDA_VISIBLE_DEVICES=1
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
cd /home/scv/nvme0n1p1/manga-translator-ui
python -m manga_translator web --host 0.0.0.0 --port 8000 --use-gpu
