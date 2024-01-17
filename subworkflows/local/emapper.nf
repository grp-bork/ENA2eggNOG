/*
 * Eggnog mapper pipeline
 */

include { EMAPPER_DOWNLOADDB           } from '../../modules/local/eggnogmapper/downloaddb/main'
include { EGGNOGMAPPER as EMAPPER_RUN  } from '../../modules/nf-core/eggnogmapper/main'

workflow EMAPPER {
    take:
    ch_fasta             // [ [ meta ] , fasta ], input (mandatory)
    ch_eggnog_data_dir   // [ db_folder_path ], presupplied eggnog db (from download_eggnog_data.py)

    main:
    ch_versions = Channel.empty()

    EMAPPER_DOWNLOADDB( ch_eggnog_data_dir )
    ch_versions.mix ( EMAPPER_DOWNLOADDB.out.versions )

    EMAPPER_RUN(
        ch_fasta,
        ch_eggnog_data_dir,
        EMAPPER_DOWNLOADDB.out.db,
        EMAPPER_DOWNLOADDB.out.proteins_dmnd,
        EMAPPER_DOWNLOADDB.out.taxa_db,
        EMAPPER_DOWNLOADDB.out.taxa_db_pkl,
    )
    ch_versions.mix( EMAPPER_RUN.out.versions )

    emit:
    versions = ch_versions

}
