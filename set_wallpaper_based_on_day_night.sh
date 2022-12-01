CURRENT_DATE=$(date +%H)

if [[ $CURRENT_DATE -ge 19 ]]; then
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox_astro.jpg"
else
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-rain.jpg" 
fi
