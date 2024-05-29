## Introduction

**Eggnogmapper** is a bioinformatics pipeline for fast functional annotation of novel sequences. It uses precomputed orthologous groups and phylogenies from the [eggNOG database](http://eggnog5.embl.de) to transfer functional information from fine-grained orthologs only.

Common uses of eggNOG-mapper include the annotation of novel genomes, transcriptomes or even metagenomic gene catalogs.

The use of orthology predictions for functional annotation permits a higher precision than traditional homology searches (i.e. BLAST searches), as it avoids transferring annotations from close paralogs (duplicate genes with a higher chance of being involved in functional divergence).

Benchmarks comparing different eggNOG-mapper options against BLAST and InterProScan can be found [here](https://github.com/jhcepas/emapper-benchmark/blob/master/benchmark_analysis.ipynb).


1. Download data from ENA/SRA ([`fetchngs`](https://github.com/nf-core/fetchngs))
2. Run assembly ([`MEGAHIT`](https://github.com/voutcn/megahit))
3. Predict genes([`Prodigal`](https://github.com/hyattpd/Prodigal))
4. Annotate genes ([`eggnog-mapper`](https://github.com/eggnogdb/eggnog-mapper ))

## Usage

:::note
If you are new to Nextflow and nf-core, please refer to [this page](https://nf-co.re/docs/usage/installation) on how
to set-up Nextflow. Make sure to [test your setup](https://nf-co.re/docs/usage/introduction#how-to-run-a-pipeline)
with `-profile test` before running the workflow on actual data.
:::

First, prepare a csv file with a list of ENA accession IDs that looks as follows:

`ids.csv`:

```csv
PRJEB6102
SRR9984183
SRR13191702
```

Each can be a project ID or a run ID.


Now, you can run the pipeline using:

```bash
nextflow run eggnogmapper \
   -profile <docker/singularity/.../institute> \
   --input ids.csv \
   --outdir <OUTDIR>
```

## Credits

nf-core/eggnogmapper was originally written by Mahdi Robbani.

We thank the following people for their extensive assistance in the development of this pipeline:

- Harshil Patel
- Maxime U Garcia
- James A. Fellows Yates
- Gregor Sturm
- Evangelos Karatzas

## Contributions and Support

If you would like to contribute to this pipeline, please see the [contributing guidelines](.github/CONTRIBUTING.md).

## Citations

<!-- TODO nf-core: Add citation for pipeline after first release. Uncomment lines below and update Zenodo doi and badge at the top of this file. -->
<!-- If you use  nf-core/eggnogmapper for your analysis, please cite it using the following doi: [10.5281/zenodo.XXXXXX](https://doi.org/10.5281/zenodo.XXXXXX) -->

Tools used:
- Li D, Liu CM, Luo R, Sadakane K, Lam TW. MEGAHIT: an ultra-fast single-node solution for large and complex metagenomics assembly via succinct de Bruijn graph. Bioinformatics. 2015 May 15;31(10):1674-6. doi: 10.1093/bioinformatics/btv033. Epub 2015 Jan 20. PMID: 25609793.
- Hyatt, D., Chen, GL., LoCascio, P.F. et al. Prodigal: prokaryotic gene recognition and translation initiation site identification. BMC Bioinformatics 11, 119 (2010). https://doi.org/10.1186/1471-2105-11-119
- Carlos P. Cantalapiedra, Ana Hernandez-Plaza, Ivica Letunic, Peer Bork, and Jaime Huerta-Cepas. 2021
Molecular Biology and Evolution, msab293, https://doi.org/10.1093/molbev/msab293

An extensive list of references for the tools used by the pipeline can be found in the [`CITATIONS.md`](CITATIONS.md) file.

You can cite the `nf-core` publication as follows:

> **The nf-core framework for community-curated bioinformatics pipelines.**
>
> Philip Ewels, Alexander Peltzer, Sven Fillinger, Harshil Patel, Johannes Alneberg, Andreas Wilm, Maxime Ulysse Garcia, Paolo Di Tommaso & Sven Nahnsen.
>
> _Nat Biotechnol._ 2020 Feb 13. doi: [10.1038/s41587-020-0439-x](https://dx.doi.org/10.1038/s41587-020-0439-x).
