# Output
The directories listed below will be created in the results directory after the pipeline has finished. All paths are relative to the top-level results directory.

## fetchngs
* `sra/`
  * `*.runinfo.tsv`: Run information for each sample.
  * `*.runinfo_ftp.tsv`: FTP links for sample data.
  * `*.fastq.gz`: Downloaded FASTQ files.
  * `*.fastq.gz.md5`: MD5 checksum files for FASTQ data integrity verification.
  * `*.mappings.csv`: Mapping files for sample identifiers.
  * `*.samplesheet.csv`: Samplesheet files used for tracking and processing samples.

The fetchngs process downloads data from ENA/SRA. The output can be found under the sra directory.

## MEGAHIT
* `megahit/`
  * `megahit_out/`
  * `*.contigs.fa.gz`: Compressed FASTA files containing assembled contigs for each sample.
intermediate_contigs/: Directory containing intermediate assembly files at various k-mer sizes.

[MEGAHIT](https://github.com/voutcn/megahit) performs the assembly of metagenomic data. The output is located in the megahit directory, specifically within the megahit_out subdirectory.

## Prodigal
* `prodigal/`
  * `*.faa.gz`: Predicted protein sequences in compressed FASTA format.
  * `*.fna.gz`: Nucleotide sequences of predicted genes in compressed FASTA format.
  * `*.gff.gz`: Gene features in GFF format.
  * `*_all.txt.gz`: Comprehensive output including all predicted features.

[Prodigal](https://github.com/hyattpd/Prodigal) is used for gene prediction of prokaryotic genomes. The relevant outputs are stored in the prodigal directory.

## eggnog-mapper
* `emapper/`
  * `*.emapper.annotations`: Annotation files containing functional predictions.
  * `*.emapper.hits`: Raw hit information from the eggNOG database.
  * `*.emapper.seed_orthologs`: Seed orthologs used for functional annotation.

[eggNOG-mapper](https://github.com/eggnogdb/eggnog-mapper) is utilized for functional annotation of predicted genes. The results are saved in the emapper directory.
