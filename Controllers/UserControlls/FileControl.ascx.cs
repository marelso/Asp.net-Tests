using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserControlls
{
    public partial class FileControl : System.Web.UI.UserControl
    {
        #region Propriedades
        public FileUpload FilesUpload
        {
            get { return flFileUpload; }
        }

        #region public string Extensions
        private string _extensions;
        public string Extensions
        {
            get { return Extensions; }
            set { SetExtensions(value); }
        }
        #endregion

        #region public string Text
        private string _text;
        public string Text
        {
            get { return GetHFValue(); }
            set { SetHFValue(); }
        }
        #endregion

        private List<string> _extensionsHF;

        #region public bool Status
        private bool _status = false;
        public bool Status
        {
            get { return GetStatus(); }
        }
        #endregion

        #region public string Bold
        private bool _allowMultiple;
        public bool AllowMultiple
        {
            get { return _allowMultiple; }
            set { SetMultiple(value); }
        }
        #endregion
        
        #endregion

        #region Setters e Getters
        private void SetHFValue()
        {
            var arquivos = string.IsNullOrEmpty(hfSerializado.Value) ? new List<Tuple<string, byte[]>>() : JsonConvert.DeserializeObject<List<Tuple<string, byte[]>>>(hfSerializado.Value);
            var mensagem = string.Empty;

            foreach (var item in this.FilesUpload.PostedFiles)
            {
                var arquivoNome = item.FileName;
                var arquivoBytes = ByteArray(item.InputStream);
                var conteudo = Tuple.Create(arquivoNome, arquivoBytes);

                arquivos.Add(conteudo);
                CheckList.Items.Add(arquivoNome);
            }

            foreach (var item in arquivos)
                mensagem += (item == arquivos.Last()) ? item.Item1 + "." : item.Item1 + ", ";


            this._text = JsonConvert.SerializeObject(arquivos);
            hfSerializado.Value = _text;
            flFileUpload.ToolTip = mensagem;
            CheckList.Visible = true;
            return;
        }

        private void SetMultiple(bool value)
        {
            this._allowMultiple = value;
            flFileUpload.AllowMultiple = _allowMultiple;
            return;
        }

        private string GetHFValue()
        {
            this._text = hfSerializado.Value;
            return this._text;
        }

        private void GetExtHFValue()
        {
            var serializado = JsonConvert.DeserializeObject<List<string>>(hfExt.Value); ;
            this._extensionsHF = serializado;
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CheckList.Items.Count == 0)
                CheckList.Visible = false;
        }

        public void Clear() 
        {
            hfSerializado.Value = string.Empty;
            flFileUpload.DataBind();
        }


        #region Funções fileupload
        private byte[] ByteArray(Stream input)
        {
            byte[] buffer = new byte[16 * 1024];
            using (MemoryStream ms = new MemoryStream())
            {
                int read;
                while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, read);
                }
                return ms.ToArray();
            }
        }

        private void Postfile()
        {
            if (Validate())
                SetHFValue();
            return;
        }

        #endregion

        #region Validate
        private bool Validate()
        {
            var extensoes = JsonConvert.DeserializeObject<List<string>>(hfExt.Value);

            if (this.FilesUpload.PostedFiles == null || this.FilesUpload.PostedFiles.Count < 1)
                return (_status = false);

            foreach (var item in this.FilesUpload.PostedFiles)
            {
                var index = (item.FileName.IndexOf('.'));
                var extensao = item.FileName.Substring(index, item.FileName.Length - index);
                foreach (string permitido in extensoes)
                    if (permitido.Contains(extensao))
                        _status = true;
                if (!_status)
                    break;
            }
            
            
            if (!_status)
                _status = false;

            return _status;
        }

        private bool GetStatus()
        {
            var extensoes = JsonConvert.DeserializeObject<List<string>>(hfExt.Value);
            var arquivos = JsonConvert.DeserializeObject<List<Tuple<string, byte[]>>>(hfSerializado.Value);

            if (arquivos == null || arquivos.Count() == 0)
                return (_status = false);

            foreach (var item in arquivos)
            {
                var index = (item.Item1.IndexOf('.'));
                var extensao = item.Item1.Substring(index, item.Item1.Length - index);
                foreach (string permitido in extensoes)
                    if (permitido.Contains(extensao))
                        _status = true;
                if (!_status)
                    break;
            }


            if (!_status)
                _status = false;

            return _status;
        }

        private string SetExtensions(string _extensions)
        {
            var extensions = _extensions.Split(',').ToList();
            var extensoes = new List<string>();
            var expressao = string.Empty;
            var mensagem = string.Empty;
            foreach (string ext in extensions)
            {
                var extensao = ext.Trim();
                var formato = string.Empty;
                foreach (char caracter in extensao)
                {
                    if (caracter.ToString() == ".")
                        continue;

                    var item = string.Format("[{0}{1}]", caracter.ToString().ToUpper(), caracter.ToString().ToLower());
                    formato += item;
                }
                extensoes.Add(formato);
                if (extensao != extensions.Last())
                    mensagem += string.Format(" {0},", extensao);
                else
                    mensagem += string.Format(" {0}.", extensao);
            }

            foreach (string extensao in extensoes)
            {
                string formato = string.Empty;
                if (extensao == extensoes.Last())
                    formato = string.Format(@".({0})", extensao);
                else
                    formato = string.Format(@".({0})|.*\", extensao);

                expressao += formato;
            }

            var ValidationExpression = string.Format(@"(.*\{0}$)", expressao);
            this._extensions = ValidationExpression;
            revFiles.ValidationExpression = this._extensions;
            revFiles.ErrorMessage = string.Format("São aceitos somente os arquivos com formato:{0}", mensagem);
            hfExt.Value = JsonConvert.SerializeObject(extensions);
            return ValidationExpression;
        }
        #endregion

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Postfile();
        }
    }
}