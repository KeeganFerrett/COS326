for $x in doc("Musicians.xml")/musicians/musician
where $x/@type="solo"
return $x/name