using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Role_User_Page_ManagementEntity
{
    public class userLoginEntity
    {
        public string UserName { get; set; }
        public string Password { get; set; }
    }

    public class UserRole
    {
        public string Role { get; set; }
    }

    public class CreatingMenuItem
    {
        public string div { get; set; }
        public string ul { get; set; } 
        public string li{get; set;}
        public string i { get; set; }
        public string a { get; set; }
        public string span { get; set; }
        public string qryMenu { get; set; }
        public string qrySubMenu { get; set; }
        public string MenuName { get; set; }

    }
}
