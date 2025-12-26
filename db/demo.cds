//a namespace is used to uniquely identify 
//and logically group your CDS artifacts (entities, types, services) and to avoid name conflicts.
namespace rushidb;
using { commons as spiderman } from './common';
using { cuid, temporal, managed } from '@sap/cds/common';


//Context, in CAPM is used to logically group related entities and influence their technical database names.
context master{
    //first table for storing student data
    entity student: spiderman.address{
        key id: spiderman.guid;
        name: String(30);
        class: Association to one master.standards;
        gender: String(1);
    }

    entity standards {
        key id: Int16;
        classname:String(30);
        sections:Int16;
        classteacher:String(30);
    }   
    entity books{
        key id: spiderman.guid;
        bookname: String(30);
        author: String(80);
    }
}

context trans{
    entity rentals : cuid, temporal, managed {
        student:Association to one master.student;
        books:Association to one master.books;
    }
}