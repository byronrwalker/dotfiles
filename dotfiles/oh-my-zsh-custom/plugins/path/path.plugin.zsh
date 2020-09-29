paths=(
	$HOME/bin
	$HOME/gh/github/bin
)

for dir in $paths; do
    if [ -d "$dir" ]; then
	path=($dir $path)
    fi
done

typeset -U path
export PATH
