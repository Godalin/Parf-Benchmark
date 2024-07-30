#!/bin/sh

# Run verification tasks of all NoOverflows-BitVectors subdirectories
./get_parf_parameters.sh sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression.target sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-BitVectors/termination-crafted sv-benchmarks/NoOverflows-BitVectors/termination-crafted.target sv-benchmarks/NoOverflows-BitVectors/termination-crafted-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit.target sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-BitVectors/termination-numeric sv-benchmarks/NoOverflows-BitVectors/termination-numeric.target sv-benchmarks/NoOverflows-BitVectors/termination-numeric-config

# Run verification tasks of all NoOverflows-Other subdirectories
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/bitvector sv-benchmarks/NoOverflows-Other/bitvector.target sv-benchmarks/NoOverflows-Other/bitvector-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/goblint-regression sv-benchmarks/NoOverflows-Other/goblint-regression.target sv-benchmarks/NoOverflows-Other/goblint-regression-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/loop-zilu sv-benchmarks/NoOverflows-Other/loop-zilu.target sv-benchmarks/NoOverflows-Other/loop-zilu-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/psyco sv-benchmarks/NoOverflows-Other/psyco.target sv-benchmarks/NoOverflows-Other/psyco-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/recursive-simple sv-benchmarks/NoOverflows-Other/recursive-simple.target sv-benchmarks/NoOverflows-Other/recursive-simple-config
./get_parf_parameters.sh sv-benchmarks/NoOverflows-Other/recursive sv-benchmarks/NoOverflows-Other/recursive.target sv-benchmarks/NoOverflows-Other/recursive-config

# Run verification tasks of all SoftwareSystems-BusyBox-NoOverflows subdirectories
./get_parf_parameters.sh sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0 sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0.target sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0-config

# Run verification tasks of all SoftwareSystems-uthash-NoOverflows subdirectories
./get_parf_parameters.sh sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2 sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2.target sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2-config