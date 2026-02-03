//To display the graph, the following query can be used:

MATCH (n) RETURN n LIMIT 25;

//To display social connections between users:

MATCH (u:User)-[:FOLLOWS]->(f:User) RETURN u.name, f.name;

//To display users and their interests:

MATCH (u:User)-[:INTERESTED_IN]->(i:Interest) RETURN u.name, i.name;

//To display graph :

MATCH (n) RETURN n
