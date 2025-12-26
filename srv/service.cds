using { rushidb.master as master, 
    rushidb.trans as transactional } from '../db/demo';

service MyService @( path:'Myservice' ) {

    entity StudentSet as projection on master.student;
    entity BookSet as projection on master.books;
    entity StandardSet as projection on master.standards;
    entity ConversionSet as projection on transactional.rentals;
}
