for $x in doc("Musicians.xml")/musicians/musician
order by count($x/albums/album) descending
where count($x/albums/album)>0 and count($x/albums/album)<4
return <musician>
        <name>{data($x/name)}</name>
       </musician>