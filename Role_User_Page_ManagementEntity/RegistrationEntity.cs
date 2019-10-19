using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Role_User_Page_ManagementEntity
{
    public class RegistrationEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string EmployeeId { get; set; }
        public string PhoneOffice { get; set; }
        public string PhonePersonal { get; set; }
        public string SelectRole { get; set; }
        public string SelectBranch { get; set; }
        public string PresentAddress { get; set; }
        public string PermanentAddress { get; set; }
    }
}
