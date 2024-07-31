# ENA2eggNOG workflow
<table>
  <tr width="100%">
    <td width="150px">
      <a href="https://www.bork.embl.de/"><img src="https://www.bork.embl.de/assets/img/normal_version.png" alt="Bork Group Logo" width="150px" height="auto"></a>
    </td>
    <td width="425px" align="center">
      <b>Developed by the <a href="https://www.bork.embl.de/">Bork Group</a> in collaboration with <a href="https://nf-co.re/">nf-core</a></b><br>
      Raise an <a href="https://github.com/grp-bork/ENA2eggNOG/issues">issue</a> or <a href="mailto:N4M@embl.de">contact us</a><br><br>
      See our <a href="https://www.bork.embl.de/services.html">other Software & Services</a>
    </td>
    <td width="250px">
      Contributors:<br>
      <ul>
        <li>
          <a href="https://github.com/mahdi-robbani/">Mahdi Robbani</a> <a href="https://orcid.org/0000-0003-0161-0559"><img src="https://orcid.org/assets/vectors/orcid.logo.icon.svg" alt="ORCID icon" width="20px" height="20px"></a><br>
        </li>
        <li>
          <a href="https://github.com/cschu/">Christian Schudoma</a> <a href="https://orcid.org/0000-0003-1157-1354"><img src="https://orcid.org/assets/vectors/orcid.logo.icon.svg" alt="ORCID icon" width="20px" height="20px"></a><br>
        </li>
        <li>
          <a href="https://github.com/danielpodlesny/">Daniel Podlesny</a> <a href="https://orcid.org/0000-0002-5685-0915"><img src="https://orcid.org/assets/vectors/orcid.logo.icon.svg" alt="ORCID icon" width="20px" height="20px"></a><br>
        </li>
      </ul>
    </td>
    <td width="250px">
      Collaborators:<be>
      <ul>
        <li>
          <a href="https://github.com/drpatelh/">Harshil Patel</a>
        </li>
        <li>
          <a href="https://github.com/maxulysse/">Maxime U Garcia</a>
        </li>
        <li>
          <a href="https://github.com/jfy133/">James A. Fellows Yates</a>
        </li>
        <li>
          <a href="https://github.com/grst/">Gregor Sturm</a>
        </li>
        <li>
          <a href="https://github.com/vagkaratzas/">Evangelos Karatzas</a>
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center">The development of this workflow was supported by <a href="https://www.nfdi4microbiota.de/">NFDI4Microbiota <img src="https://github.com/user-attachments/assets/1e78f65e-9828-46c0-834c-0ed12ca9d5ed" alt="NFDI4Microbiota icon" width="20px" height="20px"></a> 
</td>
  </tr>
</table>

---
#### Description
The `ENA2eggNOG` workflow is a nextflow workflow for fast functional annotation of novel sequences. It uses precomputed orthologous groups and phylogenies from the [eggNOG database](http://eggnog5.embl.de) to transfer functional information from fine-grained orthologs only.

Common uses of eggNOG-mapper include the annotation of novel genomes, transcriptomes, or even metagenomic gene catalogs.

The use of orthology predictions for functional annotation permits a higher precision than traditional homology searches (i.e. BLAST searches), as it avoids transferring annotations from close paralogs (duplicate genes with a higher chance of being involved in functional divergence).

Benchmarks comparing different eggNOG-mapper options against BLAST and InterProScan can be found [here](https://github.com/jhcepas/emapper-benchmark/blob/master/benchmark_analysis.ipynb).

#### Citation
This workflow: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13143269.svg)](https://doi.org/10.5281/zenodo.13143269)


Also cite:
```
Cantalapiedra CP, Hernández-Plaza A, Letunic I, Bork P, Huerta-Cepas J. eggNOG-mapper v2: Functional Annotation, Orthology Assignments, and Domain Prediction at the Metagenomic Scale. Mol Biol Evol. 2021;38(12):5825-5829. doi:10.1093/molbev/msab293
Ewels PA, Peltzer A, Fillinger S, et al. The nf-core framework for community-curated bioinformatics pipelines. Nat Biotechnol. 2020;38(3):276-278. doi:10.1038/s41587-020-0439-x
Li D, Liu CM, Luo R, Sadakane K, Lam TW. MEGAHIT: an ultra-fast single-node solution for large and complex metagenomics assembly via succinct de Bruijn graph. Bioinformatics. 2015;31(10):1674-1676. doi:10.1093/bioinformatics/btv033
Hyatt D, Chen GL, Locascio PF, Land ML, Larimer FW, Hauser LJ. Prodigal: prokaryotic gene recognition and translation initiation site identification. BMC Bioinformatics. 2010;11:119. Published 2010 Mar 8. doi:10.1186/1471-2105-11-119
```
An extensive list of references for the tools used by the pipeline can be found in the [`CITATIONS.md`](https://raw.githubusercontent.com/grp-bork/ENA2eggNOG/master/CITATIONS.md) file.

---
# Overview
1. Download data from ENA/SRA ([`fetchngs`](https://github.com/nf-core/fetchngs))
2. Run assembly ([`MEGAHIT`](https://github.com/voutcn/megahit))
3. Predict genes([`Prodigal`](https://github.com/hyattpd/Prodigal))
4. Annotate genes ([`eggnog-mapper`](https://github.com/eggnogdb/eggnog-mapper ))

---
# Usage
## Cloud-based Workflow Manager (CloWM)
This workflow will be available on the CloWM platform (coming soon).

## Command-Line Interface (CLI)
If you are new to Nextflow and nf-core, please refer to [this page](https://nf-co.re/docs/usage/installation) on how
to set-up Nextflow. Make sure to [test your setup](https://nf-co.re/docs/usage/introduction#how-to-run-a-pipeline)
with `-profile test` before running the workflow on actual data.

You can run the pipeline using:
```bash
nextflow run eggnogmapper \
   -profile <docker/singularity/.../institute> \
   --input ids.csv \
   --outdir <OUTDIR>
```

## Input files
The input is a csv file with a list of ENA accession IDs that looks as follows:

`ids.csv`:

```csv
PRJEB6102
SRR9984183
SRR13191702
```

Each can be a project ID or a run ID.
