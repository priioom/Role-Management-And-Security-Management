using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace Role_User_Page_ManagementEntity
{
    public class AdmissionEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string ContactNumber { get; set; }
        public string FatherName { get; set; }
        public string FatherContactNumber { get; set; }
        public string FatherOccupation { get; set; }
        public string MotherName { get; set; }
        public string MotherOccupation { get; set; }
        public string MotherContactNumber { get; set; }
        public string LocalGuradianName { get; set; }
        public string LocalGuardianContactNumber { get; set; }
        public string LocalGuardianOccupation { get; set; }
        public string RelationWithLocalGuardian { get; set; }
        public string RegistrationNo { get; set; }
        public string RegistrationDate = DateTime.ParseExact(DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), "dd-MM-yyyy HH:mm:ss", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
        public string StudentImagePath { get; set; }
    }

    public class AdressEntity
    {
        public string PresentAddress { get; set; }
        public string PresentDistrict { get; set; }
        public string PresentPoliceStation { get; set; }
        public string PermanentAddress { get; set; }
        public string PermanentDistrict { get; set; }
        public string PermanentPoliceStation { get; set; }
        public string LocalGuardianAddress { get; set; }
    }

    public class DistrictEntity
    {
        public string DistrictName { get; set; }
        public string DistrictID { get; set; }
    }

    public class PoliceStationEntity
    {
        public string PoliceStationName { get; set; }
        public string PoliceStationId { get; set; }
    }

    public class OccupationEntity
    {
        public string OccupationName { get; set; }
        public string OccupationID { get; set; }
    }

    public class ClassEntity
    {
        public string ClassId { get; set; }
        public string RegistrationNumber { get; set; }
        public string ClassName { get; set; }
        public string ClassRoll { get; set; }
        public string Section { get; set; }
        public string Shift { get; set; }
        public string StudentOfficialID { get; set; }
        public string Session { get; set; }
        public string Year { get; set; }
        public string StartingMonth { get; set; }
        public string EndingMonth { get; set; }
    }

    public class Filter
    {
        public string SearchType { get; set; }
        public string SearchText { get; set; }
    }

    public class Courses
    {
        public string CourseId { get; set; }
        public string CourseName { get; set; }
        public string CourseType { get; set; }
        public string FullMarks { get; set; }
        public string ClassId { get; set; }
    }
}
