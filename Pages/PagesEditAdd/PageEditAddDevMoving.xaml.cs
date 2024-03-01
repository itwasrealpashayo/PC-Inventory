using PCInventory.Database;
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

namespace PCInventory.Pages.PagesEditAdd
{
    /// <summary>
    /// Логика взаимодействия для PageEditAddDevMoving.xaml
    /// </summary>
    public partial class PageEditAddDevMoving : Page
    {
        public DeviceMoving currentDeviceMoving = new DeviceMoving();

        public PageEditAddDevMoving(DeviceMoving _selectedDeviceMoving)
        {
            InitializeComponent();
            CmbDeviceName.ItemsSource = DatabaseEntities.GetContext().Device.ToList();
            CmbUser.ItemsSource = DatabaseEntities.GetContext().User.ToList();
            CmbWorkplaceName.ItemsSource = DatabaseEntities.GetContext().Workplace.ToList();

            if (_selectedDeviceMoving != null)
                currentDeviceMoving = _selectedDeviceMoving;
            DataContext = currentDeviceMoving;
        }

        private void DtpDevDropingDate_Loaded(object sender, RoutedEventArgs e)
        {
            DatePicker datePicker = sender as DatePicker;

            if (datePicker != null && (datePicker.SelectedDate == null || datePicker.SelectedDate == DateTime.MinValue))
            {
                datePicker.SelectedDate = DateTime.Today;
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (CmbUser.SelectedItem == null)
                errors.AppendLine("Укажите исполнителя перемещения!");
            if (CmbWorkplaceName.SelectedItem == null)
                errors.AppendLine("Выберите рабочее место!");
            if (DtpDevMovingDate.SelectedDate == null)
                errors.AppendLine("Укажите дату перемещения!");
            if (CmbDeviceName.SelectedItem == null)
                errors.AppendLine("Выберите оборудование!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (currentDeviceMoving.DeviceMovingID == 0)
            {
                try
                {
                    DatabaseEntities.GetContext().DeviceMoving.Add(currentDeviceMoving);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }

            try
            {
                DatabaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!", "Информация",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                Manager.SecondFrame.Navigate(new PageDevMoving());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageDevMoving());
        }

    }
}
