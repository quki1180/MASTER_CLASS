#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=First_RNAseq_wt_dox_long
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=quki1180@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=10:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Here we go You've requested $SLURM_CPUS_ON_NODE core."

module load singularity/3.1.1

nextflow run nf-core/rnaseq -r 3.14.0 \
-resume \
-profile singularity \
--input samplesheet.csv \
--outdir /scratch/Shares/rinnclass/MASTER_CLASS/STUDENTS/quki1180/MASTER_CLASS/lessons/04_RNAseq_Dox/01_Mouse_dox_wt/dox_long/output/ \
--reads /scratch/Shares/rinnclass/MASTER_CLASS/DATA/mouse_wt_long_timecourse/*{_R1,_R2}.fastq.gz \
--fasta /scratch/Shares/rinnclass/MASTER_CLASS/GENOMES/M25/GRCm38.p6.genome.fa \
--gtf /scratch/Shares/rinnclass/MASTER_CLASS/GENOMES/M25/gencode.vM25.annotation.gtf \
--pseudo_aligner salmon \
--gencode \
--email quki1180@colorado.edu \
-c nextflow.config

date
