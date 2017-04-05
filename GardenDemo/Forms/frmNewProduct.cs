using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using GardenDemo.Classes;
namespace GardenDemo
{
    public partial class frmNewProduct : Form
    {
        public frmNewProduct()
        {
            InitializeComponent();
        }

        private void frmNewProduct_Load(object sender, EventArgs e)
        {
            DataBind();
        }

        private void DataBind()
        {
            DbManager db = new DbManager();
            cmbCategory.DataSource = db.GetCategories();
            cmbCategory.DisplayMember = "Name";
            cmbCategory.ValueMember = "ProductCategoryID";
        }
        private void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
                AddProduct();
        }
        private void txtPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            char ch = e.KeyChar;

            if (e.KeyChar == ',' && txtPrice.Text.IndexOf(',') != -1)
            {
                e.Handled = true;
                return;
            }

            if (!Char.IsDigit(ch) && ch != 8 && ch != ',') // ASCII 8 = backspace
            {
                e.Handled = true;
            }

            if (ch != 8 && Regex.IsMatch(txtPrice.Text, @"\,\d\d"))
            {
                e.Handled = true;
            }
        }

        private bool ValidateForm()
        {
            var textBoxes = gbProductDetail.Controls.Cast<Control>()
                                     .OfType<TextBox>()
                                     .OrderBy(control => control.TabIndex);

            foreach (var textBox in textBoxes)
            {

                if (string.IsNullOrWhiteSpace(textBox.Text))
                {
                    textBox.Focus();

                    // remove "txt" prefix
                    var fieldName = textBox.Name.Substring(3);
                    MessageBox.Show(string.Format("Field '{0}' is empty!!!", fieldName));

                    return false;
                }
            }
            return true;
        }

        private void AddProduct()
        {
            DbManager db = new DbManager();
            try
            {
                decimal price;
                if (Decimal.TryParse(txtPrice.Text, out price))
                {
                    if (price > 0)
                    {
                        var product = new Product()
                        {
                            ProductCategoryId = Convert.ToInt32(cmbCategory.SelectedValue),
                            Price = price,
                            Name = txtName.Text
                        };
                        db.InsertProduct(product);

                        MessageBox.Show("INSERT SUCCESFUL");
                        ClearTextFields();
                    }
                    else
                    {
                        MessageBox.Show("Price must be greater than 0");
                    }

                }
                else
                {
                    MessageBox.Show("Attempted conversion of {0} failed!", txtPrice.Text);
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("UNIQUE KEY constraint"))
                    MessageBox.Show("INSERT FAILED, Product already exists in database");
                else MessageBox.Show(ex.ToString());
            }
        }

        private void ClearTextFields()
        {
            var textBoxes = gbProductDetail.Controls.Cast<Control>()
                                    .OfType<TextBox>();
            foreach (TextBox textBox in textBoxes)
            {
                textBox.Text = "";
            }
        }

    }
}
