#!/bin/bash
# Generate maps
map_files=(
    "./maps/triumph/triumph-01-deck1.dmm"
    "./maps/triumph/triumph-02-deck2.dmm"
    "./maps/triumph/triumph-03-deck3.dmm"
    "./maps/triumph/triumph-04-deck4.dmm"
)

tools/github-actions/nanomap-renderer minimap -w 2240 -h 2240 "${map_files[@]}"

# Move and rename files so the game understands them
cd "data/nanomaps"

mv "triumph-01-deck1_nanomap_z1.png" "triumph_nanomap_z1.png"
mv "triumph-01-deck1_nanomap_z1.png" "triumph_nanomap_z2.png"
mv "triumph-01-deck1_nanomap_z1.png" "triumph_nanomap_z3.png"
mv "triumph-01-deck1_nanomap_z1.png" "triumph_nanomap_z4.png"

cd "../../"
cp data/nanomaps/* "icons/_nanomaps/"
