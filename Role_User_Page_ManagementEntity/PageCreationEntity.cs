using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Role_User_Page_ManagementEntity
{
    public class PageCreationEntity
    {
        public string PageName { get; set; }
        public string PageURL { get; set; }
        public string ModuleName { get; set; }
        public string Description { get; set ;}
        public string IsActive { get; set; }
      
    }

    public class ModuleCreationEntity
    {
        public string ModuleName { get; set; }
        public string ModuleURL { get; set; }
        public string ModuleIcon { get; set; }
        public string ParentModuleId { get; set; }
        public string Priority { get; set; }
        public string IsActive { get; set; }
    }


   
}
