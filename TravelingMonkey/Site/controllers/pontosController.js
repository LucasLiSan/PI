import express from "express";
const router = express.Router();

router.get('/pontos', function(req,res){
    const loggedOut = !user;
    res.render("pontos", {
        loggedOut: loggedOut
    });
});

export default router;