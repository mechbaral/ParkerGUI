using System.Windows;
using HeiswayiNrird.MVVM.Common;
using NLog;
using ParkerCompax3UI.Service;
using ParkerCompax3UI.Model;
using System.Collections.Generic;
using ParkerCompax3UI.View;

namespace ParkerCompax3UI.ViewModel
{
    public class MainWindowViewModel : ViewModelBase
    {
        #region Fields
        private readonly string _appTitle;
        private readonly TopMenuViewModel _topMenuVM;
        private readonly SerialPortConfigViewModel _serialPortConfigVM;
        private readonly CylinderOneViewModel _cylinderOneVM;
        private bool _IsEnabledSerialPortVM;
        private string _BottomStatusText;
        private ILogger _logger;
        #endregion

        #region Properties
        public string AppTitle { get { return _appTitle; } }
        public TopMenuViewModel TopMenuVM { get { return _topMenuVM; } }
        public SerialPortConfigViewModel SerialPortConfigVM { get { return _serialPortConfigVM; } }
        public CylinderOneViewModel CylinderOneVM { get { return _cylinderOneVM; } }
        public bool IsEnabledSerialPortVM
        {
            get { return _IsEnabledSerialPortVM; }
            set
            {
                _IsEnabledSerialPortVM = value;
                RaisePropertyChanged(() => IsEnabledSerialPortVM);
            }
        }
        public string BottomStatusText
        {
            get { return _BottomStatusText; }
            set
            {
                _BottomStatusText = value;
                RaisePropertyChanged(() => BottomStatusText);
            }
        }
        #endregion

        #region Constructor of MainWindowViewModel
        public MainWindowViewModel()
        {
            _logger = LogManager.GetCurrentClassLogger();

            //App name and version
            _appTitle = AppManager.Instance.AppTitle;

            //Initilize all viewmodels
            _topMenuVM = new TopMenuViewModel();
            _serialPortConfigVM = new SerialPortConfigViewModel();
            _cylinderOneVM = new CylinderOneViewModel();

            IsEnabledSerialPortVM = true;

            Application.Current.MainWindow.Closing += MainWindow_Closing;
            SerialPortManager.Instance.OnSerialPortOpened += (obj, e) =>
            {
                if (e == true)
                {
                    _IsEnabledSerialPortVM = false;
                }
                else
                {
                    IsEnabledSerialPortVM = true;
                }
            };
            SerialPortManager.Instance.OnStatusChanged += (obj, e) =>
            {
                BottomStatusText = e;
            };

            BottomStatusText = "Application started.";
            _logger.Trace("Application started.");
        }
        #endregion

        #region Methods
        private void MainWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (SerialPortManager.Instance.IsOpen)
                SerialPortManager.Instance.Close();

            AppManager.Instance.SaveAppSettings();

            BottomStatusText = "Application closing...";

            _logger.Trace("Application closing...");
        }

        #endregion
    }
}
