/*
 * Eggnog mapper pipeline
 */

include { EMAPPER_DOWNLOADDB           } from '../../modules/local/eggnogmapper/downloaddb/main'
include { EGGNOGMAPPER as EMAPPER_RUN  } from '../../modules/nf-core/eggnogmapper/main'

workflow EMAPPER {
    take:
    ch_fasta             // [ [ meta ] , fasta ], input (mandatory)
    ch_eggnog_data_dir   // [ db_folder_path ], presupplied eggnog db (from download_eggnog_data.py)
    ch_db                // [ eggnog.db ] (from download_eggnog_data.py)
    ch_proteins_dmnd     // [ eggnog_proteins.dmnd ] (from download_eggnog_data.py)
    ch_taxa_db           // [ eggnog.taxa.db ] (from download_eggnog_data.py)
    ch_taxa_db_pkl       // [ eggnog.taxa.db.traverse.pkl ] (from download_eggnog_data.py)

    main:
    ch_versions = Channel.empty()

    if ( !params.skip_download ) {
        ch_download = EMAPPER_DOWNLOADDB( ch_eggnog_data_dir )
        ch_versions.mix ( ch_download.versions )

        ch_db = ch_download.db
        ch_proteins_dmnd = ch_download.proteins_dmnd
        ch_taxa_db = ch_download.taxa_db
        ch_taxa_db_pkl = ch_download.taxa_db_pkl

    }

    EMAPPER_RUN(
        ch_fasta,
        ch_eggnog_data_dir,
        ch_db,
        ch_proteins_dmnd,
        ch_taxa_db,
        ch_taxa_db_pkl,
    )
    ch_versions.mix( EMAPPER_RUN.out.versions )

    emit:
    versions = ch_versions

}
