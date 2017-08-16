for $x in doc("Musicians.xml")/musicians/musician/albums/album
where $x/@year>="2008"
return $x