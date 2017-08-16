for $x in doc("Musicians.xml")/musicians/musician
order by (max($x/albums/album/@year)-min($x/albums/album/@year)+1) div count($x/albums/album) descending
return <musician>
        <name>{data($x/name)}</name>
        <rate>{data((max($x/albums/album/@year)-min($x/albums/album/@year)+1) div count($x/albums/album))}</rate>
       </musician>