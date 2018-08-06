# dock

Utility for managing groups of docker containers.

    Usage: dock [-h] [-d DIR] ACTION GROUP...
    Execute ACTION on each container in container group GROUP.
    
      -h      display this help and exit
      -d DIR  work with container groups stored in DIR
    
    ACTION may be one of:
    
      start          starts previously created group (docker start)
      stop           stops previously created group (docker stop)
      remove         removes containers (docker rm -v)
      create         runs commands in definition file to create GROUP
      build          builds images for GROUP from defined source repositories
      pull           pulls images without defined source repositories from registry
      backup         renames containers in GROUP to have a -backup suffix
      remove-backup  removes previous backup
      restart        restart GROUP (stop, start)
      recreate       recreate GROUP (conditional-build, stop, remove, create)
      update         update GROUP (pull, build, stop, remove-backup, backup, create)
    
    Each container group consists of a shell script at DIR/definitions/GROUP that
    defines the group.
    Documentation for groups may be stored in files in DIR/docs/GROUP/.
    Source files for building images will be stored in DIR/build/IMAGE/.
    Each group also has the following directories available for container volumes,
    each with associated environment variables available in the definition script:
    
      DIR/volumes-config/GROUP/
          used for text-based configuration files, may be world-readable
          avoid placing secrets, keys or passwords here as this directory
          available as CONFIG_VOLUMES_DIR
      DIR/volumes-data/GROUP/
          directory where volumes that store data should be placed
          this directory should NOT be world-readable
          available as DATA_VOLUMES_DIR
      DIR/volumes-secret/GROUP/
          used for configuration files that include secrets, keys or passwords
          this directory should NOT be world-readable
          available as SECRET_VOLUMES_DIR
    
    A shell script can be placed at '/etc/dock' which will be loaded on startup.
    The following variables will be used from the script:
    
      defaultContainerPath  Default value for DIR
