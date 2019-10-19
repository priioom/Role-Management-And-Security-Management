using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace Role_User_Page_ManagementEntity
{
    public class UserEntity
    {
        public string AddBy { get; set; }
        public string ModifiedBy = DateTime.ParseExact(DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
        public string AddDate = DateTime.ParseExact(DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
        public string ModifiedDate { get; set; }
        public string IsActive = "1";
    }
}
