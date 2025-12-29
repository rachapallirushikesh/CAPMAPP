module.exports = (srv)=>{
    srv.on('pokemon',req => `Hello ${req.data.name}`);
}