for $x in doc("Musicians.xml")/musicians/musician
where contains($x/genre,"Pop")
return $x/name