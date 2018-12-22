using HeiswayiNrird.MVVM.Common;
using System.Collections.Generic;

namespace ParkerCompax3UI.Model
{

    public class InputData : ViewModelBase

    {

        public InputData(double dSetValue, double dDelayTime, double dKeepTime)
        {
            SetValue = dSetValue;
            DelayTime = dDelayTime;
            KeepTime = dKeepTime;
        }
        public double SetValue { set; get; }
        public double DelayTime { set; get; }
        public double KeepTime { set; get; }
    }
}

