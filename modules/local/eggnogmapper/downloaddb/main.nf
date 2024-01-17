process EMAPPER_DOWNLOADDB {
    tag "$eggnog_data_dir"
    label 'process_single'

    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/eggnog-mapper:2.1.12--pyhdfd78af_0':
        'biocontainers/eggnog-mapper:2.1.12--pyhdfd78af_0' }"

    input:
    path(eggnog_data_dir)

    output:
    path "eggnog.db"                  , emit: db
    path "eggnog_proteins.dmnd"       , emit: proteins_dmnd
    path "eggnog.taxa.db"             , emit: taxa_db
    path "eggnog.taxa.db.traverse.pkl", emit: taxa_db_pkl
    path "versions.yml"               , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''

    """
    mkdir -p ${params.eggnog_data_dir}
    download_eggnog_data.py --data_dir ${eggnog_data_dir} -y ${args}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        eggnog-mapper: \$(echo \$(emapper.py --version) | grep -o "emapper-[0-9]\\+\\.[0-9]\\+\\.[0-9]\\+" | sed "s/emapper-//")
    END_VERSIONS
    """

    stub:
    """
    touch eggnog.db
    touch eggnog_proteins.dmnd
    touch eggnog.taxa.db
    touch eggnog.taxa.db.traverse.pkl

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        eggnog-mapper: \$(echo \$(emapper.py --version) | grep -o "emapper-[0-9]\\+\\.[0-9]\\+\\.[0-9]\\+" | sed "s/emapper-//")
    END_VERSIONS
    """
}
