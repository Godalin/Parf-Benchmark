#!/bin/sh

# Run verification tasks of all NoOverflows-BitVectors subdirectories
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression.target sv-benchmarks/NoOverflows-BitVectors/signedintegeroverflow-regression-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-BitVectors/termination-crafted sv-benchmarks/NoOverflows-BitVectors/termination-crafted.target sv-benchmarks/NoOverflows-BitVectors/termination-crafted-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit.target sv-benchmarks/NoOverflows-BitVectors/termination-crafted-lit-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-BitVectors/termination-numeric sv-benchmarks/NoOverflows-BitVectors/termination-numeric.target sv-benchmarks/NoOverflows-BitVectors/termination-numeric-output

# Run verification tasks of all NoOverflows-Other subdirectories
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/bitvector sv-benchmarks/NoOverflows-Other/bitvector.target sv-benchmarks/NoOverflows-Other/bitvector-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/goblint-regression sv-benchmarks/NoOverflows-Other/goblint-regression.target sv-benchmarks/NoOverflows-Other/goblint-regression-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/loop-zilu sv-benchmarks/NoOverflows-Other/loop-zilu.target sv-benchmarks/NoOverflows-Other/loop-zilu-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/psyco sv-benchmarks/NoOverflows-Other/psyco.target sv-benchmarks/NoOverflows-Other/psyco-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/recursive-simple sv-benchmarks/NoOverflows-Other/recursive-simple.target sv-benchmarks/NoOverflows-Other/recursive-simple-output
./run_frama-c-sv.sh sv-benchmarks/NoOverflows-Other/recursive sv-benchmarks/NoOverflows-Other/recursive.target sv-benchmarks/NoOverflows-Other/recursive-output

# Run verification tasks of all SoftwareSystems-BusyBox-NoOverflows subdirectories
./run_frama-c-sv.sh sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0 sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0.target sv-benchmarks/SoftwareSystems-BusyBox-NoOverflows/busybox-1.22.0-output

# Run verification tasks of all SoftwareSystems-uthash-NoOverflows subdirectories
./run_frama-c-sv.sh sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2 sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2.target sv-benchmarks/SoftwareSystems-uthash-NoOverflows/uthash-2.0.2-output