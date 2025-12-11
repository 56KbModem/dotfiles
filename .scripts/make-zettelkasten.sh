ZETTELKASTEN_DIR="$HOME/Documents/private/zettelkasten/"
DATE="$(date +%Y%m%d%H%M)"

read -r -p "What do you want to write about?: " response;
response=${response,,}; 
response=$(echo $response | tr ' ' '-'); 

ZETTEL="$ZETTELKASTEN_DIR$DATE-$response.md";

nvim -c "set textwidth=80" -c "set wrap" $ZETTEL;
