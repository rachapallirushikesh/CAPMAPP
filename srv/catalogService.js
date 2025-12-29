module.exports = cds.service.impl(  
    async function(){

        const {po_item_set} = this.entities;
        this.on('boost',async req =>{
            try {
                const ID = req.params[0];
                console.log('working');
                const tx = cds.tx(req);
                await tx.update(po_item_set).with({
                    gross_amount: {"+=":20000}
                }).where(ID);
            } catch (error) {
                return "Error" + error.toString();
            }
        });

        this.on('largestValue', async function(){
            try {
                console.log('Working 2');
                const ID = req.params[0];
                const tx = cds.tx();
                const result = await tx.read(po_item_set).orderBy({
                    gross_amount: 'desc'
                }).limit(1); 
                return result;
            } catch (error) {
                return "Error" + error.toString();
            }
        })
    }
)