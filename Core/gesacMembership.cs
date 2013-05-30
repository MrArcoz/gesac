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
            //TODO: - alta de usuarios
            //TODO: - restablecer contraseña
            //TODO: -- falta insertar el nombre en aspnet_Membership
            //TODO: --falta el rol en aspnet_UsersInRoles 
                //[aspnet_Membership_CreateUser]
                //[aspnet_Membership_UpdateUser]
                //[aspnet_UsersInRoles_AddUsersToRoles]
            //TODO: Usuario activo/inactivo (aspnet_Membership.isApproved)
            //TODO: Cambiar roles


            //DECLARE @User VARCHAR(MAX) = 'EBE176BE-777B-4F64-B6A6-6F26394254D1'
            //SELECT* FROM aspnet_Membership where UserId = @User
            //-- falta insertar el nombre


            //SELECT * FROM aspnet_Users where UserId = @User
            //SELECT * FROM aspnet_UsersInRoles where UserId = @User
            //--falta el rol

            //--[aspnet_Membership_CreateUser]
            //--[aspnet_Membership_UpdateUser]
            //--[aspnet_UsersInRoles_AddUsersToRoles]

        }
    }
}