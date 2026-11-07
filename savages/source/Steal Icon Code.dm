/*
    SSSSSSSSS       TTTTTTTTTTTTT        EEEEEEEEE          AAAAA        LL
    SS                    TT             E                AA     AA      LL
    SSSSSSSSS             TT             E EEEEEEE        AAAAAAAAA      LL
           SS             TT             E                AA     AA      LL
    SSSSSSSSS             TT             EEEEEEEEEE       AA     AA      LLLLLLLLLL*/


// Stealing is easy as 1,2,3 and A,B,C but can be tough to think of.  So i made some code so
// you to be able to steal icons!  Enjoy havin misc. icons!





mob/Admin/verb/GM_geticon(O in view())
	set category = "Admin"
	usr << ftp(O:icon)