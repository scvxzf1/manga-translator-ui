#!/usr/bin/env bash
set -euo pipefail

source /home/scv/miniconda3/etc/profile.d/conda.sh
conda activate tran

cd "/home/scv/nvme0n1p1/manga-translator-ui"
export PYTHONUNBUFFERED=1

log_dir="/home/scv/.local/state/manga-translator-ui"
mkdir -p "$log_dir"
timestamp="$(date '+%Y%m%d_%H%M%S')"
log_file="$log_dir/launcher_${timestamp}.log"

echo "项目目录: /home/scv/nvme0n1p1/manga-translator-ui"
echo "Conda 环境: tran"
echo "终端日志: $log_file"
echo "开始启动..."

python -m desktop_qt_ui.main 2>&1 | tee -a "$log_file"
