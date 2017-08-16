for $x in doc("Musicians.xml")/musicians/musician
where $x/name="Ben Folds"
  for $y in $x/albums/album
    return <album><year>{data($y/@year)}</year><name>{data($y)}</name></album>
