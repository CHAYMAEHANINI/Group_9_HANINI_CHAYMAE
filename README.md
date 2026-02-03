# Neo4j - Social Media Graph Project 

## Project Overview

This project implements a simple Social Media application using a graph database (Neo4j). The goal is to model users, their social relationships, and their interests in a graph structure.
Neo4j is particularly suitable for social media systems because it focuses on relationships between entities, which are central to social networks.

## Graph Structure
The graph is composed of two main node types: User and Interest. A User node represents a person in the social network and contains properties such as name and age.
An Interest node represents a topic that users are interested in, such as AI, Music, or Sport.

Relationships are used to connect nodes. The FOLLOWS relationship represents a social connection between two users, while the INTERESTED_IN relationship represents the interests of a user.

Graph model:
(User)-[:FOLLOWS]->(User)  
(User)-[:INTERESTED_IN]->(Interest)

## Technologies Used
This project uses Neo4j as the graph database, Cypher as the query language, and Docker to run Neo4j in a containerized environment.

## Running Neo4j with Docker
Neo4j is executed using Docker with the following command:

docker run -d --name neo4j -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/123 -v neo4j_data:/data neo4j

Once the container is running, the Neo4j Browser can be accessed at http://localhost:7474 using the username neo4j and the password 123.

## Data Creation
The database contains ten users and four interests. Users are created as User nodes with name and age properties. Interests are created as Interest nodes with a name property.

Example of user creation:

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

Example of interest creation:

CREATE (:Interest {name:"AI"}),
       (:Interest {name:"Music"}),
       (:Interest {name:"Sport"}),
       (:Interest {name:"Technology"});

## Relationships
Social relationships between users are represented using the FOLLOWS relationship.
User interests are represented using the INTERESTED_IN relationship. The MERGE keyword is used to avoid duplicate relationships.

Example: 

MATCH (u1:User {name:"Ali"}), (u2:User {name:"Sara"}) MERGE (u1)-[:FOLLOWS]->(u2);

MATCH (u:User {name:"Yassine"}), (i:Interest {name:"Sport"}) MERGE (u)-[:INTERESTED_IN]->(i);

## Queries 

To display the graph, the following query can be used:

MATCH (n) RETURN n LIMIT 25;

To display social connections between users:

MATCH (u:User)-[:FOLLOWS]->(f:User) RETURN u.name, f.name;

To display users and their interests:

MATCH (u:User)-[:INTERESTED_IN]->(i:Interest) RETURN u.name, i.name;

## Graph Visualization

Neo4j Browser provides an interactive visualization of the graph, allowing users to easily explore nodes and relationships. This visual representation helps in understanding the structure of the social network.

## Conclusion

This project demonstrates how Neo4j and the Cypher query language can be used to model and query a social media graph efficiently. Graph databases are an excellent choice for applications where relationships between data are essential.
