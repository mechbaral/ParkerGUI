using HeiswayiNrird.Utility.Common;
using NLog;
using Ookii.Dialogs.Wpf;
using ParkerCompax3UI.Model;
using System;
using System.IO;
using System.IO.Ports;
using System.Reflection;
using System.Windows;

namespace ParkerCompax3UI.Service
{
    public class AppManager
    {
        private static readonly Lazy<AppManager> lazy = new Lazy<AppManager>(() => new AppManager());
        public static AppManager Instance { get { return lazy.Value; } }

        private ILogger _logger;

        private AppManager()
        {
            Init();
        }

        public void Init()
        {
            _logger = LogManager.GetCurrentClassLogger();
            //TerminationChar = "¶";

            CurrentAppSettings = LoadAppSettings();
            if (CurrentAppSettings != null)
            {
                OutputDataDirectory = CurrentAppSettings.OutputDataDirectory;
                var portSettings = new PortSettings();
                var defaultList = portSettings.GetDefaultValues();

                portSettings.IsSerialPortEnabled = CurrentAppSettings.IsSerialPortEnabled;
                portSettings.ReceiverName = CurrentAppSettings.ReceiverName;
                portSettings.Description = CurrentAppSettings.Description;
                portSettings.PortName = CurrentAppSettings.PortName;
                portSettings.BaudRate = CurrentAppSettings.BaudRate;
                portSettings.Parity = CurrentAppSettings.Parity;
                portSettings.DataBits = CurrentAppSettings.DataBits;
                portSettings.StopBits = CurrentAppSettings.StopBits;
                portSettings.Handshake = CurrentAppSettings.Handshake;
                portSettings.PortNameList = defaultList.PortNameList;
                portSettings.BaudRateList = defaultList.BaudRateList;
                portSettings.ParityList = defaultList.ParityList;
                portSettings.DataBitsList = defaultList.DataBitsList;
                portSettings.StopBitsList = defaultList.StopBitsList;
                portSettings.HandshakeList = defaultList.HandshakeList;

                CurrentPortSettings = portSettings;
            }
            else
            {
                OutputDataDirectory = GetAppDirectory;
                var portSettings = new PortSettings();
                CurrentPortSettings = portSettings.GetDefaultValues();
            }
        }

        public string AppTitle
        {
            get
            {
                return string.Format("{0} alpha {1}",
                Assembly.GetExecutingAssembly().GetName().Name,
                Assembly.GetExecutingAssembly().GetName().Version);
            }
        }
        public string GetAppDirectory { get { return AppDomain.CurrentDomain.BaseDirectory; } }
        public string GetContactIdXmlFilename = "ContactId.xml";

        public PortSettings CurrentPortSettings { get; set; }
    
        public AppSettings CurrentAppSettings { get; set; }
        public string OutputDataDirectory { get; set; }
        //public string TerminationChar { get; set; }
              
        public AppSettings LoadAppSettings()
        {
            AppSettings _appConfig = null;

            if (!File.Exists(GetAppDirectory + @"\AppConfig.xml"))
            {
                if (CurrentPortSettings == null)
                    CurrentPortSettings = new PortSettings();

                CurrentPortSettings = CurrentPortSettings.GetDefaultValues();

                _appConfig = new AppSettings()
                {
                    IsSerialPortEnabled = CurrentPortSettings.IsSerialPortEnabled,
                    ReceiverName = CurrentPortSettings.ReceiverName,
                    Description = CurrentPortSettings.Description,
                    PortName = CurrentPortSettings.PortName,
                    BaudRate = CurrentPortSettings.BaudRate,
                    Parity = CurrentPortSettings.Parity,
                    DataBits = CurrentPortSettings.DataBits,
                    StopBits = CurrentPortSettings.StopBits,
                    Handshake = CurrentPortSettings.Handshake,
                    OutputDataDirectory = GetAppDirectory
                };

                try
                {
                    XmlHelper.SerializeToXmlFile<AppSettings>(_appConfig, "AppConfig.xml");
                }
                catch (Exception ex)
                {
                    _logger.Error("[Generic Exception] LoadAppSettings->SerializeToXmlFile: " + ex.ToString());
                    return null;
                }
            }

            try
            {
                var obj = XmlHelper.DeserializeFromXmlFile<AppSettings>(GetAppDirectory + @"\AppConfig.xml");
                _appConfig = new AppSettings();
                _appConfig.IsSerialPortEnabled = obj.IsSerialPortEnabled;
                _appConfig.ReceiverName = obj.ReceiverName;
                _appConfig.Description = obj.Description;
                _appConfig.PortName = obj.PortName;
                _appConfig.BaudRate = obj.BaudRate;
                _appConfig.Parity = obj.Parity;
                _appConfig.DataBits = obj.DataBits;
                _appConfig.StopBits = obj.StopBits;
                _appConfig.Handshake = obj.Handshake;
                _appConfig.OutputDataDirectory = obj.OutputDataDirectory;

                return _appConfig;
            }
            catch (Exception ex)
            {
                _logger.Error("[Generic Exception] LoadAppSettings->DeserializeFromXmlFile: " + ex.ToString());
                return null;
            }
        }

        public void SaveAppSettings()
        {
            try
            {
                var _appConfig = new AppSettings()
                {
                    IsSerialPortEnabled = CurrentPortSettings.IsSerialPortEnabled,
                    ReceiverName = CurrentPortSettings.ReceiverName,
                    Description = CurrentPortSettings.Description,
                    PortName = CurrentPortSettings.PortName,
                    BaudRate = CurrentPortSettings.BaudRate,
                    Parity = CurrentPortSettings.Parity,
                    DataBits = CurrentPortSettings.DataBits,
                    StopBits = CurrentPortSettings.StopBits,
                    Handshake = CurrentPortSettings.Handshake,
                    OutputDataDirectory = OutputDataDirectory
                };

                XmlHelper.SerializeToXmlFile<AppSettings>(_appConfig, "AppConfig.xml");
            }
            catch (Exception ex)
            {
                _logger.Error("[Generic Exception] SaveAppSettings->SerializeToXmlFile: " + ex.ToString());
            }
        }

        public void ShowAboutDialog()
        {
            TaskDialog td = new TaskDialog();
            td.WindowTitle = "About";
            td.MainIcon = TaskDialogIcon.Information;
            td.MainInstruction = AppTitle;
            td.Content = "Developed by Abinash Baral, 2019.\n" +
                         "Address: School of Mechnical Engineering and Automation, Beihang University.\n" +
                         "Website: <a href=\"https://www.buaa.edu.cn\">https://www.buaa.edu.cn/</a>";
            td.EnableHyperlinks = true;
            td.HyperlinkClicked += (obj, e) =>
            {
                System.Diagnostics.Process.Start(e.Href);
            };
            TaskDialogButton okButton = new TaskDialogButton(ButtonType.Ok);
            td.Buttons.Add(okButton);
            TaskDialogButton button = td.ShowDialog(Application.Current.MainWindow);
        }
    }
}