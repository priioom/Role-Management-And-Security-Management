using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Role_User_Page_ManagementEntity
{
    public class ChangePasswordEntity
    {
        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public string ResetPassword { get; set; }
        public string ResetConPassword { get; set; }

    }
}
