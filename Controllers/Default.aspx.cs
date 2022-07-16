using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Controllers
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSnackbar_Click(object sender, EventArgs e)
        {
            Snackbar.Text = "Titulo muito foda sei lá o que";
            Snackbar.Time = 10000;
            Snackbar.Bold = true;

            Snackbar.Show(10000);
        }
    }
}