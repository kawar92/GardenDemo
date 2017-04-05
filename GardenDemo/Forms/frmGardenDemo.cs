using System;
using System.Data;
using System.Globalization;
using System.Windows.Forms;
using GardenDemo.Classes;

namespace GardenDemo
{
    public partial class frmGardenDemo : Form
    {
        public frmGardenDemo()
        {
            InitializeComponent();
        }

      
        private void Form1_Load(object sender, EventArgs e)
        {
            DataBind();
        }

        private void DataBind()
        {
            DbManager db = new DbManager();
            DataTable dt = db.GetCategories();

            DataRow dr = dt.NewRow();
            dr["Name"] = "<All>";
            dr["ProductCategoryID"] = 0;
            dt.Rows.InsertAt(dr, 0);


            bss.DataSource = db.GetProductsByCategory(cmbCategory.Text);

            txtName.DataBindings.Add(new Binding("Text", bss, "Name"));
            txtCategory.DataBindings.Add(new Binding("Text", bss, "Category"));

            Binding b = new Binding("Text", bss, "Price");
            b.Format += new ConvertEventHandler(DecimalToCurrencyString);
            b.Parse += new ConvertEventHandler(CurrencyStringToDecimal);
            txtPrice.DataBindings.Add(b);

            cmbCategory.DataSource = dt;
            cmbCategory.DisplayMember = "Name";
            cmbCategory.ValueMember = "ProductCategoryID";

            dataGridView1.Columns["Price"].DefaultCellStyle.Format = "N2";
        }
        private void DecimalToCurrencyString(object sender, ConvertEventArgs e)
        {
            if (e.DesiredType != typeof(string)) return;
            e.Value = ((decimal)e.Value).ToString("c");
        }

        private void CurrencyStringToDecimal(object sender, ConvertEventArgs e)
        {
            if (e.DesiredType != typeof(decimal)) return;
            e.Value = Decimal.Parse(e.Value.ToString(),
            NumberStyles.Currency, null);
        }

 
        private void SelectRow()
        {
            if(dataGridView1.Rows.Count > 0)
            {
                dataGridView1.ClearSelection();
                dataGridView1.Rows[bss.Position].Selected = true;
                dataGridView1.CurrentCell = dataGridView1.Rows[bss.Position].Cells[0];
            }
        }
       
        private void DisplayPosition()
        {
            lblPosition.Text = string.Format("{0}/{1}", bss.Position + 1, bss.Count);
        }

        private void ChangeRecord()
        {
            SelectRow();
            DisplayPosition();
        }
       
        private void btnNewProduct_Click(object sender, EventArgs e)
        {
            frmNewProduct np = new frmNewProduct();
            np.ShowDialog();
           
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            bss.MoveNext();
            ChangeRecord();
        }
        private void btnPre_Click(object sender, EventArgs e)
        {
            bss.MovePrevious();
            if (dataGridView1.Rows.Count > 0)
            {
                ChangeRecord();
            }

        }
        private void btnLast_Click(object sender, EventArgs e)
        {
            bss.MoveLast();
            ChangeRecord();
        }

        private void btnFirst_Click(object sender, EventArgs e)
        {
            bss.MoveFirst();
            ChangeRecord();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DbManager db = new DbManager();
            dataGridView1.DataSource = db.GetProductsByCategory(cmbCategory.Text);
            bss.DataSource = db.GetProductsByCategory(cmbCategory.Text);
            DisplayPosition();
        }

        private void dataGridView1_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            bss.Position = e.RowIndex;
            DisplayPosition();
        }

        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (dataGridView1.Rows.Count > 0 && e.KeyCode == Keys.Enter)
            {
                bss.Position = dataGridView1.CurrentCell.RowIndex;
                DisplayPosition();
                e.Handled = true;
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bss.DataSource;
            ((DataTable)dataGridView1.DataSource).DefaultView.RowFilter = string.Format("name LIKE '*{0}*'", txtSearch.Text);
            dataGridView1.Refresh();

            DisplayPosition();
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = e.KeyChar != (char)Keys.Back && !char.IsSeparator(e.KeyChar) && !char.IsLetter(e.KeyChar) && !char.IsDigit(e.KeyChar);
        }
    }
}
