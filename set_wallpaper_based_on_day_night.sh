CURRENT_DATE=$(date +%H)

if [ $CURRENT_DATE -ge 5 ] && [ $CURRENT_DATE -lt 19 ]; then
    sct 6500
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox-rain.jpg" 
else
    sct 4000
    feh --bg-scale "$HOME/Imagens/Gruvbox/gruvbox_astro.jpg"
fi
