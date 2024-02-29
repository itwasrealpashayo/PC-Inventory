using PCInventory.Database;
using PCInventory.Pages.PagesEditAdd;
using PCInventory.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PCInventory.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageTypeDevices.xaml
    /// </summary>
    public partial class PageTypeDevices : Page
    {
        public PageTypeDevices()
        {
            InitializeComponent();
            DataGridDeviceType.ItemsSource = DatabaseEntities.GetContext().DeviceType.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.SecondFrame.Navigate(new PageEditAddDeviceType());
        }
    }
}
