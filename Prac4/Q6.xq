for $x at $index in doc("Musicians.xml")/musicians/musician[@type="solo"]
where $index=2
return <musician><name>{data($x/name)}</name><genre>{data($x/genre)}</genre></musician>