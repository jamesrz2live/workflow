# Workflow

A collection of scripts I use to improve my workflow on various projects.

## Dry run

To preview a particular script, you can enable dry run mode like so:

    DRY_RUN=true {script} [options] [arguments]

For example:
    
    DRY_RUN=true aces-bproto-move.sh   

Dry run mode prevent commands that do work from executing and will print them to stdout instead, allowing you to preview what would happen if the script had been run 'for realz'.

