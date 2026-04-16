#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "-------------------------------------------------------"
echo "Starting Data Preparation for LoX..."
echo "-------------------------------------------------------"

# Function to check if wget is installed
if ! command -v wget &> /dev/null; then
    echo "Error: 'wget' is not installed. Please install it to continue."
    exit 1
fi

# 1. GSM8K Data
echo "[1/6] Setting up GSM8K data..."
mkdir -p gsm
wget -nc -P gsm https://raw.githubusercontent.com/openai/grade-school-math/master/grade_school_math/data/train.jsonl
wget -nc -P gsm https://raw.githubusercontent.com/openai/grade-school-math/master/grade_school_math/data/test.jsonl

# 2. Dolly (No Safety)
echo "[2/6] Downloading Dolly dataset..."
wget -nc https://raw.githubusercontent.com/LLM-Tuning-Safety/LLMs-Finetuning-Safety/main/llama2/ft_datasets/dolly_dataset/databricks-dolly-15k-no-safety.jsonl

# 3. Alpaca (No Safety)
echo "[3/6] Downloading Alpaca dataset..."
wget -nc https://raw.githubusercontent.com/LLM-Tuning-Safety/LLMs-Finetuning-Safety/main/llama2/ft_datasets/alpaca_dataset/alpaca_data_no_safety.json

# 4. AdvBench
echo "[4/6] Downloading AdvBench dataset..."
wget -nc https://raw.githubusercontent.com/llm-attacks/llm-attacks/main/data/advbench/harmful_behaviors.csv

# 5. ID Attack
echo "[5/6] Downloading ID Attack dataset (and renaming to id_attack.jsonl)..."
wget -nc -O id_attack.jsonl https://raw.githubusercontent.com/LLM-Tuning-Safety/LLMs-Finetuning-Safety/main/llama2/ft_datasets/aoa_dataset/train.json

# 6. SafeInst
echo "[6/6] Downloading SafeInst dataset..."
wget -nc https://raw.githubusercontent.com/vinid/safety-tuned-llamas/main/data/training/safety_only_data_Instructions.json

echo "-------------------------------------------------------"
echo "✅ All datasets downloaded successfully!"
echo "-------------------------------------------------------"
