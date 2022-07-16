using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControllersTeste.UserControlls
{
    public partial class Snackbar : System.Web.UI.UserControl
    {
        #region public string Text
        private string _text;
        public string Text
        {
            get
            {
                return _text;
            }
            set
            {
                SetTextValue(value);
            }
        }
        #endregion

        #region public bool Bold
        private bool _bold { get; set; }
        public bool Bold
        {
            get
            {
                return _bold;
            }
            set
            {
                SetBoldValue(value);
            }
        }
        #endregion

        #region public int Time
        private int _time;
        public int Time
        {
            get
            {
                return _time;
            }
            set
            {
                SetTimeValue(value);
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        { }
        public void Show()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", string.Format("ShowSnackbar({0});", _time), true);
        }
        public void Show(int time)
        {
            SetTimeValue(time);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", string.Format("ShowSnackbar({0});", _time), true);
        }

        #region Persist
        private void SetTextValue(string value)
        {
            _text = value;
            lblText.Text = _text;

            return;
        }
        private void SetTimeValue(int value)
        {
            _time = value;
            return;
        }
        private void SetBoldValue(bool value)
        {
            _bold = value;
            lblText.Font.Bold = _bold;
            return;
        }
        #endregion
    }
}