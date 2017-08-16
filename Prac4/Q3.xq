for $x in doc("Musicians.xml")/musicians/musician
where $x/albums/album="Lateralus"
return $x/name