


if command -v oh-my-posh &> /dev/null; then
    local omp_json="$HOME/.omp.json"
    eval "$(oh-my-posh init $(oh-my-posh get shell) --config $omp_json)"
fi