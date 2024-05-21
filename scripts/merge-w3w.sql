SELECT 
CREATE VIRTUAL TABLE w3w 
USING VirtualText ( 'w3w.csv' , 'UTF-8', 1, POINT, NONE ',');

UPDATE sites s
FROM w3w w
SET s.w3w=w.w3wWHERE s.id=w.id;

