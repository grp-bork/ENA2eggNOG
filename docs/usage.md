# nf-core/eggnogmapper: Usage

## Introduction

<!-- TODO nf-core: Update this after adding human read filtering -->

This pipeline downloads metagenomic data from ENA, assembles the sequences (megahit), finds genes (prodigal) and then ennotates the genes using eggnog mapper.

The input is a csv file with the following structure:

```console
<ena_accession>
<ena_accession>
```

NOTE: The pipeline can download any study from ENA but results are only valid for metagenomic studies.

## Samplesheet input

You will need to create a samplesheet with an ENA accession on each line. You can download an etire project using a `PRJ...` ID or download individual runs with the run IDs.

```bash
--input '[path to samplesheet file]'
```

An [example samplesheet](../assets/samplesheet.csv) has been provided with the pipeline.

## Running the pipeline

The typical command for running the pipeline is as follows:

```bash
nextflow run eggnogmapper --input ./samplesheet.csv -profile docker
```

This will launch the pipeline with the `docker` configuration profile. See below for more information about profiles.

Note that the pipeline will create the following files in your working directory:

```bash
work                # Directory containing the nextflow working files
<OUTDIR>            # Finished results in specified location (defined with --outdir)
.nextflow_log       # Log file from Nextflow
# Other nextflow hidden files, eg. history of pipeline runs and old logs.
```
