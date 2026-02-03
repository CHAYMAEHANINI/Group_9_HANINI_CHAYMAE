// Delete old data
MATCH (n) DETACH DELETE n;

// Create users
CREATE (:User {name:"Ali", age:22}),
       (:User {name:"Sara", age:21}),
       (:User {name:"Yassine", age:23}),
       (:User {name:"Imane", age:20}),
       (:User {name:"Omar", age:24}),
       (:User {name:"Khadija", age:22}),
       (:User {name:"Hamza", age:25}),
       (:User {name:"Salma", age:19}),
       (:User {name:"Anas", age:26}),
       (:User {name:"Meryem", age:21});

// Create interests
CREATE (:Interest {name:"AI"}),
       (:Interest {name:"Music"}),
       (:Interest {name:"Sport"}),
       (:Interest {name:"Technology"});

// Relationships

//----Follow:
MATCH (a:User {name:"Ali"}), (s:User {name:"Sara"})
CREATE (a)-[:FOLLOWS]->(s);

MATCH (s:User {name:"Sara"}), (y:User {name:"Yassine"})
CREATE (s)-[:FOLLOWS]->(y);

MATCH (o:User {name:"Omar"}), (h:User {name:"Hamza"})
CREATE (o)-[:FOLLOWS]->(h);

//----Interest:

MATCH (u:User {name:"Ali"}), (i:Interest {name:"AI"})
CREATE (u)-[:INTERESTED_IN]->(i);

MATCH (u:User {name:"Sara"}), (i:Interest {name:"Music"})
CREATE (u)-[:INTERESTED_IN]->(i);

MATCH (u:User {name:"Yassine"}), (i:Interest {name:"Sport"})
CREATE (u)-[:INTERESTED_IN]->(i);

