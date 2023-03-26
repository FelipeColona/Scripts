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

if [ $CURRENT_DATE -ge 5 ] && [ $CURRENT_DATE -lt 19 ]; then
    sct 6500
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-leafs.jpg"
    sed -i '3 s/0.4/0.6/' "$HOME/.alacritty.yml"
else
    sct 5000
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-forest.jpg"
    sed -i '3 s/0.6/0.4/' "$HOME/.alacritty.yml"
fi
