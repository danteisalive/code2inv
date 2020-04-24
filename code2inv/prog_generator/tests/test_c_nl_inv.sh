#!/bin/bash

num=$1

# timeout 5m ./run_solver.sh $num
cd ..

if [ $? -eq 124 ]
then
    echo "Time's up"
    tput bel
    exit 1
fi

# file=$(cat ../../benchmarks/names.txt | head -$(($num+1)) | tail -1)
# mkdir -p tmp_grammar
file=$(ls ../../benchmarks/nl-bench/c/ | head -$num | tail -1)
graph_file="../../benchmarks/nl-bench/graph/$file.json"
vc_file="../../benchmarks/nl-bench/smt2/$file.smt"
# echo -e "$(cat tests/gen_chc_grammar)\n$(python get_chc_inv_args.py $vc_file)" > "tmp_grammar/chc_inv_$num.grammar"
# echo -e "tmp_grammar/chc_inv_$num.grammar\nchc_inv_checker" > "tmp_grammar/grammar_$num"

# echo $graph_file
# echo $vc_file

./run_solver_file.sh $graph_file $vc_file specs/c_nl_spec