# Usage
This pipeline downloads metagenomic data from ENA, assembles the sequences with `megahit`, finds genes with `prodigal`, and then annotates the genes using `eggnog-mapper`.

## CLI
The typical command for running the pipeline is as follows:

```bash
nextflow run ENA2eggNOG --input ./samplesheet.csv -profile docker
```

This will launch the pipeline with the `docker` configuration profile. See below for more information about profiles.

## Input
You will need to create a samplesheet with an ENA accession on each line. You can download an entire project using a `PRJ...` ID or download individual runs with the run IDs. The input is a csv file with the following structure:

```
<ena_accession>
<ena_accession>
```

NOTE: The pipeline can download any study from ENA but results are only valid for metagenomic studies.

## Parameters
* `input`: sample sheet with ENA accessions.
