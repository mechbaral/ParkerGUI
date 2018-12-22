using HeiswayiNrird.MVVM.Common;
using OxyPlot;
using ParkerCompax3UI.Model;
using ParkerCompax3UI.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO.Ports;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Configuration;
using System.IO;
using NLog.Internal;
using Microsoft.Win32;


namespace ParkerCompax3UI.ViewModel
{
    public class CylinderOneViewModel : ViewModelBase
    {
        #region Field and Properties

        private bool _Stopped = false;
        private bool PowerIsOn = false;
        private List<double> _outputData = new List<double>();
        private List<DataPoint> _RealCoordinatePoints;
        public List<DataPoint> RealCoordinatePoints
        {
            get

            {
                return _RealCoordinatePoints;
            }
            set
            {
                if (_RealCoordinatePoints == value)
                    return;

                _RealCoordinatePoints = value;
                RaisePropertyChanged(() => RealCoordinatePoints);
            }
        }
        private ObservableCollection<DataPoint> _CoordinatePoints;
        public ObservableCollection<DataPoint> CoordinatePoints
        {
            get

            {
                return _CoordinatePoints;
            }
            set
            {
                if (_CoordinatePoints == value)
                    return;

                _CoordinatePoints = value;
                RaisePropertyChanged(() => CoordinatePoints);
            }
        }
        private List<InputData> m_SettingDataList;
        public List<InputData> SettingDataList
        {
            get
            {
                return m_SettingDataList;
            }
            set
            {
                m_SettingDataList = value;
                RaisePropertyChanged(() => SettingDataList);
            }
        }
        private int m_SelectedDataIndex;
        public int SelectedDataIndex
        {
            get
            {
                return m_SelectedDataIndex;
            }
            set
            {
                m_SelectedDataIndex = value;
                RaisePropertyChanged(() => SelectedDataIndex);
            }
        }
        private double[] _CurrentValueArray;
        public double[] CurrentValueArray
        {
            get
            {
                return _CurrentValueArray;
            }
            set
            {
                _CurrentValueArray = value;
                RaisePropertyChanged(() => CurrentValueArray);
            }
        }
        public string _PowerStatusOfMachine;
        public string PowerStatusOfMachine
        {
            get
            {
                return _PowerStatusOfMachine;
            }
            set
            {
                _PowerStatusOfMachine = value;
                RaisePropertyChanged(() => PowerStatusOfMachine);
            }
        }
        public List<string> RawDataFromSerialPort;
        SerialPortManager currentPort = SerialPortManager.Instance;
        #endregion

        #region Constructor
        public CylinderOneViewModel()
        {
            SettingDataList = settingDataList();
            RealCoordinatePoints = new List<DataPoint>();
            GraphForSettingValue();
            currentPort.OnDataReceived += CurrentPort_OnDataReceived;
            RawDataFromSerialPort = new List<string>();
        }
        #endregion

        #region Event Handlers
        public void DataGrid_CurrentCellChanged(object sender, EventArgs e)
        {
            GraphForSettingValue();
        }
        #endregion

        #region Methods
        private void GraphForSettingValue()
        {
            CoordinatePoints = new ObservableCollection<DataPoint>();
            CoordinatePoints.Add(new DataPoint(0, 0));


            double acc = 0;
            foreach (var dataItem in SettingDataList)
            {
                acc += dataItem.DelayTime;
                CoordinatePoints.Add(new DataPoint(acc, dataItem.SetValue));
                acc += dataItem.KeepTime;
                CoordinatePoints.Add(new DataPoint(acc, dataItem.SetValue));
            }
            CoordinatePoints.Add(new DataPoint(acc, 0));
        }

        private List<InputData> settingDataList()
        {
            List<InputData> dataList = new List<InputData>();

            dataList.Add(new InputData(100, 30, 15));
            dataList.Add(new InputData(190, 30, 9));
            dataList.Add(new InputData(10, 30, 10));
            dataList.Add(new InputData(150, 30, 9));
            dataList.Add(new InputData(20, 30, 10));
            dataList.Add(new InputData(80, 5, 15));
            dataList.Add(new InputData(200, 8, 9));
            dataList.Add(new InputData(0, 12, 10));

            return dataList;
        }

        public void WriteDataToPLC_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentPort = SerialPortManager.Instance;
                //var currentPort  = _portManager.GetCurrentPort();


                if (currentPort == null || !currentPort.IsOpen)
                {
                    MessageBox.Show("Please open the port");
                    return;
                }

                int SetValueCounter = 1;
                int DelayTimeCounter = 1;
                int KeepTimeCounter = 11;
                foreach (var dataItem in SettingDataList)
                {
                    currentPort.SendString($"o1901.{SetValueCounter}={dataItem.SetValue}");
                    currentPort.SendString($"o1904.{DelayTimeCounter}={dataItem.DelayTime}");
                    currentPort.SendString($"o1904.{KeepTimeCounter}={dataItem.KeepTime}");
                    SetValueCounter++;
                    DelayTimeCounter++;
                    KeepTimeCounter++;
                }

            }


            catch (NullReferenceException ex)
            {
                MessageBox.Show("Error in Writing Data to PLC \n" + ex.Message);
            }
        }

        public void PowerOnButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentPort = SerialPortManager.Instance;
                currentPort.SendString("o1903.2=1");
                PowerIsOn = true;
                UpdateMachineStatus();
            }
            catch (NullReferenceException ex)
            {
                MessageBox.Show("Error While powering a Motor" + ex.Message);
            }

        }

        public void PowerOffButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                var currentPort = SerialPortManager.Instance;
                if (currentPort == null || !currentPort.IsOpen)
                {
                    MessageBox.Show("Please start open the port first");
                    return;
                }

                currentPort.SendString("o1903.2=0");
                PowerIsOn = false;
                UpdateMachineStatus();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Error While doing Power OFF" + ex.Message);
            }
        }

        public void ReturnHome_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (PowerIsOn)
                {
                    var currentPort = SerialPortManager.Instance;
                    if (currentPort == null || !currentPort.IsOpen)
                    {
                        MessageBox.Show("Please start open the port first");
                        return;
                    }
                    currentPort.SendString("o1903.6=1");
                }
                else
                    MessageBox.Show("Please Power the Motor first");

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("Error while tyring to go back home" + ex.Message);
            }
        }

        public void StopButton_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentPort = SerialPortManager.Instance;
                if (currentPort == null || !currentPort.IsOpen)
                {
                    MessageBox.Show("Please start open the port first");
                    return;
                }
                currentPort.SendString("o1903.8=1");
                _Stopped = true;
                UpdateMachineStatus();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        public void ResetButton_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentPort = SerialPortManager.Instance;
                if (currentPort == null || !currentPort.IsOpen)
                {
                    MessageBox.Show("Please start open the port first");
                    return;
                }
                currentPort.SendString("o1903.3=1");//for resetting the error
                Thread.Sleep(50);
                currentPort.SendString("o1903.2=0");//for powering off the machine
                Thread.Sleep(50);
                currentPort.SendString("o1903.8=0");//for resetting the stop and releasing the motor
                Thread.Sleep(50);
                currentPort.SendString("o1903.6=0");//for resetting the homming
                Thread.Sleep(50);
                currentPort.SendString("o1903.7=0");//for resetting the start button
                Thread.Sleep(50);
                currentPort.SendString("o1903.3=0");//for resetting the resetbutton
                UpdateMachineStatus();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Error while doing Reset" + ex.Message);
            }

        }

        public void UpdateMachineStatus()
        {
            if (_Stopped)
                PowerStatusOfMachine = "Machine is Stopped, Do Reset";
            else
            {
                if (PowerIsOn)
                    PowerStatusOfMachine = "Machine is Powered ON";
                else
                    PowerStatusOfMachine = "Machine is Powered OFF";
            }
        }

        public void StartButton_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentPort = SerialPortManager.Instance;

                if (currentPort == null || !currentPort.IsOpen)
                {
                    MessageBox.Show("Please open the port first to start");
                    return;
                }
                currentPort.SendString("o1903.7=1");
                _Stopped = false;
                Task.Run(() =>
                {
                    while (!_Stopped)
                    {
                        currentPort.SendString("o680.5");
                        Thread.Sleep(1000);
                    }
                });

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void CurrentPort_OnDataReceived(object sender, string e)
        {
            RawDataFromSerialPort.Add(e);
            double data;
            try
            {
                data = double.Parse(e);
                if (data < 6100 || data > 6330)
                {
                    return;
                }
                _outputData.Add(data);
                RefreshOutputGraph();
            }
            catch (FormatException)
            {
                return;
                //MessageBox.Show("Invalid data from serial port");
            }

        }

        private void RefreshOutputGraph()
        {
            RealCoordinatePoints = new List<DataPoint>();
            RealCoordinatePoints.Add(new DataPoint(0, 0));
            int time = 0;
            foreach (var data in _outputData)
            {
                time++;
                RealCoordinatePoints.Add(new DataPoint(time, data - 6130));
            }
        }

        public void SavePlottedData_Clicked(object sender, RoutedEventArgs e)
        {
            var fileDialog = new SaveFileDialog();
            fileDialog.Filter = "Text documents(.txt) | *.txt";
            fileDialog.DefaultExt = "*.txt";
            var result = fileDialog.ShowDialog();

            if (result == true)
            {
                File.WriteAllLines(fileDialog.FileName, _outputData.Select((v, i) => $"{i + 1}, {v.ToString()}"));
            }
        }

        public void SaveRawData_Clicked(object sender, RoutedEventArgs e)
        {
            var fileDialog = new SaveFileDialog();
            fileDialog.Filter = "Text documents(.txt) | *.txt";
            fileDialog.DefaultExt = "*.txt";
            var result = fileDialog.ShowDialog();

            if (result == true)
            {
                File.WriteAllLines(fileDialog.FileName, RawDataFromSerialPort.Select((v, i) => $"{i + 1}, {v.ToString()}"));
            }
        }

        //private void AddOutputData(object sender, SerialDataReceivedEventArgs e)
        //{

        //    var data = _portManager.GetCurrentPort().Read();

        //    var logfile = ConfigurationManager.AppSettings["log_file"].ToString();
        //    using (StreamWriter w = File.AppendText(logfile))
        //    {
        //        w.WriteLine(data);
        //    }

        //    try
        //    {
        //        var value = double.Parse(data);
        //        //if (value < 6100 || value > 6330) 
        //        //{
        //        //    return;
        //        //}

        //        _outputData.Add(value);
        //        RefreshOutputGraph();
        //        Console.WriteLine(string.Join(",", _outputData));
        //    }
        //    catch (FormatException el)
        //    {
        //        _outputData.Add(500);
        //    }
        //}

        #endregion
    }
}
