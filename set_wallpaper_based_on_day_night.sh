CURRENT_DATE=$(date +%H)

while getopts d: flag
do
    case "${flag}" in
        d) custom_time=${OPTARG};;
    esac
done

if [[ $custom_time -ne 0 ]]; then
  CURRENT_DATE=$custom_time
fi

if [ $CURRENT_DATE -ge 5 ] && [ $CURRENT_DATE -lt 18 ]; then
    sct 6500
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-forest-sunny.jpg"
    sed -i '3 s/0.6/0.6/' "$HOME/.alacritty.yml"
else
    sct 4500
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-astro-2.jpg"
    sed -i '3 s/0.6/0.6/' "$HOME/.alacritty.yml"
fi
