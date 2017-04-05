using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace GardenDemo.Classes
{
    class DbManager
    {
        private static string _connectionString;

        public DbManager()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["Garden_CS"].ConnectionString;
        }

        public DataTable GetProductsByCategory(string category)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand com = conn.CreateCommand())
                {
                    com.CommandText = "spGetProductByCategory";
                    com.CommandType = System.Data.CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@category", category);

                    SqlDataReader dr = com.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    return dt;
                }
            }

        }

        public DataTable GetCategories()
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand com = conn.CreateCommand())
                {
                    com.CommandText = "SELECT Name, ProductCategoryID FROM ProductCategory";
                    SqlDataReader dr = com.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    return dt;
                }
            }
        }

        public void InsertProduct(Product product)
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand com = conn.CreateCommand())
                {
                    com.CommandText = "spInsertProduct";
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@Name", product.Name);
                    com.Parameters.AddWithValue("@ProductCategoryID", product.ProductCategoryId);

                    SqlParameter parameter = new SqlParameter("@Price", SqlDbType.Decimal);
                    parameter.Precision = 19;
                    parameter.Scale = 4;
                    parameter.Value = product.Price;
                    com.Parameters.Add(parameter);
                    com.ExecuteNonQuery();
                }
            }
        }



    }
}
