/*
 * Eggnog mapper pipeline
 */

include { EMAPPER_DOWNLOADDB           } from '../../modules/local/eggnogmapper/downloaddb/main'
include { EGGNOGMAPPER as EMAPPER_RUN  } from '../../modules/nf-core/eggnogmapper/main'

workflow EMAPPER {
    take:
    ch_fasta             // [ [ meta ] , fasta ], input (mandatory)
    // ch_eggnog_db         // [ db_folder_path ], presupplied eggnog db (from download_eggnog_data.py) (optional)
    ch_eggnog_data_dir   // [ hammer_db_path ], path to hammer database (optional?)
    // ch_eggnog_diamond_db // [ [ meta ], diamond_db_path ] path to diamond database (optional?)

    main:
    ch_versions = Channel.empty()

    // TODO: Only run DOWNLOADDB is the folder is not empty
    // if ( params.eggnog_data_dir ) {
    //     ch_data_dir = ch_eggnog_data_dir
    // } else {
    //     ch_data_dir = GUNC_DOWNLOADDB( params.gunc_database_type ).db
    //     ch_versions.mix( GUNC_DOWNLOADDB.out.versions )
    // }

    // EMAPPER_DOWNLOADDB( params.eggnog_data_dir )
    // ch_versions.mix ( EMAPPER_DOWNLOADDB.out.versions )

    EMAPPER_RUN( ch_fasta, ch_eggnog_data_dir)
    ch_versions.mix( EMAPPER_RUN.out.versions )

    emit:
    versions = ch_versions

}
