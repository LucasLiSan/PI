function Auth (req, res, next) {
    if(req.session.user != undefined) {
        next();
    } else {
        res.render("login", {
            loggerOut: true
        });
    }
}

export default Auth;