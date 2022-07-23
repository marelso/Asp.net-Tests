using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControlls
{
    public partial class Snackbar : System.Web.UI.UserControl
    {
        #region Propriedades
        #region public string Text
        private string _text;
        public string Text
        {
            get { return _text; }
            set { SetTextValue(value); }
        }
        #endregion

        #region public string Bold
        private bool _bold;
        public bool Bold
        {
            get { return _bold; }
            set { SetBoldValue(value); }
        }
        #endregion

        #region public int Time
        private int _time = 3000;
        public int Time
        {
            get { return _time; }
            set { SetTimeValue(value); }
        }
        #endregion

        #region public ForeColor Color
        private Color _color;
        public Color ForeColor
        {
            get { return _color; }
            set { SetColorValue(value); }
        }
        #endregion
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        { }

        public void Show() 
        { 
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", string.Format("ShowSnackbar({0});", this._time), true);
        }

        public void Show(int time)
        {
            SetTimeValue(time);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", string.Format("ShowSnackbar({0});", this._time), true);
        }


        #region Persist
        private void SetTextValue(string value)
        {
            this._text = value;
            lblText.Text = _text;
            return;
        }
        private void SetBoldValue(bool value)
        {
            this._bold = value;
            lblText.Font.Bold = _bold;
            return;
        }

        private void SetColorValue(Color value)
        {
            this._color = value;
            lblText.ForeColor = _color;
            return;
        }

        private void SetTimeValue(int value)
        {
            this._time = value;
            return;
        }
        #endregion
    }
}