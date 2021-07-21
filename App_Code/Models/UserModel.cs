using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DemoAuthorization.Models
{
    public class UserModel : BaseDataAccess
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int RoleCode { get; set; }

        public UserModel()
        {
        }

        public UserModel(int id, string username, string password, string firstName, string lastName, int roleCode)
        {
            ID = id;
            Username = username;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            RoleCode = roleCode;
        }

        public UserModel Login(string username, string password)
        {
            DataTable dataTable = base.GetDataByStoredProcedure("sp_login", new SqlParameter[]
            {
                new SqlParameter("@username", username),
                new SqlParameter("@password", password)
            });
            if (dataTable.Rows.Count != 1)
            {
                return null;
            }
            else
            {
                DataRow row = dataTable.Rows[0];
                return new UserModel(
                    row.Field<int>("user_id"),
                    row.Field<string>("username"),
                    row.Field<string>("password"),
                    row.Field<string>("firstName"),
                    row.Field<string>("lastName"),
                    row.Field<int>("role_code")
                );
            }
        }
    }
}