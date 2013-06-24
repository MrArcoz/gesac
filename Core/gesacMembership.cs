using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace GESAC
{
    public class gesacMembership 
    {
        public void CreateUser(string username, string password, string email, string name)
        {
            //TODO: - alta de usuarios: http://msdn.microsoft.com/en-us/library/ms152065.aspx
            //TODO: - recordar contraseña: http://msdn.microsoft.com/en-us/library/2x0c6sfa.aspx
            //TODO: - cambiar contraseña: http://msdn.microsoft.com/en-us/library/system.web.security.membershipuser.changepassword.aspx
            //TODO: Cambiar roles: 
                //http://msdn.microsoft.com/en-us/library/system.web.security.roles.removeuserfromroles.aspx
                //http://msdn.microsoft.com/en-us/library/system.web.security.roles.addusertorole.aspx
        }
    }
}