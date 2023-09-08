using { cuid, managed } from '@sap/cds/common'; 

namespace fullstack_dev_challenge; 

entity Tests { 
    key ID : UUID;
    createdAt : Timestamp;
    createdBy : User;
    modifiedAt : Timestamp;
    modifiedBy : User;
    title : String;
    description: String;
    questions: association to many Questions on questions.test = $self;
} 

entity Questions { 
    key ID : UUID;
    text : String;
    test : Association to Tests;
    answer : Composition of many Answers;
} 

aspect Answers { 
    key ID : UUID;
    text : String;
} 

type User : String(255);