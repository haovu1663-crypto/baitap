using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using DevExpress.Xpf.Core;

namespace thuchanh {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : ThemedWindow {
        public MainWindow() {
            InitializeComponent();
            
        }
        private void LoadUserControl(System.Windows.Controls.UserControl uc)
        {
            stackPanelContainer.Children.Clear();
            stackPanelContainer.Children.Add(uc);
        }

        private void Theloai_Click(object sender, RoutedEventArgs e)
        {
            LoadUserControl(new Theloai());
        }

        private void Sach_Click(object sender, RoutedEventArgs e)
        {
            LoadUserControl(new Sach());
        }

        private void Hoadon_Click(object sender, RoutedEventArgs e)
        {
            LoadUserControl(new Hoadon());
        }
    }
}
