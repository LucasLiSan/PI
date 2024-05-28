function Auth (req, res, next) {
    if(req.session.userCidade != undefined) {
        next();
    } else if (req.session.userGuia != undefined) {
        next();
    } else if (req.session.userTurista != undefined) {
        next();
    } else {
        res.render("login", {
            loggedOut : true
        });
    }
}

export default Auth;