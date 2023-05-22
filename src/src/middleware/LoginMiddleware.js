const CheckLogin = (req,res,next) => {
    const { isLoggedIn } = req.session;
    console.log(isLoggedIn);
    if (isLoggedIn) {
        next();
    } else {
      res.redirect('/');  
    }
}

module.exports = CheckLogin;