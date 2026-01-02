
module.exports = (srv)=>{
    srv.on('pokemon',req => `Hello ${req.data.name}`);
    const {ReadEmployeeSet} = srv.entities;
    // Hard coded data
    //Example 1:
    // srv.on('READ', 'ReadEmployeeSet', async(req)=>{
    //     return {
    //         "ID": "12121",
    //         "name": "rushi"
    //     };
    // });
    
    //Example 2: Read and Manipulate data
    // srv.on('READ','ReadEmployeeSet', async(req)=>{
    //     //Calling Database and adding extra logic
    //     const tx = await cds.tx(req);
    //     let results = await tx.run(SELECT.from(ReadEmployeeSet).limit(5));
    //     for(let i=0; i<results.length; i++){
    //         const element = results[i];
    //         element.nameMiddle = 'Hello'
    //     }
    //     return results;
    // })

    //Example 3: Working with conditions
    srv.on('READ','ReadEmployeeSet',async(req)=>{
        const tx = cds.tx(req);
        let whereCondition = req.data;
        if(whereCondition.hasOwnProperty('ID')){
            return await tx.run(SELECT.from(ReadEmployeeSet)).where(whereCondition);
        }
        else{
            return await tx.run(SELECT.from(ReadEmployeeSet).limit(2).where({
                "sex":"F"
            }));
        }
    });
}


